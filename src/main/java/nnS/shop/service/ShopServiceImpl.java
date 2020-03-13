package nnS.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import nnS.shop.dao.ShopDAO;
import nnS.common.dao.InformDAO;
import nnS.common.util.FileUtils;

@Service("shopService")
public class ShopServiceImpl implements ShopService {
	
	@Resource(name="informDAO")
	private InformDAO informDAO;
	
	@Resource(name="shopDAO")
	private ShopDAO shopDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map, String keyword, String searchType, String sortType, String tstatus) throws Exception {
		if(searchType.equals("hash") && keyword != null) {
			map.put("keyword", hashConvert(keyword));
		}else {
			map.put("keyword", keyword);
		}
		
		//map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("sortType", sortType);
		map.put("tstatus", tstatus);
		
		return shopDAO.selectGoodsList(map);
	}
	
	private String hashConvert(String hashStr) {
		String str = "";
		String[] arr;
		String resultStr = "";
		System.out.println("해시태그1 : " + hashStr);
		if(hashStr != null && hashStr.length() > 0) {
			str = hashStr.replace(" ", "#");
			if(!str.substring(0, 1).equals("#")) {
				str = "#" + str;
			}
			
			//#이 중복되는 경우 한개로 만들기 위한 작업
			arr = str.split("#");
			for(int i = 0; i < arr.length; i++) {
				if(arr[i] != null && !arr[i].equals("")) {
					resultStr += "#" + arr[i];
				}else {
					continue;
				}
			}
		}else {
			resultStr = "#";
		}
		
		
		System.out.println("해시태그2 : " + resultStr);
		return resultStr;
	}
	@Override
	public void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {
		//입력 받은 값을 해시태그로 변경하기 위한 과정
		String hash = hashConvert((String)map.get("GOODS_HASH"));
		map.put("GOODS_HASH", hash);
		// 내용에서 이미지 긁어오기 시작
		String img_templist=""; // 이미지 링크를 ','를 기준으로 냐열해둠, 아직 사용 안함
		String img_list[] = {}; // ','로 구분된 문자열을 나눠서 배열에 담음
		String img_thumb=""; // img_list의 첫번째 경로를 저장함
		String comp_text=" src=\"/nnS/file/"; // 반복문 안에 temp와 비교될 텍스느. equals(" src=\"")는 안되길래 따로 빼둠
		String content = (String)map.get("GOODS_CONTENT"); // 저장된 본문을 불러옴
		int imgCount = 0;
		for(int i = 0; i+16 < content.length(); i++) { // 텍스트 비교
			String temp=""; // 잘라진 텍스트가 임시로 들어갈 공간
			temp = content.substring(i,i+16); // content에서 잘라낸 텍스트를 temp에 저장
			if(temp.equals(comp_text)) { // temp와 temp_text가 같을 경우
				img_templist += content.substring(i+16, i+52)+","; // img_list에 잘라진 텍스트 추가 및 구분을 위한 쉼표 삽입
				imgCount++;
			}
		}
		if(img_templist!="") { // img_list가 비어있지 않을 경우			
			img_templist = img_templist.substring(0, img_templist.length()-1); // 경로 뒤에 남는 쉼표 제거
			img_thumb = img_templist.substring(0, 36); // 이미지가 있을 경우 첫번째 경로를 썸네일로 저장해줌
			map.put("GOODS_THUMBNAIL", img_thumb); // 썸네일 값 전달
		} else { // img_list가 비어이을 경우
			map.put("GOODS_THUMBNAIL",""); // 이미지 없음
		}
		// 내용에서 이미지 긁어오기 끝
		
		// 상품정보 등록 쿼리 실행
		shopDAO.insertGoods(map);
		System.out.println("****12132* " + map);
		
		// 상품 등록 시 IDX 값을 받아 이미지 테이블에 값들을 담아줌
		if(img_templist!="") { // img_list가 비어있지 않을 경우			
			img_list = img_templist.split(",");
			for(int i = 0 ; i<imgCount; i++) {
				map.put("FILES_STD", img_list[i]);
				System.out.println((i+1)+"번째업로드 ==========================================");
				shopDAO.insertFile(map); 
				System.out.println((i+1)+"번째업로드끝=========================================");
			}
		}
	}
	
	@Override
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception {
		shopDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = shopDAO.selectGoodsDetail(map);
		Map<String, Object> memberMap = shopDAO.selectMemberInfo(tempMap);
		
		resultMap.put("map", tempMap);
		resultMap.put("memberMap", memberMap);
		System.out.println("@@@@@@@@@@@@@@@@@"+tempMap);
		
		if(map.containsKey("LIKE_MEM_ID")) {
			Map<String, Object> goodsLikeMap = shopDAO.selectGoodsLike(map);
			resultMap.put("goodsLikeMap", goodsLikeMap);
		}
		
		List<Map<String, Object>> list = shopDAO.selectFileList(map);
		resultMap.put("list", list);
		 
		
		return resultMap;
	}
	
	@Override
	public void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception{
		shopDAO.updateGoods(map);
		
		map.put("IDX", map.get("GOODS_NUM"));

		shopDAO.deleteFileList(map);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String, Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				shopDAO.insertFile(tempMap);
			}else {
				shopDAO.updateFile(tempMap);
			}
		}
		
		shopDAO.insertGoodsThumbnail(map);
	}
	
	@Override
	public void deleteGoods(Map<String, Object> map) throws Exception {
		shopDAO.deleteGoods(map);
	}
	
	@Override
	public void insertGoodsLike(Map<String, Object> map) throws Exception{
		shopDAO.insertGoodsLike(map);
		informDAO.informInsert(map, "상대방이 내 상품을 좋아합니다.");
	}
	
	@Override
	public void deleteGoodsLike(Map<String, Object> map) throws Exception{
		shopDAO.deleteGoodsLike(map);
	}

}

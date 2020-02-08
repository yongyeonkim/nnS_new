package nnS.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import nnS.shop.dao.ShopDAO;
import nnS.common.util.FileUtils;

@Service("shopService")
public class ShopServiceImpl implements ShopService {
	
	@Resource(name="shopDAO")
	private ShopDAO shopDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map, String keyword, String searchType, String sortType) throws Exception {
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("sortType", sortType);
		return shopDAO.selectGoodsList(map);
	}
	
	@Override
	public void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {
		shopDAO.insertGoods(map);
		System.out.println("****12132* " + map);
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i = 0, size=list.size(); i < size; i++) {
			shopDAO.insertFile(list.get(i));
		}
		
		shopDAO.insertGoodsThumbnail(map);
		
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
	}
	
	@Override
	public void deleteGoodsLike(Map<String, Object> map) throws Exception{
		shopDAO.deleteGoodsLike(map);
	}

}

package nnS.myshop.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nnS.myshop.dao.MyshopDAO;
import nnS.report.dao.ReportDAO;

@Service("myshopService")
public class MyshopServiceImpl implements MyshopService{
	
	@Resource(name="myshopDAO")
	private MyshopDAO myshopDAO;
	
	@Override
	public List<Map<String, Object>> selectMyOrderList1(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMyOrderList1(map);
	}
	@Override
	public List<Map<String, Object>> selectMyOrderList2(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMyOrderList2(map);
	}
	@Override
	public List<Map<String, Object>> selectMyOrderList3(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMyOrderList3(map);
	}
	
	@Override
	public List<Map<String, Object>> selectMySaleList1(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMySaleList1(map);
	}
	@Override
	public List<Map<String, Object>> selectMySaleList2(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMySaleList2(map);
	}
	@Override
	public List<Map<String, Object>> selectMySaleList3(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMySaleList3(map);
	}
	
	@Override
	public List<Map<String, Object>> selectLikeList(Map<String, Object> map, String keyword, String searchType, String sortType, String tstatus) throws Exception {
		// TODO Auto-generated method stub
		if(searchType.equals("hash") && keyword != null) {
			map.put("keyword", hashConvert(keyword));
		}else {
			map.put("keyword", keyword);
		}
		
		//map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("sortType", sortType);
		map.put("tstatus", tstatus);
		
		return myshopDAO.selectLikeList(map);
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
	public List<Map<String, Object>> selectRecentGoodsList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectRecentGoodsList(map);
	}
	
	@Override
	public void insertDnum(Map<String, Object> map, HttpServletRequest request) throws Exception {
		myshopDAO.insertDnum(map);
	}

	@Override
	public void buyComplete(Map<String, Object> map, HttpServletRequest request) throws Exception {
		myshopDAO.buyComplete(map);
	}
	
	@Override
	public void orderCancel(Map<String, Object> map, HttpServletRequest request) throws Exception {
		myshopDAO.orderCancel(map);
	}
	@Override
	public Map<String, Object> selectReceipt(Map<String, Object> map) throws Exception {
		return myshopDAO.selectReceipt(map);
	}
	
}

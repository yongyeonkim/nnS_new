package nnS.myshop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

public interface MyshopService {
	
	public List<Map<String, Object>> selectMyOrderList1(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectMyOrderList2(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectMyOrderList3(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectLikeList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectRecentGoodsList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectMySaleList1(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectMySaleList2(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectMySaleList3(Map<String, Object> map) throws Exception;
	
	void insertDnum(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void buyComplete(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void orderCancel(Map<String, Object> map, HttpServletRequest request) throws Exception;

}

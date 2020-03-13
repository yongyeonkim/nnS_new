package nnS.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminOrderService {
	List<Map<String, Object>> orderList(Map<String, Object> map, String search) throws Exception;
	
	Map<String, Object> selectOrderModify(Map<String, Object> map) throws Exception;
	
	void updateOrderModify(Map<String, Object> map) throws Exception;
	
	void orderCancel(Map<String, Object> map, HttpServletRequest request)throws Exception; 

}

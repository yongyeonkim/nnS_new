package nnS.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import nnS.order.dao.OrderDAO;
import nnS.common.dao.InformDAO;
import nnS.common.util.FileUtils;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Resource(name="informDAO") 
	private InformDAO informDAO;
	
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public Map<String, Object> orderWriteForm(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> orderG = orderDAO.orderG(map);
		Map<String, Object> orderM = orderDAO.orderM(map); 
		
		resultMap.put("orderG", orderG);
		resultMap.put("orderM", orderM);
		
		List<Map<String, Object>> list = orderDAO.selectFileList(map);
		resultMap.put("list", list);
		
		Map<String, Object> inform = new HashMap<String, Object>();
		inform.put("IDX", orderG.get("GOODS_SELLER"));
		informDAO.informInsert(inform, "상품이 팔렸습니다.");
		
		return resultMap;
	}

	@Override
	public void insertOrder(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		orderDAO.insertOrder(map);
		
		
	}
	
	@Override
	public Map<String, Object> orderDetail(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> order = orderDAO.orderDetail(map);
		resultMap.put("order", order);
		
		Map<String, Object> orderG = orderDAO.orderG(map);
		Map<String, Object> orderM = orderDAO.orderM(map); 
		
		resultMap.put("orderG", orderG);
		resultMap.put("orderM", orderM);
		
		return resultMap;
		
	}
	
}

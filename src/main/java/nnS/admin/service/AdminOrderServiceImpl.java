package nnS.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import nnS.admin.dao.AdminOrderDAO;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {
	@Resource(name="AdminOrderDAO")
	private AdminOrderDAO adminOrderDAO;

	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> map,String search) throws Exception {
		// TODO Auto-generated method stub
		map.put("search",search);
		return adminOrderDAO.orderList(map);
	}

	@Override
	public Map<String, Object> selectOrderModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		return adminOrderDAO.selectOrderModify(map);
	}

	@Override
	public void updateOrderModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminOrderDAO.updateOrderModify(map);
		
	}

	public void orderCancel(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		adminOrderDAO.orderCancel(map);
		adminOrderDAO.cancelTstatus(map);
	}

	

}

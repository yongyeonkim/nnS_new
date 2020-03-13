package nnS.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import nnS.common.dao.AbstractDAO;

@Repository("AdminOrderDAO")
public class AdminOrderDAO extends AbstractDAO {
	
	public List<Map<String, Object>> orderList(Map<String, Object>map)throws Exception{
		return (List<Map<String, Object>>)selectPagingList("adminOrder.orderList",map);
	}
	public Map<String, Object> selectOrderModify(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("adminOrder.orderdetail", map);

	}
	public void updateOrderModify(Map<String, Object>map) throws Exception{
		update("adminOrder.updateorder",map);
	}
	public void orderCancel(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		update("adminOrder.orderCancel",map);
		
	}
	public void cancelTstatus(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		update("adminOrder.cancelTstatus",map);
	}
}

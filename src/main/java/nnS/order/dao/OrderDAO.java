package nnS.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import nnS.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderG(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("order.orderWriteG", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderM(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("order.orderWriteM", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("shop.selectFileList", map);
	}

	public void insertOrder(Map<String, Object> map) throws Exception{
		insert("order.insertOrder", map);
		update("shop.updateGoodsTstatus", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("order.orderDetail", map);
	}
	
}

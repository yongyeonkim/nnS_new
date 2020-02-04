package nnS.member.service;

import java.util.Map;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nnS.member.dao.LoginDAO;
import nnS.member.dao.MyPageDAO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myPageDAO")
	private MyPageDAO myPageDAO;
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	@Override
	public int selectPwCheck(Map<String, Object> map) throws Exception{
		return myPageDAO.selectPwCheck(map);
	}
	
	@Override
	public Map<String, Object> selectAccountInfo(Map<String, Object> map) throws Exception{
		return myPageDAO.selectAccountInfo(map);
	}
	
	@Override
	public void updateAccountModify(Map<String, Object> map) throws Exception{
		myPageDAO.updateAccountModify(map);
	}
	
	@Override
	public void updatePwModify(Map<String, Object> map) throws Exception{
		myPageDAO.updatePwModify(map);
	}
	
	@Override
	public void deleteAccount(Map<String, Object> map) throws Exception{
		myPageDAO.deleteAccount(map);
	}
	
	@Override
	public Map<String, Object> selectMyReportList(Map<String, Object> map) throws Exception{
		return myPageDAO.selectMyReportList(map);
	}
	
	@Override
	public Map<String, Object> selectMyReportDetail(Map<String, Object> map) throws Exception{
		return myPageDAO.selectMyReportDetail(map);
	}
	
	@Override
	public Map<String, Object> selectMyQnaList(Map<String, Object> map) throws Exception{
		return myPageDAO.selectMyQnaList(map);
	}
	
	@Override
	public Map<String, Object> selectMyQnaDetail(Map<String, Object> map) throws Exception{
		return myPageDAO.selectMyQnaDetail(map);
	}

}

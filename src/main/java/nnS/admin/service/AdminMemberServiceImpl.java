package nnS.admin.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import nnS.admin.dao.AdminMemberDAO;
import nnS.common.dao.InformDAO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="informDAO")
	private InformDAO informDAO;
	
	@Resource(name="adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
	@Override
	public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception {
		return adminMemberDAO.memberList(map);
	}
	
	@Override
	public List<Map<String, Object>> reportModifyList(Map<String, Object> map) throws Exception {
		return adminMemberDAO.reportModifyList(map);
	}
	
	@Override
	public Map<String, Object>selectMember(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) adminMemberDAO.selectMember(map);
	}
	
	@Override
	public void updateMemberInfo(Map<String, Object> map) throws Exception{
		adminMemberDAO.updateMemberInfo(map);
	}
	
	@Override
	public void memberDelete(Map<String, Object> map) throws Exception{
		adminMemberDAO.memberDelete(map);
	}
	
	@Override
	public List<Map<String, Object>> reportList(Map<String, Object> map) throws Exception {
		return adminMemberDAO.reportList(map);
	}
	
	@Override
	public void updateReport(Map<String, Object> map) throws Exception{
		adminMemberDAO.updateReport(map);
		 informDAO.informInsert(map, "내 신고글에 처리상태가 변경되었습니다.");
	     informDAO.informInsert2(map, "회원님에 신고가 처리되었습니다.");
	}
	
	@Override
	public void deleteReport(Map<String, Object> map) throws Exception{
		adminMemberDAO.deleteReport(map);
	}
}

package nnS.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nnS.member.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	@Override
	public int selectEmailCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectEmailCheck(map);
	}
	
	@Override
	public int selectIdCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		String memId = (String) map.get("MEM_ID");
		
		if(memId.length()<5) {
			return 1;
		}
		for(int i=0; memId.length()>i; i++) {
			if(memId.charAt(i) >= 0x61 && memId.charAt(i) <= 0x7A) {
				// 영문 소문자
			} else if (memId.charAt(i) >= 0x41 && memId.charAt(i) <= 0x5A) {
				// 영문 대문자
			} else if (memId.charAt(i) >= 0x30 && memId.charAt(i) <= 0x39) {
				//숫자
			} else {
				return 1;
			}
		}
		
		return joinDAO.selectIdCheck(map);
	}

	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertMember(map);
	}

	@Override
	public void verifyMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.verifyMember(map);
	}


}

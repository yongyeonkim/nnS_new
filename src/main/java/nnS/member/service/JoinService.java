package nnS.member.service;

import java.util.Map;

public interface JoinService {
	
	public int selectIdCheck(Map<String, Object> map) throws Exception;

	void insertMember(Map<String, Object> map) throws Exception;

	void verifyMember(Map<String, Object> map) throws Exception;


}

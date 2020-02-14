package nnS.comment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nnS.comment.dao.CommentDAO;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commentDAO")
	private CommentDAO commentDAO;

	@Override
	public List<Map<String, Object>> selectBoardCommentList(Map<String, Object> map) throws Exception {
		return commentDAO.selectBoardCommentList(map);
	}

	@Override
	public void insertBoardComment(Map<String, Object> map) throws Exception {
		commentDAO.insertBoardComment(map);
	}

	@Override
	public void deleteBoardComment(Map<String, Object> map) throws Exception {
		commentDAO.deleteBoardComment(map);
	}

	@Override
	public List<Map<String, Object>> selectGoodsCommentList(Map<String, Object> map) throws Exception {
		return commentDAO.selectGoodsCommentList(map);
	}

	@Override
	public void insertGoodsComment(Map<String, Object> map) throws Exception {
		commentDAO.insertGoodsComment(map);
	}

	@Override
	public void deleteGoodsComment(Map<String, Object> map) throws Exception {
		commentDAO.deleteGoodsComment(map);
	}

	@Override
	public Map<String, Object> selectGoodsCommentDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = commentDAO.selectGoodsCommentDetail(map);
		resultMap.put("map", tempMap);
		resultMap.put("reply", tempMap.get("COMMENTS_REPLY"));
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectGoodsCommentReply(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = commentDAO.selectGoodsCommentReply(map);
		resultMap.put("map", tempMap);
		
		return resultMap;
	}

	@Override
	public void insertGoodsCommentReply(Map<String, Object> map) throws Exception {
		commentDAO.insertGoodsCommentReply(map);
	}

	@Override
	public void deleteGoodsCommentReply(Map<String, Object> map) throws Exception {
		commentDAO.deleteGoodsCommentReply(map);
	}

	@Override
	public void insertGoodsCommentStat(Map<String, Object> map) throws Exception {
		commentDAO.insertGoodsCommentStat(map);
	}

	@Override
	public void deleteGoodsCommentStat(Map<String, Object> map) throws Exception {
		commentDAO.deleteGoodsCommentStat(map);
	}
}

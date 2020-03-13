package nnS.comment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import nnS.comment.service.CommentService;
import nnS.common.common.CommandMap;

@Controller
public class CommentController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commentService")
	private CommentService commentService;

	// 문의 리스트
	@RequestMapping(value="/shop/goodsDetail/commentList")
	public ModelAndView goodsCommentPaging(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = commentService.selectGoodsCommentList(commandMap.getMap());
		mv.addObject("list", list);
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	// 문의 입력
	@RequestMapping(value="/shop/goodsDetail/commentWrite")
	public ModelAndView shopCommentWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");
		
		commentService.insertGoodsComment(commandMap.getMap());
		
		mv.addObject("GOODS_NUM", commandMap.get("COMMENTS_PARENT"));
		
		return mv;
	}
	
	// 문의 삭제
	@RequestMapping(value="/shop/goodsDetail/commentDelete")
	public ModelAndView shopCommentDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");
		commentService.deleteGoodsComment(commandMap.getMap());
		
		mv.addObject("GOODS_NUM", commandMap.get("GOODS_NUM"));
		
		return mv;
	}

	// 문의 상세보기
	@RequestMapping(value="/shop/goodsDetail/commentDetail", method=RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public ModelAndView shopCommentDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(false);
		commandMap.put("MEM_INFO", session.getAttribute("session_MEM_INFO")); 
		ModelAndView mv = new ModelAndView("jsonView");
		System.out.println("commandMap=========================="+commandMap.getMap());
		
		Map<String, Object> cMap = commentService.selectGoodsCommentDetail(commandMap.getMap());
		System.out.println(cMap.get("map"));
		String a = (String) cMap.get("reply");
		
		if(a.contentEquals("Y")) {
			Map<String, Object> rMap = commentService.selectGoodsCommentReply(commandMap.getMap());
			mv.addObject("rMap", rMap.get("map"));
			System.out.println("rMap=========================="+rMap.get("map"));
		}
		
		mv.addObject("cMap", cMap.get("map"));
		mv.addObject("G_MEM_ID",commandMap.getMap().get("MEM_ID"));
		
		System.out.println("cMap=========================="+cMap.get("map"));
		
		return mv;
	}
	
	// 문의 답변 입력
	@RequestMapping(value="/shop/goodsDetail/commentReplyWrite")
	public ModelAndView shopCommentDetailWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");
		commentService.insertGoodsCommentReply(commandMap.getMap());
		commentService.insertGoodsCommentStat(commandMap.getMap());
		System.out.println(commandMap.getMap());
		mv.addObject("GOODS_NUM", commandMap.get("GOODS_NUM"));
		mv.addObject("COMMENTS_NUM", commandMap.get("COMMENTS_RNUM"));
		mv.addObject("G_MEM_ID", commandMap.get("G_MEM_ID"));
		return mv;
	}
	
	// 문의 답변 삭제
	@RequestMapping(value="/shop/goodsDetail/commentReplyDelete")
	public ModelAndView shopCommentDetailDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail/commentDetail");
		
		System.out.println(commandMap.getMap());
		
		commentService.deleteGoodsCommentReply(commandMap.getMap());
		commentService.deleteGoodsCommentStat(commandMap.getMap());
		mv.addObject("COMMENTS_NUM", commandMap.get("COMMENTS_RNUM"));
		mv.addObject("G_MEM_ID", commandMap.get("G_MEM_ID"));
		
		return mv;
	}
	
	
	@RequestMapping(value="/community/boardDetail/commentList")
	public ModelAndView boardCommentPaging(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = commentService.selectBoardCommentList(commandMap.getMap());
		mv.addObject("list", list);
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	@RequestMapping(value="/community/boardDetail/commentWrite")
	public ModelAndView boardCommentWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/community/boardDetail");
		
		commentService.insertBoardComment(commandMap.getMap());
		
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
		
		return mv;
	}
	
	@RequestMapping(value="/community/boardDetail/commentDelete")
	public ModelAndView boardCommentDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/community/boardDetail");
		commentService.deleteBoardComment(commandMap.getMap());
		
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
		
		return mv;
	}
	
}

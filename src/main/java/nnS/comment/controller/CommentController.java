package nnS.comment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nnS.comment.service.CommentService;
import nnS.common.common.CommandMap;

@Controller
public class CommentController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commentService")
	private CommentService commentService;

	@RequestMapping(value="/shop/goodsDetail/commentWrite")
	public ModelAndView shopCommentWrite() throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");

		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDetail/commentDelete")
	public ModelAndView shopCommentDelete() throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");

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

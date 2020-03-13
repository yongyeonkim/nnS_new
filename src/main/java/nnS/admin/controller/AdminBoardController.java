package nnS.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.CommandMap;
import nnS.admin.service.AdminBoardServiceImpl;

@Controller
public class AdminBoardController {
	
	@Resource(name="adminBoardService")
	private AdminBoardServiceImpl adminBoardService;
	
	//자유게시판
	@RequestMapping(value="/admin/boardListPaging")
	public ModelAndView boardListPaging(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String,Object>> list = adminBoardService.boardList(commandMap.getMap());
		mv.addObject("list",list);	
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    		System.out.println(list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		return mv;
	}
	
	@RequestMapping(value="/admin/boardList")
	public ModelAndView boardList() throws Exception{
		ModelAndView mv = new ModelAndView("adboardList");
		
		return mv;
	}
	
	//자유게시글 삭제하기
	@RequestMapping(value="/admin/adBoardDelete")
	public ModelAndView boardDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/boardList");
		adminBoardService.deleteBoard(commandMap.getMap());
				 
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
					
		return mv;	
	}
	
	//공지사항
	@RequestMapping(value="/admin/noticeListPaging")
	public ModelAndView noticeListPaging(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> list = adminBoardService.noticeList(commandMap.getMap());
		mv.addObject("noticeList",list);	
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    		System.out.println(list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}	
		return mv;
	}
	
	@RequestMapping(value="/admin/noticeList")
	public ModelAndView noticeList() throws Exception{
		ModelAndView mv = new ModelAndView("adnoticeList");
		
		return mv;
	}
	
	//공지사항 삭제하기
	@RequestMapping(value="/admin/adNoticeDelete")
	public ModelAndView noticeDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList");
		adminBoardService.deleteNotice(commandMap.getMap());
				 
		mv.addObject("NOTICE_NUM", commandMap.get("NOTICE_NUM"));
					
		return mv;	
	}	
	
	//qna
	@RequestMapping(value="/admin/qnaListPaging")
	public ModelAndView qnaListPaging(@RequestParam(value = "search", defaultValue="") String search,@RequestParam(value = "type", defaultValue="") String type, HttpServletRequest request,CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		request.setAttribute("search", search);
		request.setAttribute("type", type);
		List<Map<String,Object>> list = adminBoardService.qnaList(commandMap.getMap());
		mv.addObject("qnaList",list);	
		System.out.println("************"+type);
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    		System.out.println(list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}	
		return mv;
	}
	
	@RequestMapping(value="/admin/qnaList")
	public ModelAndView qnaList(@RequestParam(value = "search", defaultValue="") String search,@RequestParam(value = "type", defaultValue="") String type, HttpServletRequest request,CommandMap commandMap) throws Exception{
		request.setAttribute("search", search);
		request.setAttribute("type", type);
		ModelAndView mv = new ModelAndView("adqnaList");
		return mv;
	}
	
	//qna 삭제하기
	@RequestMapping(value="/admin/adQnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaList");
		adminBoardService.deleteQna(commandMap.getMap());
				 
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
					
		return mv;	
	}
	
	@RequestMapping(value="/admin/qnaPro")
	public ModelAndView qnaPro(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/qnaPro");
		Map<String, Object> map = adminBoardService.selectReport(commandMap.getMap());
		System.out.println(map);
		mv.addObject("map", map);
		return mv;	
	}
	
	@RequestMapping(value="/admin/qnaRePro")
	public void qnaRePro(CommandMap commandMap) throws Exception{
		
		adminBoardService.qnaRePro(commandMap.getMap());
		
	}
}

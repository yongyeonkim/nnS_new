package nnS.qna.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nnS.qna.service.QnaServiceImpl;
import nnS.common.common.CommandMap;

@Controller
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnaServiceImpl qnaService;

	@RequestMapping(value = "/myPage/qnaList")
	public ModelAndView myQnaList(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("myqnaList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		String url = "";
		List<Map<String,Object>> list = qnaService.selectMyQnaList(commandMap.getMap());
		url = "myPage";//myPage용 탭메뉴보이기
		mv.addObject("url",url);
		mv.addObject("list", list);
		return mv;
		}
	
	@RequestMapping(value = "/community/qnaList")
	public ModelAndView qnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("qnaList");
		
		String url = "";
		List<Map<String,Object>> list = qnaService.selectQnaList(commandMap.getMap());
		url = "community";//community용 탭메뉴보이기
		mv.addObject("url",url);
		mv.addObject("list", list);
		
		return mv;
	}

	
	  @RequestMapping(value = "/community/qnaDetail") 
	  public ModelAndView qnaDetail(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		  ModelAndView mv = new ModelAndView("qnaDetail");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		  
		  Map<String,Object> map = qnaService.selectQnaDetail(commandMap.getMap());
		  List<Map<String,Object>>list=qnaService.selectQnaAnswer(commandMap.getMap());
		  
		  mv.addObject("session_MEM_ID",map.get("MEM_ID"));
		  mv.addObject("asList",list);//qnaAnswer
		  mv.addObject("map", map.get("map"));//qna글
		  mv.addObject("list",map.get("list"));//파일
		  
		  return mv; 
	  }
	 
	
	@RequestMapping(value = "/community/qnaWriteForm")
	public ModelAndView qnaWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("qnaWriteForm");
		
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaWrite")
	public ModelAndView qnaWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/qnaDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		qnaService.insertQnaBoard(commandMap.getMap(),request);
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaModifyForm")
	public ModelAndView qnaModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("qnaModifyForm");
		Map<String,Object> map = qnaService.selectQnaDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaModify")
	public ModelAndView qnaModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/qnaDetail");
		
		qnaService.updateQna(commandMap.getMap(),request);
		
		mv.addObject("QNA_NUM",commandMap.get("QNA_NUM"));
		
		
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/qnaList");
		qnaService.deleteQna(commandMap.getMap());
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaDetail/answerWrite")
	public ModelAndView qnaAnswerWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {//관리자만 가능하게 어떻게?
		
		ModelAndView mv = new ModelAndView("redirect:/community/qnaDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		qnaService.insertQnaAnswer(commandMap.getMap());
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		return mv;		
	}
	
	@RequestMapping(value = "/community/qnaDetail/answerDelete")
	public ModelAndView qnaAnswerDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/qnaDetail");
		mv.addObject("QNA_NUM", commandMap.getMap().get("Q_QNA_NUM"));
		
		qnaService.deleteQna(commandMap.getMap());
		
		return mv;		
	}
	
}

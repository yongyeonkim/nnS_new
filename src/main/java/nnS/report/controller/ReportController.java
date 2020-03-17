package nnS.report.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.CommandMap;
import nnS.report.service.ReportServiceImpl;

@Controller
public class ReportController {
   Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reportService")
	private ReportServiceImpl reportService;

	@RequestMapping(value="/community/reportWriteForm")
	public ModelAndView reportWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("reportWriteForm");
		mv.addObject("GOODS_NUM", commandMap.get("GOODS_NUM"));

		return mv;
	}
	
	@RequestMapping(value="/community/reportWrite")
	public ModelAndView reportWrite(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/community/reportList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		
		reportService.insertReportBoard(commandMap.getMap(),request);
		
		return mv;		
	}
	
    @RequestMapping(value = {"/myPage/reportListPaging","/community/reportListPaging"})
    public ModelAndView reportListPaging(CommandMap commandMap,@RequestParam(value = "search", defaultValue="") String search, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, HttpServletRequest request) throws Exception {
       ModelAndView mv = new ModelAndView("jsonView");
       
       if(request.getServletPath().equals("/myPage/reportListPaging")) {
          HttpSession session = request.getSession();
          commandMap.put("session_MEM_ID", session.getAttribute("session_MEM_ID"));
       }
       List<Map<String,Object>> list = reportService.selectReportList(commandMap.getMap(), search, keyword, searchType);
       mv.addObject("list", list);
       
       if(list.size() > 0){
           mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
        }
        else{
           mv.addObject("TOTAL", 0);
        }
       return mv;
    } 
   
    @RequestMapping(value ="/community/reportList")
    public ModelAndView reportList(@RequestParam(value = "search", defaultValue="") String search, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, HttpServletRequest request) throws Exception {
       ModelAndView mv = new ModelAndView("reportList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
       request.setAttribute("search", search);
       return mv;
    }
   
    @RequestMapping(value = "/myPage/reportList")
    public ModelAndView reportMyList(@RequestParam(value = "search", defaultValue="") String search, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, HttpServletRequest request) throws Exception {
       ModelAndView mv = new ModelAndView("myreportList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
       request.setAttribute("search", search);
       return mv;
    }

	@RequestMapping(value = "/community/reportDetail")
	public ModelAndView reportDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("reportDetail");
		
		Map<String,Object> map = reportService.selectReportDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list",map.get("list"));
		
		return mv;		
	}
	
	@RequestMapping(value = "/myPage/reportDetail")
	public ModelAndView reportMyDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("myreportDetail");
		
		Map<String,Object> map = reportService.selectReportDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list",map.get("list"));
		
		return mv;		
	}
	
	
	@RequestMapping(value = "/community/reportDelete")
	public ModelAndView reportDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/reportList");
		
		reportService.deleteReport(commandMap.getMap());
		return mv;		
	}
	
	@RequestMapping(value = "/community/reportDetail/reportHandle")
	public ModelAndView reportHandle(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/reportList");
	  	reportService.updateStatus(commandMap.getMap());
		return mv;      
	}
	
}

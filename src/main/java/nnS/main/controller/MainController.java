package nnS.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.Service.InformServiceImpl;
import nnS.common.common.CommandMap;


@Controller
public class MainController {
   
   @Resource(name="informService")
   InformServiceImpl informService;

   @RequestMapping(value="/main")
   public ModelAndView main(CommandMap commandMap, HttpServletRequest request, @RequestParam(value = "tstatus", defaultValue="") String tstatus, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType) throws Exception{
   	ModelAndView mv = new ModelAndView("main");
   		
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("tstatus", tstatus);
		request.setAttribute("sortType", "all");
      return mv;
    }
   
   @RequestMapping(value="/inform", method=RequestMethod.GET)
    @ResponseBody
    public ModelAndView inform(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView("jsonView");
      request.getRequestURI();
      HttpSession session = request.getSession();
   
      if(session.getAttribute("session_MEM_ID")!= null) {
         commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
         List<Map<String,Object>> list = informService.informList(commandMap.getMap());
         
         mv.addObject("list",list);
         
         if(list.size() > 0){
     		mv.addObject("TOTAL", list.size());
     	}
         
      }
        
      return mv;
   }
   
   @RequestMapping(value = "/inform/confirm", method =RequestMethod.GET)
   @ResponseBody
   public ModelAndView reportDelete(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("jsonView");
      informService.informCofirm(commandMap.getMap());
      return mv;
      
   }
}
      
      
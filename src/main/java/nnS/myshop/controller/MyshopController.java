package nnS.myshop.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.CommandMap;
import nnS.myshop.service.MyshopService;;

@Controller
public class MyshopController {
	
	@Resource(name="myshopService") 
	   private MyshopService myshopService;

	@RequestMapping(value="/myshop")
	public ModelAndView myshopMain(CommandMap commandMap, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		List<Map<String,Object>> list = myshopService.selectMyOrderList(commandMap.getMap());
		System.out.println(list); 
		ModelAndView mv = new ModelAndView("orderList");
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping(value="/myshop/saleList")
	public ModelAndView myshopSaleList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		List<Map<String,Object>> list = myshopService.selectMyGoodsList(commandMap.getMap());
		System.out.println(list); 
		ModelAndView mv = new ModelAndView("saleList");
		mv.addObject("list",list);
		String filePath_temp = request.getSession().getServletContext().getRealPath("") + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		return mv;
	}

	@RequestMapping(value="/myshop/goodsLikeList")
	public ModelAndView myshopGoodsLikeList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		List<Map<String,Object>> list = myshopService.selectLikeList(commandMap.getMap());
		System.out.println(list); 
		ModelAndView mv = new ModelAndView("goodsLikeList");
		mv.addObject("list",list);
		return mv;
	}

	@RequestMapping(value="/myshop/recentGoodsList")
	public ModelAndView myshopRecentGoodsList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		List<Map<String,Object>> list = myshopService.selectRecentGoodsList(commandMap.getMap());
		System.out.println(list); 
		ModelAndView mv = new ModelAndView("recentGoodsList");
		mv.addObject("list",list);
		return mv;
	}

}

package nnS.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nnS.admin.service.AdminOrderServiceImpl;
import nnS.common.common.CommandMap;
import nnS.myshop.service.MyshopService;

@Controller
public class AdminOrderController {
	
	@Resource(name="adminOrderService")
	private AdminOrderServiceImpl adminOrderService;
	
	@RequestMapping("/admin/orderListPaging")
	public ModelAndView orderListPaging(CommandMap commandMap,@RequestParam(value = "search", defaultValue="") String search, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		request.setAttribute("search", search);
		
		List<Map<String,Object>> list = adminOrderService.orderList(commandMap.getMap(),search);
		mv.addObject("list",list);	
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    		System.out.println(list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		request.setAttribute("search", search);
		
		
		return mv;
		}
	
	@RequestMapping("/admin/orderList")
	public ModelAndView orderList(CommandMap commandMap,@RequestParam(value = "search", defaultValue="") String search, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("adorderList");
		request.setAttribute("search", search);
		
		return mv;
		}
	@RequestMapping("/admin/orderModify")
	public ModelAndView orderModify(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("adorderModify");
		Map<String,Object> map = adminOrderService.selectOrderModify(commandMap.getMap());
		mv.addObject("map",map);
		return mv;
	}
	
	@RequestMapping("/admin/orderModifyPro")
  	public ModelAndView memberModifyPro(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/orderList");
		adminOrderService.updateOrderModify(commandMap.getMap());
		return mv;
  	}
	
	@RequestMapping(value="/admin/orderCancel")
	public ModelAndView orderCancle(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/orderList");

		adminOrderService.orderCancel(commandMap.getMap(), request);
		
		return mv;
	}
}

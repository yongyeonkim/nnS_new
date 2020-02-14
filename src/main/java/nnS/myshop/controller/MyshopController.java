package nnS.myshop.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		ModelAndView mv = new ModelAndView("orderList");
		return mv;
	}
	
	@RequestMapping(value="/myshop/selectOrderList") 
	public ModelAndView selectOrderList(CommandMap commandMap, HttpServletRequest request, @RequestParam(value = "tabNo", defaultValue="") String tabNo) throws Exception { 
		ModelAndView mv = new ModelAndView("jsonView"); 
		HttpSession session = request.getSession(); 
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID")); 
		List<Map<String,Object>> list;
		
		if(tabNo.equals("1")) {
			list = myshopService.selectMyOrderList1(commandMap.getMap());
		}else if(tabNo.equals("2")) {
			list = myshopService.selectMyOrderList2(commandMap.getMap());
		}else if(tabNo.equals("3")) {
			list = myshopService.selectMyOrderList3(commandMap.getMap());
		}else {
			list = myshopService.selectMyOrderList1(commandMap.getMap());
			System.out.println("asdsaasd");
		}
		mv.addObject("list", list);
		mv.addObject("tabNo", tabNo);
		System.out.println(tabNo);
		
		if(list.size() > 0){ 
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		}
	  
		return mv; 
	}

	// 판매내역 조회
	@RequestMapping(value="/myshop/saleList")
	public ModelAndView saleList1(CommandMap commandMap, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		ModelAndView mv = new ModelAndView("saleList");
		return mv;
	}

	@RequestMapping(value="/myshop/selectSaleList")
	public ModelAndView myshopSaleList(CommandMap commandMap, HttpServletRequest request, @RequestParam(value = "tabNo", defaultValue="") String tabNo) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		String filePath_temp = request.getSession().getServletContext().getRealPath("") + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		List<Map<String,Object>> list;
		//asdasds
		if(tabNo.equals("1")) {
			list = myshopService.selectMySaleList1(commandMap.getMap());
		}else if(tabNo.equals("2")) {
			list = myshopService.selectMySaleList2(commandMap.getMap());
		}else if(tabNo.equals("3")) {
			list = myshopService.selectMySaleList3(commandMap.getMap());
		}else {
			list = myshopService.selectMySaleList1(commandMap.getMap());
			System.out.println("asdsaasd");
		}
		//asddadsa
		
		mv.addObject("list",list);
		mv.addObject("tabNo", tabNo);
		System.out.println(tabNo);
		
		if(list.size() > 0){  
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		}
		
		return mv;
	}
	
	@RequestMapping(value="/myshop/inputDnum")
	public ModelAndView inputDnum(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("saleList");

		myshopService.insertDnum(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/myshop/BuyComplete")
	public ModelAndView buyComplete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myshop");

		myshopService.buyComplete(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/myshop/orderCancel")
	public ModelAndView orderCancle(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myshop");

		myshopService.orderCancel(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/myshop/goodsLikeList")
	public ModelAndView myshopGoodsLikeList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsLikeList");
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		return mv;
	}
	
	@RequestMapping(value="/myshop/selectGoodsList")
	public ModelAndView selectGoodsList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		
		List<Map<String,Object>> list = myshopService.selectLikeList(commandMap.getMap());
    	mv.addObject("list", list);
        if(list.size() > 0){
            mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
        }
        else{
            mv.addObject("TOTAL", 0);
        }
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

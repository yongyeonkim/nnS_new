package nnS.order.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import nnS.common.common.CommandMap;
import nnS.order.service.OrderServiceImpl;

@Controller
public class OrderController {
	
	@Resource(name="orderService")
	private OrderServiceImpl orderService;
	
	@RequestMapping(value="/shop/order/orderWriteForm")
	public ModelAndView orderWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("orderWriteForm");
		
		Map<String,Object> map = orderService.orderWriteForm(commandMap.getMap());

		mv.addObject("orderG", map.get("orderG"));
		mv.addObject("orderM", map.get("orderM"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderWrite", method = RequestMethod.POST)
	public ModelAndView orderWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		orderService.insertOrder(commandMap.getMap(), request);
		Map<String,Object> map = orderService.orderDetail(commandMap.getMap());
		Map<String,Object> map2 = (Map<String, Object>) map.get("order");
		Map<String,Object> map3 = (Map<String, Object>) map.get("orderM");
		String redirectPath = "redirect:/shop/order/orderWrite_redirect?orderNum=" + map2.get("ORDERS_NUM") + "&goodsNum=" + map2.get("ORDERS_PRONUM") + "&memId=" + map3.get("MEM_ID");
		
		ModelAndView mv = new ModelAndView(redirectPath);

		mv.addObject("order", map.get("order"));
		mv.addObject("orderG", map.get("orderG"));
		mv.addObject("orderM", map.get("orderM"));
		System.out.println("@#222 "+ map);
		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderWrite_redirect")
	public ModelAndView orderWrite_redirect(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("orderWriteResult");
		String orderNum = request.getParameter("orderNum");
		String goodsNum = request.getParameter("goodsNum");
		String memId = request.getParameter("memId");
		System.out.println("@# "+ orderNum);
		
		commandMap.getMap().put("IDX", orderNum);
		commandMap.getMap().put("GOODS_NUM", goodsNum);
		commandMap.getMap().put("MEM_ID", memId);
		
		Map<String,Object> map = orderService.orderDetail(commandMap.getMap());
		mv.addObject("order", map.get("order"));
		mv.addObject("orderG", map.get("orderG"));
		mv.addObject("orderM", map.get("orderM"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderDetail")
	public ModelAndView orderDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/shop/order/orderDetail");

		Map<String,Object> map = orderService.orderDetail(commandMap.getMap());
		mv.addObject("order", map.get("order"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderModifyForm")
	public ModelAndView orderModifyForm() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/order/orderWriteForm");

		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderModify")
	public ModelAndView orderModify() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/order/orderWriteResult");

		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderDelete")
	public ModelAndView orderDelete() throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/allgoodsList");

		return mv;
	}
	
	//자동으로 결제 완료 되도록 하는 ajax를 위한 메소드
	@RequestMapping(value="/shop/order/payCheck", method=RequestMethod.GET)
	public ModelAndView payCheck(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		return mv;
	}

}

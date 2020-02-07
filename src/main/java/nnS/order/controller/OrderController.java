package nnS.order.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.CommandMap;
import nnS.shop.service.ShopServiceImpl;



@Controller
public class OrderController {
	
	@Resource(name="shopService")
	private ShopServiceImpl shopService;
	
	@RequestMapping(value="/shop/order/orderWriteForm")
	public ModelAndView orderWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/shop/order/orderWriteForm");
		
		//Map<String,Object> map = shopService.orderGoodsDetail(commandMap.getMap());
		//mv.addObject("map", map.get("map"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderWrite")
	public ModelAndView orderWrite() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/order/orderWriteResult");

		return mv;
	}
	
	@RequestMapping(value="/shop/order/orderDetail")
	public ModelAndView orderDetail() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/order/orderDetail");

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

}

package nnS.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.CommandMap;
import nnS.shop.service.ShopServiceImpl;

@Controller
public class ShopController{

	@Resource(name="shopService")
	private ShopServiceImpl shopService;
	
	@RequestMapping(value="/shop")
	public ModelAndView shopMain(@RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", "all");
		mv.addObject("sortType", "all");
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		return mv;
	}
	
	@RequestMapping(value="/shop/selectGoodsList")
	public ModelAndView selectGoodsList(CommandMap commandMap,@RequestParam(value = "tstatus", defaultValue="") String tstatus, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("검색어: " + keyword);
		System.out.println("검색타입: " + searchType);
    	List<Map<String,Object>> list = shopService.selectGoodsList(commandMap.getMap(), keyword, searchType, sortType, tstatus);
    	mv.addObject("list", list);
        if(list.size() > 0){
            mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
        }
        else{
            mv.addObject("TOTAL", 0);
        }
    	System.out.println("@@@@@"+sortType);
    	
    	System.out.println("%%% " + mv);
    	return mv;
	}
	
	@RequestMapping(value="/shop/allGoodsList")
	public ModelAndView shopAllGoodsList(@RequestParam(value = "tstatus", defaultValue="") String tstatus, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("tstatus", tstatus);
		request.setAttribute("sortType", "all");
		mv.addObject("sortType", "all");
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		return mv;
	}
	
	@RequestMapping(value="/shop/likeGoodsList")
	public ModelAndView shopLikeGoodsList(@RequestParam(value = "tstatus", defaultValue="") String tstatus, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("tstatus", tstatus);
		request.setAttribute("sortType", "like");
		mv.addObject("sortType", "like");
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		return mv;
	}
	
	@RequestMapping(value="/shop/viewGoodsList")
	public ModelAndView shopViewGoodsList(@RequestParam(value = "tstatus", defaultValue="") String tstatus, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("tstatus", tstatus);
		request.setAttribute("sortType", "view");
		mv.addObject("sortType", "view");
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsWriteForm")
	public ModelAndView goodsWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("goodsWriteForm");
		mv.addObject("request_type", "write");
		return mv;
	}

	@RequestMapping(value="/shop/goodsWrite", method = RequestMethod.POST)
	public ModelAndView goodsWrite(@RequestParam(value = "appType", defaultValue="") String appType, CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv;
		
		if(appType == "m" || appType.equals("m")) {
			mv = new ModelAndView("jsonView");
			commandMap.getMap().put("MEM_ID", request.getParameter("m_MEM_ID"));
			commandMap.getMap().put("GOODS_TITLE", request.getParameter("m_GOODS_TITLE"));
			commandMap.getMap().put("GOODS_CONTENT", request.getParameter("m_GOODS_CONTENT"));
			commandMap.getMap().put("GOODS_PRICE", request.getParameter("m_GOODS_PRICE"));
			commandMap.getMap().put("GOODS_REGION", request.getParameter("m_GOODS_REGION"));
			commandMap.getMap().put("GOODS_CATEGORY", request.getParameter("m_GOODS_CATEGORY"));
			commandMap.getMap().put("GOODS_HASH", request.getParameter("m_GOODS_HASH"));
			commandMap.getMap().put("GOODS_DCOST", request.getParameter("m_GOODS_DCOST"));
			commandMap.getMap().put("GOODS_BRAND", request.getParameter("m_GOODS_BRAND"));
			commandMap.getMap().put("GOODS_STATUS", request.getParameter("m_GOODS_STATUS"));
			
			shopService.writeToFile(request.getParameter("m_FILE_NAME"), request.getParameter("m_IMAGE_DATA"), request);
			//System.out.println("image data = "+request.getParameter("m_IMAGE_DATA"));
		}else {
			mv = new ModelAndView("redirect:/shop/goodsWrite_redirect");
		}
		
		//ModelAndView mv = new ModelAndView("redirect:/shop/goodsWrite_redirect");

		shopService.insertGoods(commandMap.getMap(), request);
		mv.addObject("IDX", commandMap.getMap().get("IDX"));
		
		return mv;
	}
	@RequestMapping(value="/shop/goodsWrite_redirect")
	public ModelAndView goodsWrite_redirect(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsWriteResult");

		mv.addObject("IDX", commandMap.getMap().get("IDX"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsModifyForm")
	public ModelAndView goodsModifyForm(@RequestParam(value = "appType", defaultValue="") String appType, HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mv;
		
		if(appType == "m" || appType.equals("m")) {
			mv = new ModelAndView("jsonView");
			//댓글 사용자 조회를 위한 MEM_ID
			//좋아요 여부 조회를 위한 LIKE_MEM_ID (세션)
			commandMap.getMap().put("MEM_ID", request.getParameter("m_MEM_ID"));
			commandMap.getMap().put("GOODS_NUM", request.getParameter("m_GOODS_NUM"));
			commandMap.getMap().put("LIKE_MEM_ID", request.getParameter("m_LIKE_MEM_ID"));
		}else {
			mv = new ModelAndView("goodsWriteForm");
		}
		
		//ModelAndView mv = new ModelAndView("goodsWriteForm");

		Map<String,Object> map = shopService.selectGoodsDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		mv.addObject("request_type", "modify");
		/* mv.addObject("list",map.get("list")); */
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsModify")
	public ModelAndView goodsModify(@RequestParam(value = "appType", defaultValue="") String appType, CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv;
		
		if(appType == "m" || appType.equals("m")) {
			mv = new ModelAndView("jsonView");
			commandMap.getMap().put("GOODS_NUM", request.getParameter("m_GOODS_NUM"));
			commandMap.getMap().put("MEM_ID", request.getParameter("m_MEM_ID"));
			commandMap.getMap().put("GOODS_TITLE", request.getParameter("m_GOODS_TITLE"));
			commandMap.getMap().put("GOODS_CONTENT", request.getParameter("m_GOODS_CONTENT"));
			commandMap.getMap().put("GOODS_PRICE", request.getParameter("m_GOODS_PRICE"));
			commandMap.getMap().put("GOODS_REGION", request.getParameter("m_GOODS_REGION"));
			commandMap.getMap().put("GOODS_CATEGORY", request.getParameter("m_GOODS_CATEGORY"));
			commandMap.getMap().put("GOODS_HASH", request.getParameter("m_GOODS_HASH"));
			commandMap.getMap().put("GOODS_DCOST", request.getParameter("m_GOODS_DCOST"));
			commandMap.getMap().put("GOODS_BRAND", request.getParameter("m_GOODS_BRAND"));
			commandMap.getMap().put("GOODS_STATUS", request.getParameter("m_GOODS_STATUS"));
		}else {
			mv = new ModelAndView("redirect:/shop/goodsWrite_redirect");
		}
		
		//ModelAndView mv = new ModelAndView("goodsWriteResult");

		shopService.updateGoods(commandMap.getMap(), request);
		mv.addObject("IDX", commandMap.getMap().get("IDX"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDelete")
	public ModelAndView goodsDelete(@RequestParam(value = "appType", defaultValue="") String appType, HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mv;
		
		if(appType == "m" || appType.equals("m")) {
			mv = new ModelAndView("jsonView");
			commandMap.getMap().put("GOODS_NUM", request.getParameter("m_GOODS_NUM"));
		}else {
			mv = new ModelAndView("redirect:/shop/allGoodsList");
		}
		
		//ModelAndView mv = new ModelAndView("redirect:/shop");
		
		shopService.deleteGoods(commandMap.getMap());
		
		return mv;
	}
	
	// 상품 상세보기
	@RequestMapping(value="/shop/goodsDetail")
	public ModelAndView goodsDetail(@RequestParam(value = "appType", defaultValue="") String appType, CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv;
		
		if(appType == "m" || appType.equals("m")) {
			mv = new ModelAndView("jsonView");
			//댓글 사용자 조회를 위한 MEM_ID
			//좋아요 여부 조회를 위한 LIKE_MEM_ID (세션)
			commandMap.getMap().put("MEM_ID", request.getParameter("m_MEM_ID"));
			commandMap.getMap().put("GOODS_NUM", request.getParameter("m_GOODS_NUM"));
			commandMap.getMap().put("LIKE_MEM_ID", request.getParameter("m_LIKE_MEM_ID"));
		}else {
			mv = new ModelAndView("goodsDetail");
		}
		
		//ModelAndView mv = new ModelAndView("goodsDetail");
		Map<String,Object> map = shopService.selectGoodsDetail(commandMap.getMap());
		
		String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		
		mv.addObject("map", map.get("map"));
		mv.addObject("goodsLikeMap", map.get("goodsLikeMap"));
		mv.addObject("memberMap", map.get("memberMap"));
		mv.addObject("list", map.get("list"));
		/* mv.addObject("list",map.get("list")); */
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDetail/goodsLike", method = RequestMethod.POST)
	public ModelAndView goodsLike(CommandMap commandMap) throws Exception{
		System.out.println("####1" + commandMap.getMap().get("LIKE_GOODS_NUM"));
		System.out.println("####2" + commandMap.getMap().get("LIKE_MEM_ID"));
		
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");
		mv.addObject("GOODS_NUM", commandMap.getMap().get("LIKE_GOODS_NUM"));
		mv.addObject("LIKE_MEM_ID", commandMap.getMap().get("LIKE_MEM_ID"));
		shopService.insertGoodsLike(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDetail/goodsUnlike")
	public ModelAndView goodsUnlike(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");
		mv.addObject("GOODS_NUM", commandMap.getMap().get("LIKE_GOODS_NUM"));
		mv.addObject("LIKE_MEM_ID", commandMap.getMap().get("LIKE_MEM_ID"));
		shopService.deleteGoodsLike(commandMap.getMap());

		return mv;
	}
}

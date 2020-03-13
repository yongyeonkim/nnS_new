package nnS.common.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String userId = (String)request.getSession().getAttribute("session_MEM_ID");
		 
		if(userId == null){
			  response.sendRedirect(request.getContextPath()+"/loginForm");
		 		return false;
		  }else if(userId.equals("admin")){
			  
		 		return super.preHandle(request, response, handler);
		 		
		  }
		  else{
		 		response.sendRedirect(request.getContextPath()+"/loginForm");
		   		return false;
		  }
	  
	 }
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}
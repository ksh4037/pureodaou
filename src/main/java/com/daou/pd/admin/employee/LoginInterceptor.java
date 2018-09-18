package com.daou.pd.admin.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
			boolean result = false;
			String reqUrl = request.getRequestURL().toString();
			System.out.println(reqUrl);
	/*
		  try {
			  HttpSession session = request.getSession();
			 
			  if(reqUrl.contains("/userLogout.daou")||reqUrl.contains("/admin/login.daou") || reqUrl.contains("/admin/logout.daou")){
				  return true;
			  }else {
				  if(reqUrl.contains("/admin")) {  
					  Object admin_obj = session.getAttribute("admin_emp_id");
						if (admin_obj == null) {
			    			response.sendRedirect(request.getContextPath() + "/admin/logout.daou");
			    			return false;
						}else {
							return true;
						}
					}
					else {
						Object user_obj = session.getAttribute("user_emp_id");
						if(user_obj == null) {
			    			response.sendRedirect(request.getContextPath() +"/");
			    			return false;
						}else {
							return true;
						}
				   }
			  }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }*/
	        //admin 세션key 존재시 main 페이지 이동
	        return true;
	    }

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}

package com.daou.pd.user.mod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@Autowired
	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping(value = "/")
	public ModelAndView goUserLoginPage(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession(false);
		if (session == null) {
			mav.setViewName("user/mod/userLogin");
		} else {
			/*if (session.getAttribute("e_id") != null)*/
				mav.setViewName("user/mod/userMain");
		}
		return mav;
	}

	@RequestMapping(value = "/goUserLogin")
	public ModelAndView goLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			UserVO uvo) {
		ModelAndView mav = new ModelAndView();
		int result = userService.checkUser(uvo);
		if (result == 1) {
			session.setAttribute("e_id", uvo.getE_id());
			session.setAttribute("e_name", uvo.getE_name());
			String msg = "로그인 성공";
			mav.addObject("msg", msg);
			mav.setViewName("user/mod/userMain");
		} else {
			String msg = "로그인 실패";
			mav.addObject("msg", msg);
			mav.setViewName("user/mod/userLogin");
		}

		return mav;
	}

	@RequestMapping(value = "/userLogout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		String msg = "�α׾ƿ�!";
		mav.addObject("msg", msg);
		mav.setViewName("user/mod/userLogin");
		return mav;
	}
}

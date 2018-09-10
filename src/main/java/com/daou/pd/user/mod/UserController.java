package com.daou.pd.user.mod;

import java.util.List;

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
	public ModelAndView goUserLoginPage() {
		ModelAndView mav = new ModelAndView("user/mod/userLogin");
		return mav;
	}

	@RequestMapping(value = "goUserLogin")
	public ModelAndView goUserLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			UserVO uvo) {

		int fullCheckResult = userService.selectUser(uvo);
		int IdCheckResult = userService.userIdCheck(uvo);

		ModelAndView mav = new ModelAndView("user/mod/result");

		if (IdCheckResult != 1) {
			mav.addObject("resultCode", "IDfail");
		} else if (fullCheckResult == 1) {
			session.setAttribute("e_id", uvo.getE_id());
			session.setAttribute("e_name", uvo.getE_name());
			mav.addObject("resultCode", "success");
		} else {
			mav.addObject("resultCode", "PWfail");
		}
		return mav;
	}

	@RequestMapping(value = "userLogout")
	public ModelAndView userLogout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		System.out.println("로그아웃!");
		mav.setViewName("user/mod/userLogin");
		return mav;
	}

	@RequestMapping(value = "userMain")
	public ModelAndView userMain(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("user/mod/userMain");
		return mav;
	}

	@RequestMapping(value = "userUpdtForm")
	public ModelAndView userUpdtForm(HttpServletRequest request, HttpServletResponse response, UserVO uvo) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/mod/p_dataUpdateForm");

		List<UserVO> deptList = userService.deptList();

		UserVO memberView = userService.memberView(uvo);
		mav.addObject("memberView", memberView);
		mav.addObject("deptList", deptList);

		return mav;
	}

	@RequestMapping(value = "userUpdt")
	public ModelAndView userUpdt(HttpServletRequest request, HttpServletResponse response, UserVO uvo) {
		ModelAndView mav = new ModelAndView("user/mod/result");
		System.out.println("아이디 : " + uvo.getE_id());
		try {
			userService.updateMember(uvo);
			mav.addObject("resultCode", "success");
			return mav;
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		return mav;
	}

}

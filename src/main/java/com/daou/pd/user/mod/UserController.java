package com.daou.pd.user.mod;

import java.security.MessageDigest;
import java.util.HashMap;
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

	final int checkKey = 1;
	
	@RequestMapping(value = "/")
	public ModelAndView goUserLoginPage() {
		ModelAndView mav = new ModelAndView("user/mod/userLogin");
		return mav;
	}

	@RequestMapping(value = "goUserLogin.daou")
	public ModelAndView goUserLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			UserVO uvo) throws Exception {

		StringBuffer sbuf = new StringBuffer();
		String txt =uvo.getEmp_pw();
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		mDigest.update(txt.getBytes());
		     
		    byte[] msgStr = mDigest.digest() ;
		     
		    for(int i=0; i < msgStr.length; i++){
		        byte tmpStrByte = msgStr[i];
		        String tmpEncTxt = Integer.toString((tmpStrByte & 0xff) + 0x100, 16).substring(1);
		         
		    sbuf.append(tmpEncTxt) ;
		    }
		uvo.setEmp_pw(sbuf.toString());
		
		int fullCheckResult = userService.selectUser(uvo);
		int IdCheckResult = userService.userIdCheck(uvo);

		ModelAndView mav = new ModelAndView("user/mod/result");

		if (IdCheckResult != checkKey) {
			mav.addObject("resultCode", "IDfail");
		} else if (fullCheckResult == checkKey) {
			session.setAttribute("user_emp_id", uvo.getEmp_id());
			session.setAttribute("user_emp_name", uvo.getEmp_name());
			mav.addObject("resultCode", "success");
		} else {
			mav.addObject("resultCode", "PWfail");
		}
		return mav;
	}

	@RequestMapping(value = "userLogout.daou")
	public ModelAndView userLogout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/mod/userLogin");
		return mav;
	}

	@RequestMapping(value = "userMain.daou")
	public ModelAndView userMain(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("user/mod/userMain");
		return mav;
	}

	@RequestMapping(value = "userUpdtForm.daou")
	public ModelAndView userUpdtForm(HttpServletRequest request, HttpServletResponse response, UserVO uvo) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/mod/p_dataUpdateForm");

		List<UserVO> deptList = userService.deptList();
		List<UserVO> gradeList = userService.gradeList();
	
		UserVO memberView = userService.memberView(uvo);;
		mav.addObject("memberView", memberView);
		mav.addObject("deptList", deptList);
		mav.addObject("gradeList", gradeList);

		return mav;
	}

	@RequestMapping(value = "userUpdt.daou")
	public ModelAndView userUpdt(HttpServletRequest request, HttpServletResponse response, UserVO uvo) throws Exception {
		ModelAndView mav = new ModelAndView("user/mod/result");
		
		StringBuffer sbuf = new StringBuffer();
		String txt =uvo.getEmp_pw();
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		mDigest.update(txt.getBytes());
		     
		    byte[] msgStr = mDigest.digest() ;
		     
		    for(int i=0; i < msgStr.length; i++){
		        byte tmpStrByte = msgStr[i];
		        String tmpEncTxt = Integer.toString((tmpStrByte & 0xff) + 0x100, 16).substring(1);
		         
		    sbuf.append(tmpEncTxt) ;
		    }
		uvo.setEmp_pw(sbuf.toString());
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

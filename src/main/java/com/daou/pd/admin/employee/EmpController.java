package com.daou.pd.admin.employee;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmpController {
	@Autowired
	@Resource(name = "EmpService")
	private EmpService empService;

	@RequestMapping(value = "admin/login")
	public ModelAndView goLoginPage() {
		ModelAndView mav = new ModelAndView("admin/employee/login");
		return mav;
	}

	@RequestMapping(value = "admin/goLogin")
	public ModelAndView goLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			EmpVO evo) {
		ModelAndView mav = new ModelAndView();
		int result = empService.selectAdmin(evo);
		System.out.println("결과 : " + result);

		if (result == 1) {
			session.setAttribute("e_id", evo.getE_id());
			session.setAttribute("e_name", evo.getE_name());
			List<HashMap<String, Object>> memberList = empService.memberList(evo);
			mav.addObject("memberList", memberList);
			mav.setViewName("admin/employee/userList");
		} else {
			String msg = "로그인 실패";
			mav.addObject("msg", msg);
			mav.setViewName("admin/employee/login");
		}

		return mav;
	}

	@RequestMapping(value = "goLogout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		String msg = "로그아웃!";
		mav.addObject("msg", msg);
		mav.setViewName("admin/employee/login");
		return mav;
	}

	@RequestMapping(value = "admin/employeeList")
	public ModelAndView goUser(HttpServletRequest request, HttpServletResponse response, EmpVO evo) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/employee/userList");
		List<HashMap<String, Object>> memberList = empService.memberList(evo);

		mav.addObject("memberList", memberList);
		return mav;
	}

	@RequestMapping(value = "admin/employeeRegForm")
	public ModelAndView goReg(HttpServletRequest request, HttpServletResponse response, EmpVO evo) {
		ModelAndView mav = new ModelAndView();
		List<EmpVO> deptList = empService.deptList();
		mav.setViewName("admin/employee/userRegForm");
		mav.addObject("deptList", deptList);
		return mav;
	}

	@RequestMapping(value = "admin/employeeReg")
	public ModelAndView goInsert(EmpVO evo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("admin/employee/result");
		evo.setE_pw("daou" + evo.getE_id());
		evo.setE_type(2);
		System.out.println("등록!");
		empService.insertMember(evo);
		mav.addObject("resultCode", "success");
		return mav;
	}

	@RequestMapping(value = "admin/employeeDlt")
	public ModelAndView goDel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "list[]") String[] delList) throws Exception {

		ModelAndView mav = new ModelAndView("admin/employee/result");
		try {
			for (int i = 0; i < delList.length; i++) {
				empService.deleteMember(delList[i]);
			}
			mav.addObject("resultCode", "success");
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		return mav;
	}

	@RequestMapping(value = "admin/employeeUpdtForm")
	public ModelAndView goUptForm(HttpServletRequest request, HttpServletResponse response, EmpVO evo) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/employee/userUpdateForm");

		System.out.println("evo.getE_id()" + evo.getE_id());
		List<EmpVO> deptList = empService.deptList();

		EmpVO memberView = empService.memberView(evo);
		mav.addObject("memberView", memberView);
		mav.addObject("deptList", deptList);

		return mav;
	}

	@RequestMapping(value = "admin/employeeUpdt")
	public ModelAndView goUpdate(HttpServletRequest request, HttpServletResponse response, EmpVO evo) {
		ModelAndView mav = new ModelAndView("admin/employee/result");
		System.out.println("아이디 : " + evo.getE_id());
		try {
			empService.updateMember(evo);
			mav.addObject("resultCode", "success");
			return mav;
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		return mav;
	}

	@RequestMapping(value = "admin/employeeIdCheck")
	public ModelAndView employeeIdCheck(HttpServletRequest request, HttpServletResponse response, EmpVO evo) {
		ModelAndView mav = new ModelAndView("admin/employee/result");

		try {
			int result = empService.employeeIdCheck(evo);
			if (result == 1) {
				mav.addObject("resultCode", "error");
			} else {
				mav.addObject("resultCode", "success");
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		return mav;

	}

}

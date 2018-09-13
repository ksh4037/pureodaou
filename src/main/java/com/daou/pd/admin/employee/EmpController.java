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

	@RequestMapping(value = "admin/login.daou")
	public ModelAndView goLoginPage() {
		ModelAndView mav = new ModelAndView("admin/employee/login");
		return mav;
	}

	@RequestMapping(value = "admin/goLogin.daou")
	public ModelAndView goLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			EmpVO evo) {

		int fullCheckResult = empService.selectAdmin(evo);
		int IdCheckResult = empService.employeeIdCheck(evo);

		ModelAndView mav = new ModelAndView("admin/employee/result");

		if (IdCheckResult != 1) {
			mav.addObject("resultCode", "IDfail");
		} else if (fullCheckResult == 1) {
			session.setAttribute("emp_id", evo.getEmp_id());
			session.setAttribute("emp_name", evo.getEmp_name());
			
			
			
			mav.addObject("resultCode", "success");
		} else {
			mav.addObject("resultCode", "PWfail");
		}
		return mav;
	}

	@RequestMapping(value = "admin/logout.daou")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/login");
		return mav;
	}

	@RequestMapping(value = "admin/employeeList.daou")
	public ModelAndView goUser(HttpServletRequest request, HttpServletResponse response, EmpVO evo) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/employee/userList");
		
		List<HashMap<String, Object>> memberList = empService.memberList();
		mav.addObject("memberList", memberList);
		return mav;
	}

	@RequestMapping(value = "admin/employeeRegForm.daou")
	public ModelAndView goReg(HttpServletRequest request, HttpServletResponse response, EmpVO evo) {
		ModelAndView mav = new ModelAndView();
		List<EmpVO> deptList = empService.deptList();
		List<EmpVO> gradeList = empService.gradeList();
		mav.setViewName("admin/employee/userRegForm");
		mav.addObject("deptList", deptList);
		mav.addObject("gradeList", gradeList);
		return mav;
	}

	@RequestMapping(value = "admin/employeeReg.daou")
	public ModelAndView goInsert(EmpVO evo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("admin/employee/result");
		evo.setEmp_pw("daou" + evo.getEmp_id());
		evo.setEmp_type(2);
		evo.setUse_yn("Y");
		empService.insertMember(evo);
		mav.addObject("resultCode", "success");
		return mav;
	}

	@RequestMapping(value = "admin/employeeDlt.daou")
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
	
	
	@RequestMapping(value = "admin/userDetailView.daou")
	public ModelAndView userDetailView(HttpServletRequest request, HttpServletResponse response, EmpVO evo) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/employee/userDetailView");
		
		HashMap<String,Object> memberViewAll = empService.memberViewAll(evo.getEmp_id());
		mav.addObject("memberViewAll", memberViewAll);
		return mav;
	}

	@RequestMapping(value = "admin/employeeUpdtForm.daou")
	public ModelAndView employeeUpdtForm(HttpServletRequest request, HttpServletResponse response, EmpVO evo) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/employee/userUpdateForm");

		List<EmpVO> deptList = empService.deptList();
		List<EmpVO> gradeList = empService.gradeList();
		
		EmpVO memberView = empService.memberView(evo);
	
		mav.addObject("memberView", memberView);
		mav.addObject("deptList", deptList);
		mav.addObject("gradeList", gradeList);

		return mav;
	}

	@RequestMapping(value = "admin/employeeUpdt.daou")
	public ModelAndView goUpdate(HttpServletRequest request, HttpServletResponse response, EmpVO evo) {
		ModelAndView mav = new ModelAndView("admin/employee/result");
		try {
			empService.updateMember(evo);
			mav.addObject("resultCode", "success");
			return mav;
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		return mav;
	}

	@RequestMapping(value = "admin/employeeIdCheck.daou")
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

package com.daou.pd.admin.exam;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daou.pd.admin.employee.EmpService;
import com.daou.pd.admin.employee.EmpVO;
import com.daou.pd.admin.item.ItemService;
import com.daou.pd.admin.item.ItemVO;

@Controller
public class AdminExamController {
	@Autowired
	@Resource(name = "adminExamService")
	private AdminExamService adminExamService;
	
	@Autowired
	@Resource(name = "EmpService")
	private EmpService empService;
	
	@Autowired
	@Resource(name = "itemService")
	private ItemService itemService;

	@RequestMapping(value = "admin/examList.daou")
	public ModelAndView itemList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("admin/exam/examList");
		return mav;
	}

	
	@RequestMapping(value = "admin/examRegForm.daou")
	public ModelAndView itemRegForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("admin/exam/examRegForm");
		List<EmpVO> deptList = empService.deptList();
		List<EmpVO> gradeList = empService.gradeList();
		
		List<ItemVO> categoryList = itemService.categoryList();

		mav.addObject("categoryList", categoryList);
		
		mav.addObject("deptList", deptList);
		mav.addObject("gradeList", gradeList);
		
		return mav;
	}
	
	
	@RequestMapping(value = "admin/examReg.daou")
	public void examReg(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "exam_category") String[] exam_category, 
			@RequestParam(value = "emp_grade") String[] emp_grade) {
		
		
		System.out.println();
		/*
		ModelAndView mav = new ModelAndView("admin/exam/examRegForm");
		List<EmpVO> deptList = empService.deptList();
		List<EmpVO> gradeList = empService.gradeList();
		
		List<ItemVO> categoryList = itemService.categoryList();

		mav.addObject("categoryList", categoryList);
		
		mav.addObject("deptList", deptList);
		mav.addObject("gradeList", gradeList);
		
		return mav;*/
	}
	
	
}

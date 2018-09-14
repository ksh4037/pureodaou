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
import com.daou.pd.user.exam.ExamVO;

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
	public ModelAndView examReg(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "emp_dept") List<String> emp_dept, 
			@RequestParam(value = "emp_grade") List<String> emp_grade, ExamVO evo) {
		
		ModelAndView mav = new ModelAndView("admin/exam/result");
		
		String msg = "";
		int exam_reg_result = adminExamService.examReg(evo);

		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("emp_dept", emp_dept);
		data.put("emp_grade",emp_grade);

		List<String> empIdList = adminExamService.selectExamTarget(data);
		
		for(int i=0; i< empIdList.size(); i++) {
			adminExamService.userExamReg(empIdList.get(i));
		}
		
		if(exam_reg_result == 1) {
			msg = "success";
		} else {
			msg = "error";
		}
		
		mav.addObject("resultCode", msg);
		return mav;
		
	}
}

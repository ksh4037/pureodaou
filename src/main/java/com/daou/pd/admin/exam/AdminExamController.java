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

@Controller
public class AdminExamController {
	@Autowired
	@Resource(name = "adminExamService")
	private AdminExamService adminExamService;

	@RequestMapping(value = "admin/examList.daou")
	public ModelAndView itemList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("admin/exam/examList");
		return mav;
	}

}

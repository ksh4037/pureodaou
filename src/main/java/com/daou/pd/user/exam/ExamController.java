package com.daou.pd.user.exam;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExamController {

//	String id = "90100";// 임시 아이디와 회차
//	int degree = 1;
	@Autowired
	@Resource(name = "examService")
	private ExamService examService;

	@RequestMapping(value = "user/exam/examlist.daou")
	public ModelAndView examlist(HttpServletRequest req) {
//		HttpSession session = req.getSession();
//		String id = (String)session.getAttribute("emp_id");
		String id = "90634";
		ModelAndView mav = new ModelAndView("user/exam/examMain");
		mav.addObject("category", "보안");
		mav.addObject("elist", examService.getExamList(id));

		return mav;
	}

	@RequestMapping(value = "/user/exam/examStart.daou")
	public ModelAndView examStart(@RequestParam("degree") String str, HttpServletRequest req) {
		String id = getSessionId(req);
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@RequestMapping(value = "/user/exam/examTest.daou")
	public String examTest(@RequestParam("degree") String str, @RequestParam("ox_num") String ox,
			@RequestParam("obj_num") String obj, HttpServletRequest req) {
		return null;
	}

	@RequestMapping(value = "/user/exam/getExam.do")
	public ModelAndView getExam(HttpServletRequest req) {// 아직 보기 순서 안섞임
		int degree = (Integer) req.getAttribute("degree");
		String id = getSessionId(req);
		return null;
	}

	@RequestMapping(value = "user/exam/tempstrg")
	public ModelAndView tempStorage(HttpServletRequest req) {
		String id = getSessionId(req);
		return null;
	}

	@RequestMapping(value = "/user/exam/regist.do")
	@ResponseBody
	public ModelAndView regist(HttpServletRequest req, @RequestBody List<MarkVO> list) {
		ModelAndView mav = new ModelAndView("user/exam/markResult");
		return null;
	}

	@RequestMapping(value = "/user/exam/recordlist.do")
	public ModelAndView getRecord(HttpServletRequest req, String degree) {
		String id = getSessionId(req);
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	private void grading(int degree) {
	}

	private String getSessionId(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("e_id");
		return id;
	}
}

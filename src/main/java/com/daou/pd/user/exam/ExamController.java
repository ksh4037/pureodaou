package com.daou.pd.user.exam;

import java.util.Collections;
import java.util.HashMap;
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

import com.daou.pd.admin.item.ItemVO;

@Controller
public class ExamController {

//	String id = "90100";// 임시 아이디와 회차
//	int degree = 1;
	@Autowired
	@Resource(name = "examService")
	private ExamService examService;

	@RequestMapping(value = "user/exam/examlist.daou")
	public ModelAndView examlist(HttpServletRequest req) {
//		HttpSession session = req.getSession(false);
//		String id = (String)session.getAttribute("emp_id");
		String id = "90634";
		ModelAndView mav = new ModelAndView("user/exam/examMain");
		mav.addObject("elist", examService.getExamList(id));

		return mav;
	}

	@RequestMapping(value = "/user/exam/examIntro.daou")
	public ModelAndView examStart(@RequestParam("degree") String str, HttpServletRequest req) {
//		String id = getSessionId(req);
		int degree = Integer.parseInt(str);
		ModelAndView mav = new ModelAndView();
		String id = "90634";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reg_id", id);
		map.put("exam_degree", degree);
		mav.addObject("intro", examService.getIntro(map));
		mav.setViewName("user/exam/examStart");
		return mav;
	}

	@RequestMapping(value = "/user/exam/getExam.daou")
	public String examTest(@RequestParam("degree") String str, @RequestParam("ox_num") String ox,
			@RequestParam("obj_num") String obj, @RequestParam("short_num") String short_n, HttpServletRequest req) {
		int degree = Integer.parseInt(str);
		int ox_num = Integer.parseInt(ox);
		int obj_num = Integer.parseInt(obj);
		int short_num = Integer.parseInt(short_n);
//		String id = getSessionId(req);
		String id = "90634";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("degree", degree);
		map.put("id", id);
		if (examService.checkDegree(map) == 0) {
			makeExam(ox_num, obj_num, short_num);
		}
//		int cnt = examService.getPersence(id, degree);
//		if (cnt == 0) {
//			List<ItemVO> list = examService.getProblem(ox_num, obj_num);
//			for (ItemVO pVO : list) {
//				List<OptionVO> oplist = examService.getOpList(pVO.getItem_no());
//				List<OptionVO> oplist2 = new ArrayList<OptionVO>();
//				if (oplist.size() > 2) {// 객관식 보기 섞기
//					for (OptionVO oVO : oplist) {
//						if (oVO.getCorrect_yn().equals("Y")) {
//							oplist2.add(oVO);
//						}
//					}
//					for (OptionVO oVO : oplist) {
//						if (oVO.getCorrect_yn().equals("N")) {
//							if (oplist2.size() < 4)
//								oplist2.add(oVO);
//						}
//					}
//				}
//				Collections.shuffle(oplist2);
//				pVO.setOvo(oplist2);
//			}
//
//			List<ExamDetailVO> examList = new ArrayList<ExamDetailVO>();

		/*
		 * for (ItemVO pVO : list) { ExamDetailVO eVO = new ExamDetailVO();
		 * eVO.setExam_degree(degree); eVO.setExam_take_id(id);
		 * eVO.set(pVO.getItem_no()); List<OptionVO> oplist = pVO.getOvo(); if
		 * (oplist.size() > 2) { eVO.setOption1(oplist.get(0).getOption_no());
		 * eVO.setOption2(oplist.get(1).getOption_no());
		 * eVO.setOption3(oplist.get(2).getOption_no());
		 * eVO.setOption4(oplist.get(3).getOption_no()); } examList.add(eVO); }
		 * examService.insertExam(examList);
		 */
		return null;
	}

	private void makeExam(int ox_num, int obj_num, int short_num) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ox_num", ox_num);
		map.put("obj_num", obj_num);
		map.put("short_num", short_num);
		List<ItemVO> list = examService.getItemList(map);

		Collections.shuffle(list);

//		examService.makeTest(list);
	}

	@RequestMapping(value = "/user/exam/getQuestion.daou")
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

package com.daou.pd.user.exam;

import java.util.ArrayList;
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
import com.daou.pd.admin.item.OptionVO;

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
			@RequestParam("obj_num") String obj, @RequestParam("short_num") String short_n,
			@RequestParam("category") String category, HttpServletRequest req) {
		int degree = Integer.parseInt(str);
		int ox_num = Integer.parseInt(ox);
		int obj_num = Integer.parseInt(obj);
		int short_num = Integer.parseInt(short_n);
		int exam_category = Integer.parseInt(category);
//		String id = getSessionId(req);
		String id = "90634";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("degree", degree);
		map.put("id", id);
		int exam_no = examService.getExamNo(id);
		if (examService.checkDegree(map) == 0) {
			makeExam(ox_num, obj_num, short_num, exam_category, ++exam_no);
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

	private void makeExam(int ox_num, int obj_num, int short_num, int exam_category, int exam_no) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ox_num", ox_num);
		map.put("obj_num", obj_num);
		map.put("short_num", short_num);
		map.put("exam_category", exam_category);
		map.put("exam_no", exam_no);
		List<ItemVO> list = examService.getItemList(map);
		List<ExamDetailVO> dlist = new ArrayList<ExamDetailVO>();
		for (ItemVO item : list) {
			List<OptionVO> olist = examService.getOption(item.getItem_no());
			List<OptionVO> olist2 = new ArrayList<OptionVO>();
			if (olist.size() > 1) {
				for (OptionVO op : olist) {
					if (op.getCorrect_yn().equals("Y"))
						olist2.add(op);
				}
				for (OptionVO op : olist) {
					if (op.getCorrect_yn().equals("N"))
						if (olist2.size() < 4)
							olist2.add(op);
				}
				Collections.shuffle(olist2);
				item.setOvo(olist2);
			} else {
				item.setOvo(olist);
			}
		}
		Collections.shuffle(list);
		for (ItemVO item : list) {
			ExamDetailVO detail = new ExamDetailVO();
			detail.setItem_no(item.getItem_no());
			detail.setExam_no(exam_no);
			List<OptionVO> ol = item.getOvo();
			if (item.getOvo().size() > 1) {
				detail.setExam_detail_option1(ol.get(0).getOption_no());
				detail.setExam_detail_option2(ol.get(1).getOption_no());
				detail.setExam_detail_option3(ol.get(2).getOption_no());
				detail.setExam_detail_option4(ol.get(3).getOption_no());
				dlist.add(detail);
			} else {
				detail.setExam_detail_option1(ol.get(0).getOption_no());
			}
		}

		examService.makeTest(dlist);
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

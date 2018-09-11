package com.daou.pd.user.exam;

import org.springframework.stereotype.Controller;

@Controller
public class ExamController {
	/*
	String id = "90100";// 임시 아이디와 회차
//	int degree = 1;
	@Autowired
	@Resource(name = "examService")
	private ExamService examService;

	@RequestMapping(value = "user/examMain.do")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView("user/exam/examMain");
		List<ExamListVO> elist = examService.getexamList();
		mav.addObject("elist", elist);
		return mav;
	}

	@RequestMapping(value = "/user/examStart.do")
	public ModelAndView examStart(@RequestParam("degree") String str, HttpServletRequest req) {
		String id = getSessionId(req);
//		String id = "90100";
		int degree = Integer.parseInt(str);
		ExamListVO listVO = examService.getQnum(degree);
		ModelAndView mav = new ModelAndView();
		mav.addObject("listVO", listVO);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reg_id", id);
		map.put("exam_test_no", degree);
		List<String> result = examService.getExamStatus(map);
		if (result.size() < 1) {
			mav.addObject("status", "미제출");
		} else if (result.size() > 1 || result.get(0) == null) {
			mav.addObject("status", "임시저장");
		} else {
			mav.addObject("status", "제출");
		}
		mav.setViewName("user/exam/examStart");
		return mav;
	}

	@RequestMapping(value = "/user/examTest.do")
	public String examTest(@RequestParam("degree") String str, @RequestParam("ox_num") String ox,
			@RequestParam("obj_num") String obj, HttpServletRequest req) {
		int degree = Integer.parseInt(str);
		int ox_num = Integer.parseInt(ox);
		int obj_num = Integer.parseInt(obj);
		req.setAttribute("degree", degree);
		String id = getSessionId(req);
//		String id = "90100";

		int cnt = examService.getPersence(id, degree);
		if (cnt == 0) {
			List<QuestionVO> list = examService.getProblem(ox_num, obj_num);
			for (QuestionVO pVO : list) {
				List<OptionVO> oplist = examService.getOpList(pVO.getProblem_seq());
				List<OptionVO> oplist2 = new ArrayList<OptionVO>();
				if (oplist.size() > 2) {// 객관식 보기 섞기
					for (OptionVO oVO : oplist) {
						if (oVO.getAnswer_yn().equals("Y")) {
							oplist2.add(oVO);
						}
					}
					for (OptionVO oVO : oplist) {
						if (oVO.getAnswer_yn().equals("N")) {
							if (oplist2.size() < 4)
								oplist2.add(oVO);
						}
					}
				}
				Collections.shuffle(oplist2);
				pVO.setOvo(oplist2);
			}

			List<ExamVO> examList = new ArrayList<ExamVO>();

			for (QuestionVO pVO : list) {
				ExamVO eVO = new ExamVO();
				eVO.setExam_test_no(degree);
				eVO.setReg_id(id);
				eVO.setProblem_seq(pVO.getProblem_seq());
				List<OptionVO> oplist = pVO.getOvo();
				if (oplist.size() > 2) {
					eVO.setOption1(oplist.get(0).getOption_seq());
					eVO.setOption2(oplist.get(1).getOption_seq());
					eVO.setOption3(oplist.get(2).getOption_seq());
					eVO.setOption4(oplist.get(3).getOption_seq());
				}
				examList.add(eVO);
			}
			examService.insertExam(examList);
		}
		return "forward:/user/exam/getExam.do";
	}

	@RequestMapping(value = "/user/exam/getExam.do")
	public ModelAndView getExam(HttpServletRequest req) {// 아직 보기 순서 안섞임
		int degree = (Integer) req.getAttribute("degree");
		String id = getSessionId(req);
//		String id = "90100";
		ModelAndView mav = new ModelAndView("user/exam/examTest");
		List<QuestionVO> plist = examService.getExam(id, degree);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reg_id", id);
		map.put("exam_test_no", degree);
		for (QuestionVO pVO : plist) {
			if (pVO.getType().equals("2")) {
				map.put("problem_seq", pVO.getProblem_seq());
				List<OptionVO> olist = examService.getExamOption(map);
				pVO.setOvo(olist);
				map.remove("problem_seq");
			}
		}
		mav.addObject("map", map);
		mav.addObject("pList", plist);
		return mav;
	}

	@RequestMapping(value = "user/exam/tempstrg")
	public ModelAndView tempStorage(HttpServletRequest req) {
		String id = getSessionId(req);
//		String id = "90100"; // 테스트용 임시ID 변수
		ModelAndView mav = new ModelAndView("user/exam/tempStrgResult");
//		examService.tempRegist();
		return mav;
	}

	@RequestMapping(value = "/user/exam/regist.do")
	@ResponseBody
	public ModelAndView regist(HttpServletRequest req, @RequestBody List<MarkVO> list) {
		ModelAndView mav = new ModelAndView("user/exam/markResult");
		String id = getSessionId(req);
		HashMap<String, Object> map = null;
		int cnt = 0;
		for (MarkVO mVO : list) {
			map = new HashMap<String, Object>();
			map.put("reg_id", id);
			map.put("problem", mVO.getProblem());
			map.put("answer", mVO.getAnswer());
			map.put("degree", mVO.getDegree());
			int n = examService.markAnswer(map);
			if (n > 0) {
				cnt++;
			}
		}
		if (list.size() == cnt) {
			mav.addObject("result", "success");
		} else {
			mav.addObject("result", "fail");
		}
		return mav;
	}

	@RequestMapping(value = "/user/exam/recordlist.do")
	public ModelAndView getRecord(HttpServletRequest req, String degree) {
		String id = getSessionId(req);
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	private void grading(int degree) {
		examService.getExamPaper(id, degree);
	}

	private String getSessionId(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("e_id");
		return id;
	}*/
}

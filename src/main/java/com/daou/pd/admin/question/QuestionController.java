package com.daou.pd.admin.question;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuestionController {
	@Autowired
	@Resource(name = "questionService")
	private QuestionService questionService;

	@RequestMapping(value = "admin/questionList")
	public ModelAndView questionList(HttpServletRequest request, HttpServletResponse response, QuestionVO pvo) {
		ModelAndView mav = new ModelAndView("admin/question/questionList");
		List<QuestionVO> questionList = questionService.questionList(pvo);
		List<QuestionVO> categoryList = questionService.categoryList();

		mav.addObject("categoryList", categoryList);
		mav.addObject("questionList", questionList);
	//	mav.addObject("scType", pvo.getScType());
	//	mav.addObject("srch_input", pvo.getSrch_input());
		return mav;
	}

	@RequestMapping(value = "admin/questionDetail", method = RequestMethod.POST)
	public ModelAndView questionDetail(@RequestParam(value = "q_seq") int q_seq, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("admin/question/questionDetail");

		QuestionVO questionDetail = questionService.questionDetail(q_seq);
		List<HashMap<String, Object>> optionDetail = questionService.optionDetail(q_seq);

		List<QuestionVO> categoryList = questionService.categoryList();
		mav.addObject("categoryList", categoryList);

		mav.addObject("questionDetail", questionDetail);
		mav.addObject("optionDetail", optionDetail);

		return mav;
	}

	@RequestMapping(value = "admin/questionRegForm")
	public ModelAndView questionRegForm(HttpServletRequest request, HttpServletResponse response, QuestionVO pvo) {
		ModelAndView mav = new ModelAndView("admin/question/questionRegForm");

		List<QuestionVO> categoryList = questionService.categoryList();
		mav.addObject("categoryList", categoryList);

		return mav;
	}

	@RequestMapping(value = "admin/questionReg")
	public ModelAndView questionReg(HttpServletRequest request, HttpServletResponse response, QuestionVO pvo,
			OptionVO ovo, @RequestParam(value = "o_contents") String[] o_contents) {

		ModelAndView mav = new ModelAndView("admin/question/result");

		String msg = "";
		int q_result = 0; // 문제가 잘 저장되었는지 쿼리 리턴값을 받아오는 변수
		int o_result = 0; // 보기가 잘 저장되었는지 쿼리 리턴값을 받아오는 변수

		try {
			if (pvo.getQ_type().equals("1")) { // O/X 저장

				q_result = questionService.questionReg(pvo);
				int q_seq = questionService.selectQuestionSeq();
				ovo.setQ_seq(q_seq);
				ovo.setAnswer_yn("Y");

				for (int i = 0; i < o_contents.length; i++) {
					ovo.setO_contents(o_contents[i]);
					o_result += questionService.optionReg(ovo);
				}

				if (q_result == 1 && o_result >= 1) {
					msg = "success";
				} else {
					msg = "error";
				}

			} else if (pvo.getQ_type().equals("2")) { // 객관식 저장

				q_result = questionService.questionReg(pvo);
				int q_seq = questionService.selectQuestionSeq();
				ovo.setQ_seq(q_seq);

				for (int i = 0; i < o_contents.length; i++) {

					if (i == pvo.getAnswer_no()) { // 첫 번째가 정답이니까
						ovo.setAnswer_yn("Y");
					} else {
						ovo.setAnswer_yn("N");
					}

					ovo.setO_contents(o_contents[i]);
					o_result = questionService.optionReg(ovo);
				}

				if (q_result == 1 && o_result >= 1) {
					msg = "success";
				} else {
					msg = "error";
				}
				

			}

		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}

		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/deleteQuestion")
	public ModelAndView deleteQuestion(HttpServletRequest request, HttpServletResponse response, QuestionVO pvo) {
		ModelAndView mav = new ModelAndView("admin/question/result");
		String msg = "";

		try {
			int result = questionService.deleteQuestion(pvo.getQ_seq());

			if (result == 1) {
				msg = "success";
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}

		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/questionUpdtForm")
	public ModelAndView questionUpdtForm(@RequestParam(value = "q_seq") int q_seq,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("admin/question/questionUpdtForm");

		QuestionVO questionDetail = questionService.questionDetail(q_seq);
		List<HashMap<String, Object>> optionDetail = questionService.optionDetail(q_seq);

		List<QuestionVO> categoryList = questionService.categoryList();
		mav.addObject("categoryList", categoryList);

		mav.addObject("questionDetail", questionDetail);
		mav.addObject("optionDetail", optionDetail);

		return mav;
	}

	@RequestMapping(value = "admin/questionUpdt")
	public ModelAndView questionUpdt(HttpServletRequest request, HttpServletResponse response, QuestionVO pvo,
			OptionVO ovo, @RequestParam(value = "o_contents") String[] o_contents) {

		ModelAndView mav = new ModelAndView("admin/question/result");
		String msg = "";
		int q_update_result = 0;
		int o_delete_result = 0;
		int o_reg_result = 0;

		try {
			if (pvo.getQ_type().equals("1")) { // O/X 저장

				q_update_result = questionService.questionUpdt(pvo);
				o_delete_result = questionService.deleteOption(pvo.getQ_seq());

				ovo.setQ_seq(pvo.getQ_seq());
				ovo.setAnswer_yn("Y");

				for (int i = 0; i < o_contents.length; i++) {
					ovo.setO_contents(o_contents[i]);
					o_reg_result += questionService.optionReg(ovo);
				}

				if (q_update_result >= 1 && o_delete_result >= 1 && o_reg_result >= 1) {
					msg = "success";
				} else {
					msg = "error";
				}

			} else if (pvo.getQ_type().equals("2")) { // 객관식 저장

				q_update_result = questionService.questionUpdt(pvo);
				o_delete_result = questionService.deleteOption(pvo.getQ_seq());

				ovo.setQ_seq(pvo.getQ_seq());

				for (int i = 0; i < o_contents.length; i++) {

					if (i == pvo.getAnswer_no()) { // 첫 번째가 정답이니까
						ovo.setAnswer_yn("Y");
					} else {
						ovo.setAnswer_yn("N");
					}

					ovo.setO_contents(o_contents[i]);
					o_reg_result += questionService.optionReg(ovo);
				}

				if (q_update_result >= 1 && o_delete_result >= 1 && o_reg_result >= 1) {
					msg = "success";
				} else {
					msg = "error";
				}
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/deleteChkQuestion")
	public ModelAndView deleteChkQuestion(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "rowid") Integer[] checkList) {

		ModelAndView mav = new ModelAndView("admin/question/result");
		int result = 0;
		String msg = "";

		try {

			for (int i = 0; i < checkList.length; i++) {
				result += questionService.deleteQuestion(checkList[i]);
			}

			if (result >= 1) {
				msg = "success";
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}

		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/categoryList")
	public ModelAndView categoryList() {
		ModelAndView mav = new ModelAndView("admin/question/categoryList");

		List<QuestionVO> categoryList = questionService.categoryList();
		mav.addObject("categoryList", categoryList);

		return mav;
	}

	@RequestMapping(value = "admin/categoryDetail")
	public ModelAndView categoryDetail(@RequestParam(value = "c_seq") int c_seq,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav;
		String caller = request.getParameter("caller");

		if (caller.equals("updt")) {
			mav = new ModelAndView("admin/question/categoryUpdtForm");

			QuestionVO categoryDetail = questionService.categoryDetail(c_seq);
			mav.addObject("categoryDetail", categoryDetail);

		} else {
			mav = new ModelAndView("admin/question/categoryDetail");

			QuestionVO categoryDetail = questionService.categoryDetail(c_seq);
			mav.addObject("categoryDetail", categoryDetail);
		}

		return mav;
	}

	@RequestMapping(value = "admin/categoryUpdt")
	public ModelAndView categoryUpdt(HttpServletRequest request, HttpServletResponse response, QuestionVO pvo) {

		ModelAndView mav = new ModelAndView("admin/question/result");
		int result = 0;
		String msg = "";
		try {
			result = questionService.categoryUpdt(pvo);
			if (result == 1) {
				msg = "success";
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/categoryRegForm")
	public ModelAndView categoryRegForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("admin/question/categoryRegForm");
		return mav;
	}

	@RequestMapping(value = "admin/categoryReg")
	public ModelAndView categoryReg(HttpServletRequest request, HttpServletResponse response, QuestionVO pvo) {

		ModelAndView mav = new ModelAndView("admin/question/result");
		int result = 0;
		String msg = "";

		try {

			result = questionService.categoryReg(pvo);

			if (result >= 1) {
				msg = "success";
			} else {
				msg = "error";
			}

		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/deleteCategory")
	public ModelAndView deleteCategory(HttpServletRequest request, HttpServletResponse response, QuestionVO pvo) {

		ModelAndView mav = new ModelAndView("admin/question/result");
		String msg = "";

		try {
			int result = questionService.deleteCategory(pvo.getC_seq());
			if (result == 1) {
				msg = "success";
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}

		mav.addObject("resultCode", msg);

		return mav;
	}

	@RequestMapping(value = "admin/deleteChkCategory")
	public ModelAndView deleteChkCategory(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "rowid") Integer[] checkList) {

		ModelAndView mav = new ModelAndView("admin/question/result");
		int result = 0;
		String msg = "";

		try {

			for (int i = 0; i < checkList.length; i++) {
				result += questionService.deleteCategory(checkList[i]);
			}

			if (result >= 1) {
				msg = "success";
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}

		mav.addObject("resultCode", msg);
		return mav;
	}

}

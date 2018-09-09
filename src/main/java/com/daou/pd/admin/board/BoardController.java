package com.daou.pd.admin.board;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "admin")
public class BoardController {
	@Autowired
	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "admin/board")
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response, BoardVO bvo) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/board/board");
		List<BoardVO> boardList = boardService.boardList(bvo);
		mav.addObject("boardList", boardList);
		return mav;
	}

	@RequestMapping(value = "admin/goBoardReg")
	public ModelAndView goReg(HttpServletRequest request, HttpServletResponse response, BoardVO bvo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/employee/boardRegForm");
		return mav;
	}

	@RequestMapping(value = "admin/goBoardInsert")
	public ModelAndView goInsert(BoardVO bvo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView("admin/board");
		// bvo.setB_reg_id('2');S

		System.out.println("�ߺ���");
		mav.addObject("resultCode", "error");

		return mav;
	}

	@RequestMapping(value = "admin/goBackBoard")
	public ModelAndView goBackUser(HttpServletRequest request, HttpServletResponse response, BoardVO bvo) {
		ModelAndView mav = new ModelAndView();
		// List<BoardVO> memberList = boardService.memberList(bvo);
		mav.setViewName("admin/employee/userList");
		// mav.addObject("memberList", memberList);
		return mav;
	}

}

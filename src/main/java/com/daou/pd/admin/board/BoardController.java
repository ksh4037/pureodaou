package com.daou.pd.admin.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daou.pd.admin.board.BoardService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	/*
	 * 
	 * 
	 * @Autowired
	 * 
	 * @Resource(name = "boardService") private BoardService boardService;
	 * 
	 * @RequestMapping(value = "boardList.daou") public ModelAndView
	 * test(HttpServletRequest request, HttpServletResponse response, BoardVO bvo) {
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.setViewName("admin/board/board");
	 * 
	 * return mav; }
	 * 
	 * 
	 * @RequestMapping(method = RequestMethod.GET) public String
	 * examPercent(ModelMap modelMap) { List<List<Map<Object, Object>>> ExamDataList
	 * = boardService.getBoardVO(); modelMap.addAttribute("dataPointsList",
	 * ExamDataList); return "chart"; }
	 * 
	 * 
	 * 
	 * 
	 * @RequestMapping(value = "admin/goBackBoard") public ModelAndView
	 * goBackUser(HttpServletRequest request, HttpServletResponse response, BoardVO
	 * bvo) { ModelAndView mav = new ModelAndView(); // List<BoardVO> memberList =
	 * boardService.memberList(bvo); mav.setViewName("admin/employee/userList"); //
	 * mav.addObject("memberList", memberList); return mav; }
	 */

}

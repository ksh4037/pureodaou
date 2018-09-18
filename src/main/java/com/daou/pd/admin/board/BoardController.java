package com.daou.pd.admin.board;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.daou.pd.admin.board.BoardService;
import com.daou.pd.admin.board.BoardVO;

import com.daou.pd.user.exam.ExamVO;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BoardController {

	@Autowired
	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/admin/boardList.daou")
	public ModelAndView springMVC(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response, BoardVO bvo) {
		
		ModelAndView mav = new ModelAndView("admin/board/board");
		
		List<BoardVO> degreeList = boardService.degreeList();
		List<BoardVO> deptList = boardService.deptList();
		List<BoardVO> gradeList = boardService.gradeList();
		
		mav.addObject("degreeList", degreeList);
		mav.addObject("deptList", deptList);
		mav.addObject("gradeList", gradeList);

		return mav;
	}

	
	@RequestMapping(value = "/admin/examPercent.daou")
	@ResponseBody
	public HashMap<String, Object> examPercent(HttpServletRequest request, HttpServletResponse response, ExamVO exvo) {
		
		String examPercent ="";
		String passPercent= "";
		
		
		int examTargetAll = boardService.selectTarget(exvo);
		int examTargetDo = boardService.selectTargetDo(exvo);
		int passTarget = boardService.selectPass(exvo);
		int deptAverage = boardService.deptAverage(exvo);
		int gradeAverage = boardService.gradeAverage(exvo);

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("examTargetAll"+examTargetAll);
		System.out.println("examTargetDo"+examTargetDo);
		System.out.println("passTarget"+passTarget);
		
		
		try {
			if (examTargetAll==0) {
				map.put("examPercent", "none");
			}else if(examTargetDo ==0) {
				map.put("examPercent", "anybody");
			}else {
			
				examPercent = String.format("%.2f",((float) examTargetDo/ (float) examTargetAll)*100);
				passPercent = String.format("%.2f",((float) passTarget/ (float) examTargetDo)*100);
				
				map.put("examPercent", examPercent);
				map.put("examTargetAll", Integer.toString(examTargetAll));
				map.put("examTargetDo", Integer.toString(examTargetDo));
				map.put("passTarget", Integer.toString(passTarget));
				map.put("passPercent",passPercent);
				map.put("deptAverage", Integer.toString(deptAverage));
				map.put("gradeAverage", Integer.toString(gradeAverage));
		
			}
		}
		catch(Exception e) {
			map.put("examPercent", "error");
		}
		
		return map;
	}
	
	
	@RequestMapping(value = "/admin/wrongPercent.daou")
	@ResponseBody
	public String wrongPercent(HttpServletRequest request, HttpServletResponse response, ExamVO exvo, BoardVO boardVO) {
		
		List<HashMap<String,Object>> rankWrongCount = boardService.rankWrongCount(exvo);
		
		String str = "";
		ObjectMapper mapper = new ObjectMapper();

		try { 
			str = mapper.writeValueAsString(rankWrongCount);
			System.out.println("str"+str);
		}
		catch(Exception e) {
		}
		return str;
	}
	
	

}

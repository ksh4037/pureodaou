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

@Controller
public class BoardController {

	@Autowired
	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/admin/boardList.daou")
	public ModelAndView springMVC(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response,
			BoardVO bvo) {
		ModelAndView mav = new ModelAndView("admin/board/board");
		List<BoardVO> degreeList = boardService.degreeList();
		List<BoardVO> deptList = boardService.deptList();
		List<BoardVO> gradeList = boardService.gradeList();
		mav.addObject("degreeList", degreeList);
		mav.addObject("deptList", deptList);
		mav.addObject("gradeList", gradeList);
		// List<List<Map<Object, Object>>> canvasjsDataList =
		// boardService.getCanvasjsChartData();
		// mav.addObject("dataPointsList", canvasjsDataList);
		return mav;
	}

	@RequestMapping(value = "/admin/examPercent.daou")
	@ResponseBody
	public HashMap<String, String>  examPercent(HttpServletRequest request, HttpServletResponse response, ExamVO exvo) {
		
		int examTargetAll = boardService.selectTarget(exvo);
		int examTargetDo = boardService.selectTargetDo(exvo);
		int passTarget = boardService.selectPass(exvo);
		float examPercent = 0;
		
		//List<ExamDetailVO> wrongList = boardService.wrongList(exvo);
		//int wrongCount = boardService.selectWrongCount(exvo);
		int setCount = boardService.selectSetCount(exvo);
		
		System.out.println("셋 카운트"+setCount); 
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		try {
			if (examTargetAll==0) { 
				map.put("examPercent", "none");
			}else if(examTargetDo ==0) {
				map.put("examPercent", "anybody");
			}else {
				examPercent = (examTargetDo / examTargetAll) * 100;
				
				map.put("examPercent", Float.toString(examPercent));
				map.put("examTargetAll", Integer.toString(examTargetAll));
				map.put("examTargetDo", Integer.toString(examTargetDo));
				map.put("passTarget", Integer.toString(passTarget));
				
				map.put("setCount", Integer.toString(setCount));
			}
		}
		catch(Exception e) {
			map.put("examPercent", "error");
		}
		
		return map;
	}

}

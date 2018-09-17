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
	public HashMap<String, Object> examPercent(HttpServletRequest request, HttpServletResponse response, ExamVO exvo) {
		
		String examPercent ="";
		//float examPercent;
		int examTargetAll = 0;
		int examTargetDo = 0;
		int passTarget = 0;
		String passPercent= "";
		
		examTargetAll = boardService.selectTarget(exvo);
		examTargetDo = boardService.selectTargetDo(exvo);
		passTarget = boardService.selectPass(exvo);
		
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
				
				
				System.out.println("examPercent"+examPercent);
				System.out.println("passPercent"+passPercent);
				float ep = Float.parseFloat(examPercent);
				float pp =Float.parseFloat(passPercent);
				map.put("examPercent", examPercent);
				map.put("examTargetAll", Integer.toString(examTargetAll));
				map.put("examTargetDo", Integer.toString(examTargetDo));
				map.put("passTarget", Integer.toString(passTarget));
				map.put("passPercent",passPercent);
				map.put("deptAverage", Integer.toString(deptAverage));
				map.put("gradeAverage", Integer.toString(gradeAverage));
			//	map.put("setCount", Integer.toString(setCount));
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
		
		//ModelAndView mav = new ModelAndView("admin/board/result");
		

		List<HashMap<String,Object>> rankWrongCount = boardService.rankWrongCount(exvo);
		
		System.out.println("0일때"+rankWrongCount);
		
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//map.put("item_no", rankWrongCount.containsAll(rankWrongCount));
		/*rankWrongCount.get(0);
		exvo.getItem_no();
		exvo.getResult();
		exvo.getTotal_count();*/
		
		System.out.println("0일때"+exvo.getTotal_count());
		
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

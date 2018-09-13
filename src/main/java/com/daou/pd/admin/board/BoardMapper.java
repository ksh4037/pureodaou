package com.daou.pd.admin.board;

import java.util.List;
import java.util.Map;

public interface BoardMapper {
	public List<BoardVO> boardList();
	
	//List<List<Map<Object, Object>>> getExamChartData();
	
	//@Override
	//public List<List<Map<Object, Object>>> getExamChartData() {
	//	return CanvasjsChartData.getCanvasjsDataList();
	//}
}

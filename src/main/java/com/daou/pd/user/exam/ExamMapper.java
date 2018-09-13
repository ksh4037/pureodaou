package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;

import com.daou.pd.admin.item.ItemVO;
import com.daou.pd.admin.item.OptionVO;

public interface ExamMapper {

	List<ExamListVO> getExamList(String id);

	ExamVO getIntro(HashMap<String, Object> map);

	ExamUserVO getSubIntro(HashMap<String, Object> map);

	Integer checkDegree(HashMap<String, Object> map);

	List<ItemVO> getObj(HashMap<String, Integer> map);

	List<ItemVO> getOX(HashMap<String, Integer> map);
	
	List<ItemVO> getShort(HashMap<String, Integer> map);

	List<OptionVO> getOptionList(int item_no);

	void makeTest(List<ExamDetailVO> list);
	
	Integer getExamNo(String id);

}

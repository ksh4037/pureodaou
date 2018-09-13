package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;

import com.daou.pd.admin.item.ItemVO;

public interface ExamMapper {

	List<ExamListVO> getExamList(String id);

	ExamVO getIntro(HashMap<String, Object> map);

	ExamUserVO getSubIntro(HashMap<String, Object> map);

	Integer checkDegree(HashMap<String, Object> map);

	List<ItemVO> getItemList(HashMap<String, Integer> map);

}

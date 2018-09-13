package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;

public interface ExamMapper {

	List<ExamListVO> getExamList(String id);

	ExamVO getIntro(HashMap<String, Object> map);

	ExamUserVO getSubIntro(HashMap<String, Object> map);
}

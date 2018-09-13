package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;

public interface ExamService {

	List<ExamListVO> getExamList(String id);

	ExamVO getIntro(HashMap<String, Object> map);

}

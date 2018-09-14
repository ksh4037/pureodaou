package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;

public interface ExamMapper {

	List<ExamListVO> getExamList(String id);

	ExamVO getIntro(HashMap<String, Object> map);

	ExamUserVO getSubIntro(HashMap<String, Object> map);
<<<<<<< HEAD

	Integer checkDegree(HashMap<String, Object> map);

	List<ItemVO> getObj(HashMap<String, Integer> map);

	List<ItemVO> getOX(HashMap<String, Integer> map);

	List<ItemVO> getShort(HashMap<String, Integer> map);

	List<OptionVO> getOptionList(int item_no);

	void makeTest(Map<String, Object> map);

	Integer getExamNo(String id);

	List<ItemVO> getExam(int exam_no);

	List<OptionVO> getExamOptions(HashMap<String, Object> map);

	int getTime(int exam_no);

	int markAnswer(MarkVO m);
	
	void changeStatus(HashMap<String, Object> map);

	void grading(MarkVO m);

	List<MarkVO> getAnswerSheet(int exam_no);

=======
>>>>>>> 2a5ef80316e10edd46b7712cafd123901ec695da
}

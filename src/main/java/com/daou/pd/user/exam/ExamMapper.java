package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.daou.pd.admin.problem.OptionVO;
import com.daou.pd.admin.question.QuestionVO;

public interface ExamMapper {
	public int test();

	public int getCount(int type);

	public List<OptionVO> getOption(int problem_seq);

	public List<QuestionVO> getOxList(int cnt);

	public List<QuestionVO> getObjList(int cnt);

	public Integer getPersence(HashMap<String, Object> map);

	public void insertExam(HashMap<String, List<ExamVO>> map);

	public List<QuestionVO> getexamList(Map<String, Object> map);

	public List<OptionVO> getoptionList(HashMap<String, Object> map);

	public List<ExamListVO> getExamList();

	public ExamListVO getQnum(int exam_test_no);

	public List<String> getExamStatus(HashMap<String, Object> map);

	public int markAnswer(HashMap<String, Object> map);
}

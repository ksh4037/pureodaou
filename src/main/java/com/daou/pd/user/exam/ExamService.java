package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;

import com.daou.pd.admin.problem.OptionVO;
import com.daou.pd.admin.problem.ProblemVO;

public interface ExamService {
	public int test();

	public List<ProblemVO> getProblem(int ox, int obj);

	public void tempRegist(List<ExamVO> exam);

	public List<ExamVO> getTemp(String reg_id);

	public void regist(List<ExamVO> exam);

	public void grading(String reg_id, int test_no);

	public int getCount(int type);

	public List<OptionVO> getOpList(int problem_seq);

	public int getPersence(String id, int degree);

	public void insertExam(List<ExamVO> examList);

	public List<ProblemVO> getExam(String id, int degree);

	public List<OptionVO> getExamOption(HashMap<String, Object> map);

	public List<ExamListVO> getexamList();

	public ExamListVO getQnum(int degree);

	public List<String> getExamStatus(HashMap<String, Object> map);

	public void getExamPaper(String id, int parseInt);

	public int markAnswer(HashMap<String, Object> map);

}

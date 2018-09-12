package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;

import com.daou.pd.admin.item.OptionVO;
import com.daou.pd.admin.item.ItemVO;

public interface ExamService {
	public int test();

	public List<ItemVO> getProblem(int ox, int obj);

	public void tempRegist(List<ExamUserVO> exam);

	public List<ExamUserVO> getTemp(String reg_id);

	public void regist(List<ExamUserVO> exam);

	public void grading(String reg_id, int test_no);

	public int getCount(int type);

	public List<OptionVO> getOpList(int problem_seq);

	public int getPersence(String id, int degree);

	public void insertExam(List<ExamUserVO> examList);

	public List<ItemVO> getExam(String id, int degree);

	public List<OptionVO> getExamOption(HashMap<String, Object> map);

	public List<ExamVO> getexamList();

	public ExamVO getQnum(int degree);

	public List<String> getExamStatus(HashMap<String, Object> map);

	public void getExamPaper(String id, int parseInt);

	public int markAnswer(HashMap<String, Object> map);

}

package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.daou.pd.admin.item.OptionVO;
import com.daou.pd.admin.item.ItemVO;

public interface ExamMapper {
	public int test();

	public int getCount(int type);

	public List<OptionVO> getOption(int problem_seq);

	public List<ItemVO> getOxList(int cnt);

	public List<ItemVO> getObjList(int cnt);

	public Integer getPersence(HashMap<String, Object> map);

	public void insertExam(HashMap<String, List<ExamUserVO>> map);

	public List<ItemVO> getexamList(Map<String, Object> map);

	public List<OptionVO> getoptionList(HashMap<String, Object> map);

	public List<ExamVO> getExamList();

	public ExamVO getQnum(int exam_test_no);

	public List<String> getExamStatus(HashMap<String, Object> map);

	public int markAnswer(HashMap<String, Object> map);
}

package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;

import com.daou.pd.admin.item.ItemVO;
import com.daou.pd.admin.item.OptionVO;

public interface ExamService {

	List<ExamListVO> getExamList(String id);

	ExamVO getIntro(HashMap<String, Object> map);

	int checkDegree(HashMap<String, Object> map);

	List<ItemVO> getItemList(HashMap<String, Integer> map);

	List<OptionVO> getOption(int item_no);

}

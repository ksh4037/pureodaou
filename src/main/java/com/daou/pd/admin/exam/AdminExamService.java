package com.daou.pd.admin.exam;

import java.util.HashMap;
import java.util.List;

import com.daou.pd.admin.employee.ConfigVO;
import com.daou.pd.admin.employee.EmpVO;
import com.daou.pd.admin.item.OptionVO;
import com.daou.pd.user.exam.ExamUserVO;
import com.daou.pd.user.exam.ExamVO;

public interface AdminExamService {

	public int examReg(ExamVO evo);
	
	public List<String> selectExamTarget(HashMap<String, Object> data);
	
	public int userExamReg(String emp_id);
	
	public List<ExamVO> examList();
	
	public List<HashMap<String, Object>> recordList();
	
	public List<ConfigVO> statusCodeList();
	
	public List<HashMap<String, Object>> getShortExamList(ExamUserVO euvo);

}

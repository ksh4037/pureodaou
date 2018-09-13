package com.daou.pd.admin.exam;

import java.util.HashMap;
import java.util.List;

import com.daou.pd.admin.employee.EmpVO;
import com.daou.pd.admin.item.ItemVO;
import com.daou.pd.user.exam.ExamVO;

public interface AdminExamMapper {
	
	public int examReg(ExamVO evo);
	public List<EmpVO> selectExamTarget(EmpVO pvo);
	public int userExamReg(String emp_id);
	
}

package com.daou.pd.admin.exam;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.daou.pd.admin.employee.EmpVO;
import com.daou.pd.admin.item.ItemMapper;
import com.daou.pd.admin.item.ItemVO;
import com.daou.pd.user.exam.ExamVO;

@Component("adminExamService")
public class AdminExamServiceImpl implements AdminExamService {
	@Resource(name = "sqlSession")
	
	private SqlSession sqlSession;
	private AdminExamMapper examMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int examReg(ExamVO evo) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.examReg(evo);
	}


	@Override
	public  List<String> selectExamTarget(HashMap<String, Object> data) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.selectExamTarget(data);
	}

	@Override
	public int userExamReg(String emp_id) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.userExamReg(emp_id);
	}
	
}

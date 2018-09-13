package com.daou.pd.admin.exam;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("adminExamService")
public class AdminExamServiceImpl implements AdminExamService {
	@Resource(name = "sqlSession")
	
	private SqlSession sqlSession;
	private AdminExamMapper examMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

}

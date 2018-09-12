package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("examService")
public class ExamServiceImpl implements ExamService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private ExamMapper examMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ExamListVO> getExamList(String id) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getExamList(id);
	}

	@Override
	public ExamVO getIntro(HashMap<String, Object> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		ExamVO evo = examMapper.getIntro(map);
		evo.setUservo(examMapper.getSubIntro(map));
		return evo;
	}

}

package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.daou.pd.admin.item.ItemVO;
import com.daou.pd.admin.item.OptionVO;

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

	@Override
	public int checkDegree(HashMap<String, Object> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		Integer n = examMapper.checkDegree(map);
		if (n == null)
			return 0;
		else
			return n;
	}

	@Override
	public List<ItemVO> getItemList(HashMap<String, Integer> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getItemList(map);
	}

	@Override
	public List<OptionVO> getOption(int item_no) {
		// TODO Auto-generated method stub
		return null;
	}

}

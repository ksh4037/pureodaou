package com.daou.pd.admin.question;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("questionService")
public class QuestionServiceImpl implements QuestionService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private QuestionMapper questionMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 문제관리

	@Override
	public List<QuestionVO> questionList(QuestionVO pvo) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.questionList(pvo);
	}

	@Override
	public QuestionVO questionDetail(int q_seq) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.questionDetail(q_seq);
	}

	@Override
	public int questionReg(QuestionVO pvo) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.questionReg(pvo);
	}

	@Override
	public int selectQuestionSeq() {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.selectQuestionSeq();
	}

	@Override
	public int deleteQuestion(int q_seq) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.deleteQuestion(q_seq);
	}

	@Override
	public int questionUpdt(QuestionVO pvo) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.questionUpdt(pvo);
	}

	// 보기관리
	@Override
	public List<HashMap<String, Object>> optionDetail(int q_seq) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.optionDetail(q_seq);
	}

	@Override
	public int optionReg(OptionVO ovo) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.optionReg(ovo);
	}

	@Override
	public int deleteOption(int q_seq) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.deleteOption(q_seq);
	}

	// 카테고리 관리

	@Override
	public List<QuestionVO> categoryList() {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.categoryList();
	}

	@Override
	public QuestionVO categoryDetail(int c_seq) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.categoryDetail(c_seq);
	}

	@Override
	public int categoryUpdt(QuestionVO pvo) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.categoryUpdt(pvo);
	}

	@Override
	public int categoryReg(QuestionVO pvo) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.categoryReg(pvo);
	}

	@Override
	public int deleteCategory(int c_seq) {
		questionMapper = sqlSession.getMapper(QuestionMapper.class);
		return questionMapper.deleteCategory(c_seq);
	}

}

package com.daou.pd.admin.board;


import javax.annotation.Resource;

import java.util.HashMap;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.apache.ibatis.session.SqlSession;
import com.daou.pd.user.exam.ExamVO;

@Component("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private BoardMapper boardMapper;
	

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Bean
	public BoardMapper boardMapper() {
		return sqlSession.getMapper(BoardMapper.class); 
	}
	
	@Override
	public List<BoardVO> degreeList() {
		return boardMapper().degreeList();
	}
	
	@Override
	public List<BoardVO> deptList() {
		return boardMapper().deptList();
	}
	
	@Override
	public List<BoardVO> gradeList() {
		return boardMapper().gradeList();
	}
	
	@Override
	public int selectTarget(ExamVO exvo) {
		return boardMapper().selectTarget(exvo);
	}
	
	@Override
	public int selectTargetDo(ExamVO exvo) {
		return boardMapper().selectTargetDo(exvo);
	}
	
	@Override
	public int selectPass(ExamVO exvo) {
		return boardMapper().selectPass(exvo);
	}
	
	
	@Override
	public double deptAverage(ExamVO exvo) {
		return boardMapper().deptAverage(exvo);
	}
		
	@Override
	public double gradeAverage(ExamVO exvo) {
		return boardMapper().gradeAverage(exvo);
	}
	
	@Override	
	public List<HashMap<String,Object>> rankWrongCount(ExamVO exvo){
		return boardMapper().rankWrongCount(exvo);
	}
	

}

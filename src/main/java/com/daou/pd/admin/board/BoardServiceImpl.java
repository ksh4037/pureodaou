package com.daou.pd.admin.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import org.springframework.beans.factory.annotation.Autowired;

import com.daou.pd.admin.board.BoardMapper;

@Component("boardService")
public class BoardServiceImpl implements BoardService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	@Autowired
	private BoardMapper boardMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void setBoardMapper(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}
 
	/*@Override
	public List<List<Map<Object, Object>>> getExamChartData() {
		return boardMapper.getExamChartData();
	}*/
	
	
	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		boardMapper = sqlSession.getMapper(BoardMapper.class);
		return boardMapper.boardList();
	}
}

package com.daou.pd.admin.board;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("boardService")
public class BoardServiceImpl implements BoardService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private BoardMapper boardMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		boardMapper = sqlSession.getMapper(BoardMapper.class);
		return boardMapper.boardList();
	}
}

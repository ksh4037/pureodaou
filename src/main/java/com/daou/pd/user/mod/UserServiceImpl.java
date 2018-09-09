package com.daou.pd.user.mod;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("userService")
public class UserServiceImpl implements UserService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private UserMapper userMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int checkUser(UserVO uvo) {
		userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.checkUser(uvo);
	}

}

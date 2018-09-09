package com.daou.pd.user.mod;

import java.util.List;
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
	public int selectUser(UserVO uvo) {
		userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.selectUser(uvo);
	}

	public int userIdCheck(UserVO uvo) {
		userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.userIdCheck(uvo);
	}

	@Override
	public UserVO memberView(UserVO uvo) {
		userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.memberView(uvo);
	}

	@Override
	public List<UserVO> deptList() {
		userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.deptList();
	}

	@Override
	public void updateMember(UserVO uvo) throws Exception {
		userMapper = sqlSession.getMapper(UserMapper.class);
		userMapper.updateMember(uvo);
	}

}

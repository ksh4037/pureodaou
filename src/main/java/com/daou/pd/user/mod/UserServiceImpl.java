package com.daou.pd.user.mod;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component("userService")
public class UserServiceImpl implements UserService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private UserMapper userMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Bean
	public UserMapper userMapper() {
		return sqlSession.getMapper(UserMapper.class);
	}
	

	@Override
	public int selectUser(UserVO uvo) {
		return userMapper().selectUser(uvo);
	}

	public int userIdCheck(UserVO uvo) {
		return userMapper().userIdCheck(uvo);
	}

	@Override
	public UserVO memberView(UserVO uvo) {
		return userMapper().memberView(uvo);
	}
	
	@Override
	public HashMap<String,Object> memberViewAll(String emp_id) {
		return userMapper().memberViewAll(emp_id);
	}

	@Override
	public List<UserVO> deptList() {
		return userMapper().deptList();
	}

	@Override
	public List<UserVO> gradeList() {
		return userMapper().gradeList();
	}

	@Override
	public void updateMember(UserVO uvo) throws Exception {
		userMapper = userMapper();
		userMapper.updateMember(uvo);
	}

}

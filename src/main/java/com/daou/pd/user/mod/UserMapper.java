package com.daou.pd.user.mod;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {
	public int selectUser(UserVO uvo);

	public int userIdCheck(UserVO uvo);

	public HashMap<String,Object> memberViewAll(String emp_id);
	
	public UserVO memberView(UserVO uvo);

	public List<UserVO> deptList();

	public List<UserVO> gradeList();

	public void updateMember(UserVO uvo) throws Exception;
}

package com.daou.pd.user.mod;

import java.util.List;

public interface UserService {

	public int selectUser(UserVO uvo);

	public int userIdCheck(UserVO uvo);

	public UserVO memberView(UserVO uvo);

	public List<UserVO> deptList();

	public void updateMember(UserVO uvo) throws Exception;
}

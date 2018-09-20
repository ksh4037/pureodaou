package com.daou.pd.admin.employee;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;


@Component("EmpService")

public class EmpServiceImpl implements EmpService {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private EmpMapper empMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Bean
	public EmpMapper empMapper() {
		return sqlSession.getMapper(EmpMapper.class);
	}

	@Override
	public int selectAdmin(EmpVO evo) {
		return empMapper().selectAdmin(evo);
	}

	@Override
	public List<HashMap<String, Object>> memberList() {
		return empMapper().memberList();
	}

	@Override
	public void insertMember(EmpVO evo) throws Exception {
		empMapper = empMapper();
		empMapper.insertMember(evo);
	}

	@Override
	public void deleteMember(List<String> idNoList) {
		empMapper = empMapper();
		empMapper.deleteMember(idNoList);
	}

	@Override
	public EmpVO memberView(EmpVO evo) {
		return empMapper().memberView(evo);
	}

	@Override
	public HashMap<String,Object> memberViewAll(String emp_id) {
		return empMapper().memberViewAll(emp_id);
	}
	
	@Override
	public List<EmpVO> deptList() {
		return empMapper().deptList();
	}
	
	@Override
	public List<EmpVO> gradeList() {
		return empMapper().gradeList();
	}

	@Override
	public void updateMember(EmpVO evo) throws Exception {
		empMapper = empMapper();
		empMapper.updateMember(evo);
	}

	@Override
	public int employeeIdCheck(EmpVO evo) {
		return empMapper().employeeIdCheck(evo);
	}

}

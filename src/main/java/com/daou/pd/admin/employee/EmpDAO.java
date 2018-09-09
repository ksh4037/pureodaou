package com.daou.pd.admin.employee;

import java.util.Map;

public class EmpDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectEmp(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("admin.employee.selectEmp", map);
	}

	private Map<String, Object> selectOne(String string, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
}
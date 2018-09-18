package com.daou.pd.admin.exam;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.daou.pd.admin.employee.ConfigVO;
import com.daou.pd.admin.employee.EmpVO;
import com.daou.pd.admin.item.ItemMapper;
import com.daou.pd.admin.item.ItemVO;
import com.daou.pd.user.exam.ExamDetailVO;
import com.daou.pd.user.exam.ExamUserVO;
import com.daou.pd.user.exam.ExamVO;

@Component("adminExamService")
public class AdminExamServiceImpl implements AdminExamService {
	@Resource(name = "sqlSession")
	
	private SqlSession sqlSession;
	private AdminExamMapper examMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int examReg(ExamVO evo) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.examReg(evo);
	}


	@Override
	public  List<String> selectExamTarget(HashMap<String, Object> data) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.selectExamTarget(data);
	}

	@Override
	public int userExamReg(String emp_id) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.userExamReg(emp_id);
	}
	
	@Override
	public List<ExamVO> examList() {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.examList();
	}
	
	
	@Override
	public List<HashMap<String, Object>> recordList(HashMap<String, Object> searchData) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.recordList(searchData);
	}
	
	
	@Override
	public List<ConfigVO> statusCodeList() {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.statusCodeList();
	}
	
	@Override
	public List<HashMap<String, Object>> getShortExamList(ExamUserVO euvo) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.getShortExamList(euvo);
	}
	
	@Override
	public int updtExamDetail(ExamDetailVO euvo) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.updtExamDetail(euvo);
	}
	
	@Override
	public int selectTotalCorrectYn(ExamDetailVO euvo) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.selectTotalCorrectYn(euvo);
	}
	
	@Override
	public int updtExamScore(ExamUserVO evo) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.updtExamScore(evo);
	}
	
	@Override
	public int selectPassScore(ExamUserVO evo) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.selectPassScore(evo);
	}
	
	@Override
	public int finalExamUpdate(ExamUserVO evo) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.finalExamUpdate(evo);
	}
	
	@Override
	public int insertFailUser(ExamUserVO evo) {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.insertFailUser(evo);
	}
	
	@Override
	public  List<ExamVO> examInfoList() {
		examMapper = sqlSession.getMapper(AdminExamMapper.class);
		return examMapper.examInfoList();
	}
	
}

package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.daou.pd.admin.problem.OptionVO;
import com.daou.pd.admin.problem.ProblemVO;

@Component("examService")
public class ExamServiceImpl implements ExamService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private ExamMapper examMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int test() {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.test();
	}

	@Override
	public List<ProblemVO> getProblem(int ox, int obj) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		List<ProblemVO> oxlist = examMapper.getOxList(ox);
		List<ProblemVO> objlist = examMapper.getObjList(obj);
		oxlist.addAll(objlist);
		return oxlist;
	}

	@Override
	public void grading(String reg_id, int test_no) {

	}

	@Override
	public void tempRegist(List<ExamVO> exam) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ExamVO> getTemp(String reg_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void regist(List<ExamVO> exam) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getCount(int type) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getCount(type);
	}

	@Override
	public List<OptionVO> getOpList(int problem_seq) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getOption(problem_seq);
	}

	@Override
	public int getPersence(String id, int degree) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reg_id", id);
		map.put("exam_test_no", degree);
		examMapper = sqlSession.getMapper(ExamMapper.class);
		Integer i = examMapper.getPersence(map);
		if (i == null) {
			return 0;
		} else {
			return (int) i;
		}
	}

	@Override
	public void insertExam(List<ExamVO> examList) {
		HashMap<String, List<ExamVO>> map = new HashMap<String, List<ExamVO>>();
		map.put("examList", examList);
		examMapper = sqlSession.getMapper(ExamMapper.class);
		examMapper.insertExam(map);
	}

	@Override
	public List<ProblemVO> getExam(String id, int degree) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reg_id", id);
		map.put("exam_test_no", degree);
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getexamList(map);
	}

	@Override
	public List<OptionVO> getExamOption(HashMap<String, Object> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getoptionList(map);
	}

	@Override
	public List<ExamListVO> getexamList() {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getExamList();
	}

	@Override
	public ExamListVO getQnum(int degree) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getQnum(degree);
	}

	@Override
	public List<String> getExamStatus(HashMap<String, Object> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getExamStatus(map);
	}

	@Override
	public void getExamPaper(String id, int parseInt) {

	}

	@Override
	public int markAnswer(HashMap<String, Object> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.markAnswer(map);
	}

}

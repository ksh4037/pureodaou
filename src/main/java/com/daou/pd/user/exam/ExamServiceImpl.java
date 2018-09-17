package com.daou.pd.user.exam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.daou.pd.admin.item.ItemVO;
import com.daou.pd.admin.item.OptionVO;

@Component("examService")
public class ExamServiceImpl implements ExamService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private ExamMapper examMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ExamListVO> getExamList(String id) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getExamList(id);
	}

	@Override
	public ExamVO getIntro(HashMap<String, Object> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		ExamVO evo = examMapper.getIntro(map);
		evo.setUservo(examMapper.getSubIntro(map));
		return evo;
	}

	@Override
	public int checkDegree(HashMap<String, Object> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		Integer n = examMapper.checkDegree(map);
		if (n == null)
			return 0;
		else
			return n;
	}

	@Override
	public List<ItemVO> getItemList(HashMap<String, Integer> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		List<ItemVO> list = examMapper.getOX(map);
		list.addAll(examMapper.getObj(map));
		list.addAll(examMapper.getShort(map));
		return list;
	}

	@Override
	public List<OptionVO> getOption(int item_no) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getOptionList(item_no);
	}

	@Override
	public void makeTest(List<ExamDetailVO> list) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dlist", list);
		examMapper.makeTest(map);
	}

	@Override
	public Integer getExamNo(String id) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getExamNo(id);
	}

	@Override
	public List<ItemVO> getExam(int exam_no) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getExam(exam_no);
	}

	@Override
	public List<OptionVO> getExamOptions(HashMap<String, Object> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getExamOptions(map);
	}

	@Override
	public int getTime(int exam_no) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getTime(exam_no);
	}

	@Override
	public int markAnswer(HashMap<String, Object> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		List<MarkVO> mlist = (List<MarkVO>) map.get("answerList");
		for (MarkVO m : mlist) {
			examMapper.markAnswer(m);
		}
		return 0;
	}

	@Override
	public void changeStatus(HashMap<String, Object> map) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		examMapper.changeStatus(map);
	}

	@Override
	public void grading(List<MarkVO> mlist) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		for (MarkVO m : mlist) {
			if (m.getCorrect_yn() != null)
				examMapper.grading(m);
		}
	}

	@Override
	public List<MarkVO> getAnswerSheet(int exam_no) {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.getAnswerSheet(exam_no);
	}

}

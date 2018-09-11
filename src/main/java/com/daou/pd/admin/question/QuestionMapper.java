package com.daou.pd.admin.question;

import java.util.HashMap;
import java.util.List;

public interface QuestionMapper {

	// 문제관리
	public List<QuestionVO> questionList(QuestionVO pvo);

	public QuestionVO questionDetail(int q_seq);

	public int questionReg(QuestionVO pvo);

	public int questionUpdt(QuestionVO pvo);

	public int deleteQuestion(int q_seq);

	public int selectQuestionSeq();

	// 보기관리
	public List<HashMap<String, Object>> optionDetail(int q_seq);

	public int optionReg(OptionVO ovo);

	public int deleteOption(int q_seq);

	// 카테고리관리
	public List<QuestionVO> categoryList();

	public QuestionVO categoryDetail(int c_seq);

	public int categoryReg(QuestionVO pvo);

	public int categoryUpdt(QuestionVO pvo);

	public int deleteCategory(int c_seq);
}

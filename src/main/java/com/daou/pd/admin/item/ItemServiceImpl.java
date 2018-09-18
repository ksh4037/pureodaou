package com.daou.pd.admin.item;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import com.daou.pd.user.exam.ExamMapper;


@Component("itemService")
public class ItemServiceImpl implements ItemService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Bean
	public ItemMapper itemMapper() {
		return sqlSession.getMapper(ItemMapper.class);
	}
	
	
	// 문제관리
	@Override
	public List<ItemVO> itemList(ItemVO ivo) {
		return itemMapper().itemList(ivo);
	}

	@Override
	public ItemVO itemDetail(int item_no) {
		return itemMapper().itemDetail(item_no);
	}

	@Override
	public int itemReg(ItemVO ivo) {
		return itemMapper().itemReg(ivo);
	}

	@Override
	public int selectItemSeq() {
		return itemMapper().selectItemSeq();
	}

	@Override
	public int deleteItem(List<String> itemNoList) {
		return itemMapper().deleteItem(itemNoList);
	}

	@Override
	public int itemUpdt(ItemVO ivo) {
		return itemMapper().itemUpdt(ivo);
	}

	
	
	// 보기관리
	@Override
	public List<HashMap<String, Object>> optionDetail(int item_no) {
		return itemMapper().optionDetail(item_no);
	}

	@Override
	public int optionReg(OptionVO ovo) {
		return itemMapper().optionReg(ovo);
	}

	@Override
	public int deleteOption(int item_no) {
		return itemMapper().deleteOption(item_no);
	}

	
	
	// 카테고리 관리
	@Override
	public List<ItemVO> categoryList() {
		return itemMapper().categoryList();
	}

	@Override
	public ItemVO categoryDetail(int category_no) {
		return itemMapper().categoryDetail(category_no);
	}

	@Override
	public int categoryUpdt(ItemVO ivo) {
		return itemMapper().categoryUpdt(ivo);
	}

	@Override
	public int categoryReg(ItemVO ivo) {
		return itemMapper().categoryReg(ivo);
	}

	@Override
	public int deleteCategory(int category_no) {
		return itemMapper().deleteCategory(category_no);
	}

}

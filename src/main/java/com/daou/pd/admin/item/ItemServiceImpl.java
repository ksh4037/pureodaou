package com.daou.pd.admin.item;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;


@Component("itemService")
public class ItemServiceImpl implements ItemService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private ItemMapper itemMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 문제관리

	@Override
	public List<ItemVO> itemList(ItemVO ivo) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.itemList(ivo);
	}

	@Override
	public ItemVO itemDetail(int item_no) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.itemDetail(item_no);
	}

	@Override
	public int itemReg(ItemVO ivo) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.itemReg(ivo);
	}

	@Override
	public int selectItemSeq() {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.selectItemSeq();
	}

	@Override
	public int deleteItem(List<String> itemNoList) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.deleteItem(itemNoList);
	}

	@Override
	public int itemUpdt(ItemVO ivo) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.itemUpdt(ivo);
	}

	// 보기관리
	@Override
	public List<HashMap<String, Object>> optionDetail(int item_no) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.optionDetail(item_no);
	}

	@Override
	public int optionReg(OptionVO ovo) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.optionReg(ovo);
	}

	@Override
	public int deleteOption(int item_no) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.deleteOption(item_no);
	}

	// 카테고리 관리

	@Override
	public List<ItemVO> categoryList() {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.categoryList();
	}

	@Override
	public ItemVO categoryDetail(int category_no) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.categoryDetail(category_no);
	}

	@Override
	public int categoryUpdt(ItemVO ivo) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.categoryUpdt(ivo);
	}

	@Override
	public int categoryReg(ItemVO ivo) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.categoryReg(ivo);
	}

	@Override
	public int deleteCategory(int category_no) {
		itemMapper = sqlSession.getMapper(ItemMapper.class);
		return itemMapper.deleteCategory(category_no);
	}

}

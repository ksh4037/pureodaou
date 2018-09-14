package com.daou.pd.admin.item;

import java.util.HashMap;
import java.util.List;

public interface ItemMapper {

	// 문제관리
	public List<ItemVO> itemList(ItemVO ivo);

	public ItemVO itemDetail(int item_no);

	public int itemReg(ItemVO ivo);

	public int itemUpdt(ItemVO ivo);

	public int deleteItem(int item_no);

	public int selectItemSeq();

	// 보기관리
	public List<HashMap<String, Object>> optionDetail(int item_no);

	public int optionReg(OptionVO ovo);

	public int deleteOption(int item_no);

	// 카테고리관리
	public List<ItemVO> categoryList();

	public ItemVO categoryDetail(int category_no);

	public int categoryReg(ItemVO ivo);

	public int categoryUpdt(ItemVO ivo);

	public int deleteCategory(int category_no);
	
}

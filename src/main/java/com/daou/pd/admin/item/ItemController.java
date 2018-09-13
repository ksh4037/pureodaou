package com.daou.pd.admin.item;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItemController {
	@Autowired
	@Resource(name = "itemService")
	private ItemService itemService;

	@RequestMapping(value = "admin/itemList.daou")
	public ModelAndView itemList(HttpServletRequest request, HttpServletResponse response, ItemVO ivo) {
		ModelAndView mav = new ModelAndView("admin/item/itemList");
		List<ItemVO> itemList = itemService.itemList(ivo);
		List<ItemVO> categoryList = itemService.categoryList();

		mav.addObject("categoryList", categoryList);
		mav.addObject("itemList", itemList);
		return mav;
	}

	@RequestMapping(value = "admin/itemDetail.daou", method = RequestMethod.POST)
	public ModelAndView itemDetail(@RequestParam(value = "item_no") int item_no, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("admin/item/itemDetail");

		ItemVO itemDetail = itemService.itemDetail(item_no);
		List<HashMap<String, Object>> optionDetail = itemService.optionDetail(item_no);

		List<ItemVO> categoryList = itemService.categoryList();
		mav.addObject("categoryList", categoryList);

		mav.addObject("itemDetail", itemDetail);
		mav.addObject("optionDetail", optionDetail);

		return mav;
	}

	@RequestMapping(value = "admin/itemRegForm.daou")
	public ModelAndView itemRegForm(HttpServletRequest request, HttpServletResponse response, ItemVO ivo) {
		ModelAndView mav = new ModelAndView("admin/item/itemRegForm");

		List<ItemVO> categoryList = itemService.categoryList();
		mav.addObject("categoryList", categoryList);

		return mav;
	}

	@RequestMapping(value = "admin/itemReg.daou")
	public ModelAndView itemReg(HttpServletRequest request, HttpServletResponse response, ItemVO ivo,
			OptionVO ovo, @RequestParam(value = "option_contents") String[] option_contents) {


		ModelAndView mav = new ModelAndView("admin/item/result");

		String msg = "";
		int i_result = 0;
		int o_result = 0;

		try {
			if (ivo.getItem_type().equals("1") || ivo.getItem_type().equals("3")) { // O/X 二쇨��떇 ���옣

				i_result = itemService.itemReg(ivo);
				int item_no = itemService.selectItemSeq();
				
				ovo.setItem_no(item_no);
				ovo.setCorrect_yn("Y");

				ovo.setOption_contents(option_contents[0]);
				o_result += itemService.optionReg(ovo);

				if (i_result == 1 && o_result >= 1) {
					msg = "success";
				} else {
					msg = "error";
				}

			} else if (ivo.getItem_type().equals("2")) { // 媛앷��떇 ���옣

				i_result = itemService.itemReg(ivo);
				int item_no = itemService.selectItemSeq();

				ovo.setItem_no(item_no);

				for (int i = 0; i < option_contents.length; i++) {

					if (i == ivo.getAnswer_no()) { // �젙�떟�씤 蹂닿린�쓽 �쐞移�
						ovo.setCorrect_yn("Y");
					} else {
						ovo.setCorrect_yn("N");
					}

					ovo.setOption_contents(option_contents[i]);
					o_result += itemService.optionReg(ovo);
				}
				
				if (i_result == 1 && o_result >= 1) {
					msg = "success";
				} else {
					msg = "error";
				}
				

			}

		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}

		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/deleteItem.daou")
	public ModelAndView deleteItem(HttpServletRequest request, HttpServletResponse response, ItemVO ivo) {
		ModelAndView mav = new ModelAndView("admin/item/result");
		String msg = "";

		try {
			int result = itemService.deleteItem(ivo.getItem_no());

			if (result == 1) {
				msg = "success";
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}

		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/itemUpdtForm.daou")
	public ModelAndView itemUpdtForm(@RequestParam(value = "item_no") int item_no, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("admin/item/itemUpdtForm");

		ItemVO itemDetail = itemService.itemDetail(item_no);
		List<HashMap<String, Object>> optionDetail = itemService.optionDetail(item_no);

		List<ItemVO> categoryList = itemService.categoryList();
		mav.addObject("categoryList", categoryList);

		mav.addObject("itemDetail", itemDetail);
		mav.addObject("optionDetail", optionDetail);

		return mav;
	}

	@RequestMapping(value = "admin/itemUpdt.daou")
	public ModelAndView itemUpdt(HttpServletRequest request, HttpServletResponse response, ItemVO ivo,
			OptionVO ovo, @RequestParam(value = "option_contents") String[] option_contents) {

		ModelAndView mav = new ModelAndView("admin/item/result");
		String msg = "";
		int i_update_result = 0;
		int o_delete_result = 0;
		int o_reg_result = 0;
		
		try {
			if (ivo.getItem_type().equals("1") || ivo.getItem_type().equals("3")) { // O/X , 二쇨��떇 ���옣

				i_update_result = itemService.itemUpdt(ivo);
				o_delete_result = itemService.deleteOption(ivo.getItem_no());

				ovo.setItem_no(ivo.getItem_no());
				ovo.setCorrect_yn("Y");

				ovo.setOption_contents(option_contents[0]);
				o_reg_result += itemService.optionReg(ovo);

				if (i_update_result >= 1 && o_delete_result >= 1 && o_reg_result >= 1) {
					msg = "success";
				} else {
					msg = "error";
				}

			} else if (ivo.getItem_type().equals("2")) { // 媛앷��떇 ���옣

				i_update_result = itemService.itemUpdt(ivo);
				o_delete_result = itemService.deleteOption(ivo.getItem_no());

				ovo.setItem_no(ivo.getItem_no());

				for (int i = 0; i < option_contents.length; i++) {

					if (i == ivo.getAnswer_no()) { // 泥� 踰덉㎏媛� �젙�떟�씠�땲源�
						ovo.setCorrect_yn("Y");
					} else {
						ovo.setCorrect_yn("N");
					}

					ovo.setOption_contents(option_contents[i]);
					o_reg_result += itemService.optionReg(ovo);
				}

				if (i_update_result >= 1 && o_delete_result >= 1 && o_reg_result >= 1) {
					msg = "success";
				} else {
					msg = "error";
				}
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/deleteChkItem.daou")
	public ModelAndView deleteChkItem(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "rowid") Integer[] checkList) {

		ModelAndView mav = new ModelAndView("admin/item/result");
		int result = 0;
		String msg = "";

		try {

			for (int i = 0; i < checkList.length; i++) {
				result += itemService.deleteItem(checkList[i]);
			}

			if (result >= 1) {
				msg = "success";
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}

		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/categoryList.daou")
	public ModelAndView categoryList() {
		ModelAndView mav = new ModelAndView("admin/item/categoryList");

		List<ItemVO> categoryList = itemService.categoryList();
		mav.addObject("categoryList", categoryList);

		return mav;
	}

	@RequestMapping(value = "admin/categoryDetail.daou")
	public ModelAndView categoryDetail(@RequestParam(value = "category_no") int category_no,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav;
		String caller = request.getParameter("caller");

		if (caller.equals("updt")) {
			mav = new ModelAndView("admin/item/categoryUpdtForm");

			ItemVO categoryDetail = itemService.categoryDetail(category_no);
			mav.addObject("categoryDetail", categoryDetail);

		} else {
			mav = new ModelAndView("admin/item/categoryDetail");

			ItemVO categoryDetail = itemService.categoryDetail(category_no);
			mav.addObject("categoryDetail", categoryDetail);
		}

		return mav;
	}

	@RequestMapping(value = "admin/categoryUpdt.daou")
	public ModelAndView categoryUpdt(HttpServletRequest request, HttpServletResponse response, ItemVO ivo) {

		ModelAndView mav = new ModelAndView("admin/item/result");
		int result = 0;
		String msg = "";
		try {
			result = itemService.categoryUpdt(ivo);
			if (result == 1) {
				msg = "success";
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/categoryRegForm.daou")
	public ModelAndView categoryRegForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("admin/item/categoryRegForm");
		return mav;
	}

	@RequestMapping(value = "admin/categoryReg.daou")
	public ModelAndView categoryReg(HttpServletRequest request, HttpServletResponse response, ItemVO ivo) {

		ModelAndView mav = new ModelAndView("admin/item/result");
		int result = 0;
		String msg = "";

		try {

			result = itemService.categoryReg(ivo);

			if (result >= 1) {
				msg = "success";
			} else {
				msg = "error";
			}

		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}
		mav.addObject("resultCode", msg);
		return mav;
	}

	@RequestMapping(value = "admin/deleteCategory.daou")
	public ModelAndView deleteCategory(HttpServletRequest request, HttpServletResponse response, ItemVO ivo) {

		ModelAndView mav = new ModelAndView("admin/item/result");
		String msg = "";

		try {
			int result = itemService.deleteCategory(ivo.getCategory_no());
			if (result == 1) {
				msg = "success";
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}

		mav.addObject("resultCode", msg);

		return mav;
	}

	@RequestMapping(value = "admin/deleteChkCategory.daou")
	public ModelAndView deleteChkCategory(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "rowid") Integer[] checkList) {

		ModelAndView mav = new ModelAndView("admin/item/result");
		int result = 0;
		String msg = "";

		try {

			for (int i = 0; i < checkList.length; i++) {
				result += itemService.deleteCategory(checkList[i]);
			}

			if (result >= 1) {
				msg = "success";
			} else {
				msg = "error";
			}
		} catch (Exception e) {
			mav.addObject("resultCode", "error");
		}

		mav.addObject("resultCode", msg);
		return mav;
	}

}

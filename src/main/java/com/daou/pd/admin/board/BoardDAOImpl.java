package com.daou.pd.admin.board;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.daou.pd.admin.board.CanvasjsChartData;

@Component("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Override
	public List<List<Map<Object, Object>>> getCanvasjsChartData() {
		return CanvasjsChartData.getCanvasjsDataList();
	}
}

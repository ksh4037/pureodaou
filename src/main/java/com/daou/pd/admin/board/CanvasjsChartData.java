package com.daou.pd.admin.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CanvasjsChartData {

	static Map<Object,Object> map = null;
	static List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
	static List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();
	static List<Map<Object,Object>> dataPoints2 = new ArrayList<Map<Object,Object>>();
	static List<Map<Object,Object>> dataPoints3 = new ArrayList<Map<Object,Object>>();
	static List<Map<Object,Object>> dataPoints4 = new ArrayList<Map<Object,Object>>();
	
	static {
		map = new HashMap<Object,Object>(); map.put("x", 1262284200000L); map.put("y", 0.4);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1293820200000L); map.put("y", 0.4);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1325356200000L); map.put("y", 0.4);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1356978600000L); map.put("y", 0.4);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1388514600000L); map.put("y", 0.4);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1420050600000L); map.put("y", 0.4);dataPoints1.add(map);
 
		map = new HashMap<Object,Object>(); map.put("x", 1262284200000L); map.put("y", 0.1);dataPoints2.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1293820200000L); map.put("y", 0.1);dataPoints2.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1325356200000L); map.put("y", 0.1);dataPoints2.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1356978600000L); map.put("y", 0.1);dataPoints2.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1388514600000L); map.put("y", 0.1);dataPoints2.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1420050600000L); map.put("y", 0.2);dataPoints2.add(map);
 
		map = new HashMap<Object,Object>(); map.put("x", 1262284200000L); map.put("y", 0.3);dataPoints3.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1293820200000L); map.put("y", 0.4);dataPoints3.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1325356200000L); map.put("y", 0.4);dataPoints3.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1356978600000L); map.put("y", 0.3);dataPoints3.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1388514600000L); map.put("y", 0.4);dataPoints3.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1420050600000L); map.put("y", 0.4);dataPoints3.add(map);
 
		map = new HashMap<Object,Object>(); map.put("x", 1262284200000L); map.put("y", 0.4);dataPoints4.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1293820200000L); map.put("y", 0.5);dataPoints4.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1325356200000L); map.put("y", 0.6);dataPoints4.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1356978600000L); map.put("y", 0.7);dataPoints4.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1388514600000L); map.put("y", 0.8);dataPoints4.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1420050600000L); map.put("y", 0.8);dataPoints4.add(map);
		
		list.add(dataPoints1);
		list.add(dataPoints2);
		list.add(dataPoints3);
		list.add(dataPoints4);
	}
 
	public static List<List<Map<Object, Object>>> getCanvasjsDataList() {
		return list;
	}

}

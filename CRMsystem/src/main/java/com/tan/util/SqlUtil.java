package com.tan.util;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

//封装的查询类，将要查询的数据写入的map中与数据库中的数据对比
public class SqlUtil {
	@SuppressWarnings("rawtypes")
	public static String getSqlCondition(Map<String, String> paramMap) {
		String sql = " obj where ";
		Iterator iterator = paramMap.entrySet().iterator();//entrySet()的返回值也是返回一个entry集合
														  //Set entrySet(): 返回Map.Entry对象的视图集，即映像中的关键字/值对
		while(iterator.hasNext()) {
			Entry entry = (Entry) iterator.next();
			Object key = entry.getKey();
			Object value = entry.getValue();
			if (iterator.hasNext()) {
				sql += "obj." + key.toString() + "=" + "'" + value.toString() + "'" + " and ";
			} else {
				sql += "obj." + key.toString() + "=" + "'" + value.toString() + "'";
			}
		}
		return sql;
	}
}

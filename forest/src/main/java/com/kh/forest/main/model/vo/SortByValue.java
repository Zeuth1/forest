package com.kh.forest.main.model.vo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class SortByValue {
	
	public SortByValue(){}
	
	public List sortByValue(HashMap map){
		
		List<String> list = new ArrayList();
		list.addAll(map.keySet());
		
		Collections.sort(list, new Comparator(){
			public int compare(Object o1, Object o2){
				Object v1 = Integer.parseInt((String)map.get(o1));
				Object v2 = Integer.parseInt((String)map.get(o2));
				
				return ((Comparable) v2).compareTo(v1);
				
			}
		});
		
		//주석 해제 시 오름차순
		//Collections.reverse(list);
		return list;
	}
}

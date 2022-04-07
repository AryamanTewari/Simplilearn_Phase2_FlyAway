package com.flyaway.dao;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Utils {

	public static Map<String,String> getWeekDays() {

		Map<String,String>weekMap = new LinkedHashMap<>();
		weekMap.put("Sun", "Sunday");
		weekMap.put("Mon", "Monday");
		weekMap.put("Tue", "Tuesday");
		weekMap.put("Wed", "Wednesday");
		weekMap.put("Thu", "Thursday");
		weekMap.put("Fri", "Friday");
		weekMap.put("Sat", "Saturday");

		return weekMap;

	}




	public static List<String> getClasses(){
		List<String> classList = new ArrayList<>();
		classList.add("Economy");
		classList.add("Premium");
		classList.add("Business");

		return classList;
	}

}

package com.flyaway.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	private static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	// read a date string and parse/convert to a date
	public static Date parseDate(String dateStr) throws ParseException {
		Date theDate = formatter.parse(dateStr);

		return theDate;        
	}

	// read a date and format/convert to a string
	public static String formatDate(Date theDate) {

		String result = null;

		if (theDate != null) {
			result = formatter.format(theDate);
		}

		return result;
	}

}

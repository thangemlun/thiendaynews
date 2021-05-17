package com.thienday.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class DateDiffUtils {
	public long getCreatedDaysDiff(Date createdDate) throws ParseException{
		DateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		  Date currentDate = new Date();
		  Date date1 = null;
		  Date date2 = null;
		  	String startDate = simpleDateFormat.format(createdDate);
			String endDate = simpleDateFormat.format(currentDate);
				 date1 = simpleDateFormat.parse(startDate);
				 date2 = simpleDateFormat.parse(endDate);

				   long getDiff = date2.getTime() - date1.getTime();
				   long getDaysDiff = getDiff / (24 * 60 * 60 * 1000);				   
			return getDaysDiff;
	}
}

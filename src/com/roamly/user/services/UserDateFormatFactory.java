package com.roamly.user.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.roamly.user.beans.UserDateForm;

/**
 * 
 * UserDateFormatFactory use to generate from date and to date
 * 
 * @document UserDateFormatFactory.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 05/10/2012
 */
public class UserDateFormatFactory {

	/**
	 * change the date in yyyy-mm-dd format
	 * 
	 * @param userDateForm object having from date and to date 
	 * @return userDateForm object having from date and to date 
	 */
	public UserDateForm getDateFormat(UserDateForm userDateForm) {

		Date toDate = null;
		Date fromDate = null;
System.out.println("userDateForm from date :"+userDateForm.getFromDate());
System.out.println("userDateForm to date :"+userDateForm.getToDate());  
		SimpleDateFormat sdfDestination = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfSource = new SimpleDateFormat("MM/dd/yyyy");
   
		try { 
			toDate = sdfSource.parse(userDateForm.getToDate());
			fromDate = sdfSource.parse(userDateForm.getFromDate());
		} catch (ParseException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} 

		userDateForm.setFromDate(sdfDestination.format(fromDate));
		userDateForm.setToDate(sdfDestination.format(toDate));

		System.out.println("Go From Date :"+userDateForm.getFromDate());
		System.out.println("Go to Date :"+userDateForm.getToDate()); 
		return userDateForm;
	}

	/**
	 * generate from date as previous month's date and to
	 * date as current date
	 * 
	 * @return userDateForm object having from date and to date 
	 */
	public UserDateForm getDateFormat() {

		UserDateForm userDateForm = new UserDateForm();
		SimpleDateFormat sdfDestination = new SimpleDateFormat("yyyy-MM-dd");
		Calendar originalDate = Calendar.getInstance();
		Calendar previousMonthDay = (Calendar) originalDate.clone();
		previousMonthDay.add(Calendar.MONTH, -1);
		previousMonthDay.getTime();
		userDateForm.setFromDate(sdfDestination.format(previousMonthDay
				.getTime()));
		userDateForm.setToDate(sdfDestination.format(originalDate.getTime()));
System.out.println("from date  : "+userDateForm.getFromDate());
 
System.out.println("to date : "+userDateForm.getToDate()); 
		return userDateForm;
	} 

}

package com.roamly.user.beans;

public class UserDateForm {
	
	private String fromDate;
	private String toDate;
	private String activeSim;
	private String option; 
	private String dateError;
	 
	public String getOption() {
		return option; 
	}
  
	public void setOption(String option) {
		this.option = option;
	}

	public String getActiveSim() {
		return activeSim;
	}

	public void setActiveSim(String activeSim) {
		this.activeSim = activeSim;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	} 

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public String getDateError() {
		return dateError;
	}

	public void setDateError(String dateError) {
		this.dateError = dateError;
	} 
 
}

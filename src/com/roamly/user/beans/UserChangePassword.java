package com.roamly.user.beans;

public class UserChangePassword {

	private String currentPassword; 
	private String newPassword;
	private String reEnterPassword;
	private String passMismatch;
	
	public String getPassMismatch() {
		return passMismatch;
	}

	public void setPassMismatch(String passMismatch) {
		this.passMismatch = passMismatch;
	}

	public String getCurrentPassword() {
		return currentPassword.trim();
	} 

	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}

	public String getNewPassword() {
		return newPassword.trim();
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getReEnterPassword() {
		return reEnterPassword.trim();
	} 

	public void setReEnterPassword(String reEnterPassword) {
		this.reEnterPassword = reEnterPassword;
	}

	
}

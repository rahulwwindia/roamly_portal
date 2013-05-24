package com.roamly.user.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.roamly.user.beans.UserChangePassword;

/**
 * Validate the change password form 
 * @document UserChangePasswordValidator.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserChangePasswordValidator implements Validator{
	 
	public boolean supports(Class<?> clazz) {
		return UserChangePassword.class.isAssignableFrom(clazz);
		}
		  
		public void validate(Object target, Errors errors) { 
			System.out.println("in validator"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currentPassword", "currentPassword.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "newPassword", "newPassword.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "reEnterPassword", "reEnterPassword.required"); 
		UserChangePassword changePassword = (UserChangePassword) target; 
		if(changePassword.getCurrentPassword().length() == 0)
		{    
		errors.rejectValue("currentPassword", "currentPassword.required");   
		}
		if(changePassword.getCurrentPassword().length() == 0)
		{   
		errors.rejectValue("newPassword", "newPassword.required");   
		}
		if(changePassword.getCurrentPassword().length() == 0)
		{   
		errors.rejectValue("reEnterPassword", "reEnterPassword.required");   
		}
		
		if(!changePassword.getNewPassword().equals(changePassword.getReEnterPassword()))
		{ 
			errors.rejectValue("passMismatch", "passwordMismatch.required");
		}
		
		
	}
		  

}

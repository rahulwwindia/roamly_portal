package com.roamly.user.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.roamly.user.beans.UserProfile;

/**
 *Validate the user profile form
 * @document UserProfileValidator.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserProfileValidator implements Validator{

	public boolean supports(Class<?> clazz) {
		
		return UserProfile.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) { 
		 
		System.out.println("in validator user Profile"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "firstName.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "lastName.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "postalCode", "postalCode.required"); 
	 	 
		/*UserProfile userDetails = (UserProfile) target;
		if(userDetails.getFirstName().length() == 0)  
		{     
			    errors.rejectValue("firstName","firstName.required");  
		}
		*/
		
		
	}
 
}

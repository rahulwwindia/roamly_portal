package com.roamly.user.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.roamly.user.beans.UserPaymentDetailsWithToken;
import com.roamly.user.services.UserValidationHelper;
/**
 *Validate the make payment form for existing user
 * @document UserMakePaymentValidatorExistingUser.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserMakePaymentValidatorExistingUser implements Validator  {

	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}  
	public void validate(Object obj, Errors errors) {
		System.out.println("in 888888");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nameOnCard", "nameOnCard.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cvvCode", "cvvCode.required"); 
 
		UserPaymentDetailsWithToken userDetails =(UserPaymentDetailsWithToken) obj;
		
		if(!UserValidationHelper.isNumeric(userDetails.getCvvCode()))
		{ 
		
			errors.rejectValue("cvvCode","cvvCode.invalid");  
		}
		
	} 
	
	 
 
}

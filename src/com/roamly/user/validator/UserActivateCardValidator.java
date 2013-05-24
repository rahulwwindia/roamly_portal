package com.roamly.user.validator;


import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.roamly.user.beans.UserActivateCardForm;
import com.roamly.user.services.UserValidationHelper;
/**
 * Validate the user activation card form 
 * @document UserActivateCardValidator.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserActivateCardValidator implements Validator {

	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}
  
	public void validate(Object target, Errors errors) { 
		
		  
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "serialNo", "serialNo.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mobileNo", "invalidMobile.Invalid");

		UserActivateCardForm userActivateCardForm = (UserActivateCardForm) target;
 
/*if(userActivateCardForm.getSerialNo().length()>12) 
{
	errors.rejectValue("serialNo","serialNoLengthExceed.ExceedLimit"); 
}

if(userActivateCardForm.getMobileNo().length()>10)
{
	errors.rejectValue("mobileNo","invalidMobile.Invalid"); 
}

if(!UserValidationHelper.isNumeric(userActivateCardForm.getMobileNo()) )
{ 
	System.out.println("-----");
	errors.rejectValue("mobileNo","invalidMobile.Invalid"); 
}*/ 


	}

}

package com.roamly.user.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.roamly.user.beans.UserDateForm;
import com.roamly.user.beans.UserPaymentDetailsWithToken;
import com.roamly.user.services.UserValidationHelper;
/**
 *Validate the payment history date form
 * @document UserPaymentHistoryValidator.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserPaymentHistoryValidator implements Validator {
	
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return UserDateForm.class.isAssignableFrom(arg0);
	}   
	public void validate(Object target, Errors errors) {
		

		UserDateForm userDetails = (UserDateForm) target;

	
		if(userDetails.getFromDate().trim().length()==0 || userDetails.getToDate().trim().length()==0)
		{    
			errors.rejectValue("dateError","dateError.invalid"); 
		}
		 
		

}
}

package com.roamly.user.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.roamly.user.beans.UserRegistrationDetails;

public class RegistrationValidator implements Validator{
	private static final String email_pattern = 
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	public boolean supports(Class<?> clazz) {
		
	
		return UserRegistrationDetails.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		
		Pattern pattern = Pattern.compile(email_pattern); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "userName.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "confirmPassword.required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "firstName.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "lastName.required"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "country", "country.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "serialNo", "serialNo.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pinCode", "pinCode.required"); 
		UserRegistrationDetails userRegistrationDetails = (UserRegistrationDetails) target; 
		Matcher matcher = pattern.matcher(userRegistrationDetails.getEmail());
		if(userRegistrationDetails.getUserName().length() == 0)
		{    
			
			errors.rejectValue("userName", "userName.required");    
		}  
		
		if(!matcher.matches())
		{   
			errors.rejectValue("invalidEmail", "email.invalid");
		} 
	
if(!userRegistrationDetails.getKaptchaCode().equals(userRegistrationDetails.getImageCode()))
		{   
			errors.rejectValue("kaptchaMismatch", "kaptchaMismatch.required");
		}
		 
	}   
 	 
}

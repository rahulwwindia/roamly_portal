package com.roamly.user.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.roamly.user.beans.UserMakePaymentCC;

 
/**
 * Validate make payment form for new user
 * @document UserMakePaymentValidator.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserMakePaymentValidator implements Validator {


public boolean supports(Class<?> clazz) {
return UserMakePaymentCC.class.isAssignableFrom(clazz);
}   
   
public void validate(Object target, Errors errors) { 
ValidationUtils.rejectIfEmptyOrWhitespace(errors, "custName", "custName.required");
ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city", "city.required");
ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email.required");
ValidationUtils.rejectIfEmptyOrWhitespace(errors, "postalCode", "postalCode.required");
ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cvvCode", "cvvCode.required");
ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pin", "pin.required");
ValidationUtils.rejectIfEmptyOrWhitespace(errors, "rePin", "rePin.required");

UserMakePaymentCC userDetails = (UserMakePaymentCC) target;

if(userDetails.getCardType().equals("1")) 
{         
	errors.rejectValue("cardType","cardType.required"); 
}   
if(userDetails.getCountry().equals("1")) 
{       
	errors.rejectValue("country","country.required"); 
} 
if(userDetails.getCreditCardNo().length()<14 || userDetails.getCreditCardNo().length()>20)
{    
	errors.rejectValue("creditCardNo","creditCardNo.invalid"); 
} 
 
if(!userDetails.getPin().equals(userDetails.getRePin()))
{   
	errors.rejectValue("rePin","pinNotMatch.missmatch"); 
}
 
}
    
}
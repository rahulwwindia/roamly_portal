package com.roamly.user.controllers;

import java.io.UnsupportedEncodingException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;  
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.SessionAttributes;


import com.mysql.jdbc.Constants;
import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.beans.UserRegistrationDetails;
import com.roamly.user.services.UserService;
import com.roamly.user.validator.RegistrationValidator;
import com.roamly.user.validator.UserMakePaymentValidator;
 
 
/**
 * UserController.java
 * This is controller class use for perform all the control operation for User
 * @author  Rahul Mahajan
 * @version 1.0
 * @date 1-Oct-2012 
 */
@Controller 
@SessionAttributes("principal")
public class UserController { 
	
	
	private UserService userService;
	private UserMakePaymentValidator userValidator;
	   
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Autowired
	public void setUserValidator(UserMakePaymentValidator userValidator) {
		this.userValidator = userValidator;
	}   
	
	 
	     
	@RequestMapping(value="mySIM.htm")
	
	public String mySIM(Model model,HttpSession session,HttpServletRequest request)
	{  
		 UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
			
		model.addAttribute("email", user.getEmail());
		model.addAttribute("phoneDetails",  userService.getUserActiveSimCardDetails(user.getCustomerId()));
	
		return "MySIM";
		
		  
	} 
	
@RequestMapping(value="mySIMPhone.htm")
	
	public @ResponseBody String getCountryCode(Model model,HttpSession session,@RequestParam("val1") String countryCode)
	{  
		 
	
	
		return userService.getCountryCode(countryCode);
		
		  
	} 
	 
	@RequestMapping(value="registration.htm") 
	public String registration(Model model, @ModelAttribute("userRegistration") UserRegistrationDetails userRegistration, BindingResult result)
	{       
		System.out.println("in"); 
		return "Registration";      
	} 

  /**
   * 
   * @param model
   * @param session contain user object having information about user
   * @param request 
   * @param userRegistration contain the information that filled in registration form   
   * @param result to handle error regarding validation
   * @return 
   */
	@RequestMapping(value="registerUser.htm") 
	public String registerUser(Model model,HttpSession session,HttpServletRequest request, @ModelAttribute("userRegistration") UserRegistrationDetails userRegistration, BindingResult result)
	{    
		RegistrationValidator registrationValidator = new RegistrationValidator();
		//String kaptchaCode = (String)session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);  
		userRegistration.setKaptchaCode("1234");  
		registrationValidator.validate(userRegistration, result);
		if (result.hasErrors()) {  
			return "Registration";  
		}    
		System.out.println("in----"+userRegistration.getEmail()); 
		
		String parm = (String) request.getParameter("imageCode");
		
		
		
		
		
		
		return "Registration";       
	} 
	 
	 
	@RequestMapping(value="inventory.htm") 
	public String inventory()	{  
		  
		 
		return "Inventory"; 
	}  
	  

	 
	

}

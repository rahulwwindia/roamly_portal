package com.roamly.user.controllers;

import java.security.Principal;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.user.beans.UserAddPolarCard;
import com.roamly.user.services.UserService;
import com.roamly.user.validator.UserMakePaymentValidator;
/**
 * controller for view existing polar card info 
 *  and add new polar in user account 
 * @document UserPaymentHistoryController.java
 * @author  Rahul Mahajan
 * @version 1.0
 * @date 1-Oct-2012
 */
@Controller 
@SessionAttributes("principal")
public class UserPolarCardController {
	
	private static Logger logger = Logger.getLogger(UserPolarCardController.class);
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
	
	/**
	 * add new polar card controller 
	 *@param Model
	 *@param UserAddPolarCard object has information of serial no and pin no
	 *@param HttpSession contain user session object
	 * @return String
	 */ 
	@RequestMapping(value="addPolarCard.htm")
	public String addPolarCard(Model model,@ModelAttribute("addPolarCard") UserAddPolarCard addPolarCard)
	{  
		  
	 
		logger.info("SerialNo :"+addPolarCard.getSerialNo());
		logger.info("Pin : "+addPolarCard.getPin());
		 
		return "MySIM";     
	}
	
	
}

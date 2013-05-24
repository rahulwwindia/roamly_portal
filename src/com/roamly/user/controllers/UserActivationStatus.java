package com.roamly.user.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.user.beans.UserActivateCardForm;
import com.roamly.user.beans.UserDateForm;
import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.beans.UserRegistrationDetails;
import com.roamly.user.services.UserDateFormatFactory;
import com.roamly.user.services.UserService;
import com.roamly.user.validator.UserChangePasswordValidator;
import com.roamly.user.validator.UserMakePaymentValidator;
import com.roamly.user.ws.UserActivateCardWebService;
/** 
 *
 * Controller for activate status
 * @document  UserActivationStatus.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 05/10/2012
 */
@Controller 
@SessionAttributes("principal")
public class UserActivationStatus { 
	
	@RequestMapping(value="activationStatus.htm")
	/**
	 * call business logic to activate card by consuming web services and 
	 * render the result to ActivateCard.jsp
	 *@param model
	 *@param session contain user object
	 *@return view name
	 */
	public String activateCard(Model model,HttpSession session)
	{ 
		return "activationStatus";
	} 
	
	
}

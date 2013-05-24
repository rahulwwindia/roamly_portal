package com.roamly.user.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.roamly.user.validator.UserActivateCardValidator;
import com.roamly.user.validator.UserChangePasswordValidator;
import com.roamly.user.validator.UserMakePaymentValidator;
import com.roamly.user.ws.UserActivateCardWebService;
/**
 *
 * Controller to activate card
 * @document  UserActivateCard.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 05/10/2012
 */
@Controller 
@SessionAttributes("principal")
public class UserActivateCard { 
	
	private UserService userService;
	private UserActivateCardValidator userValidatorForActiveUser;
	
	
	@Autowired
	public void setUserValidatorForActiveUser(
			UserActivateCardValidator userValidatorForActiveUser) {
		this.userValidatorForActiveUser = userValidatorForActiveUser;
	}


	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="activateCard.htm")
	/**
	 * call business logic to activate card by consuming web services and 
	 * render the result to ActivateCard.jsp
	 *@param model
	 *@param session contain user object
	 *@return view name
	 */
	public String activateCard(Model model,HttpSession session,@ModelAttribute("activateCard") UserActivateCardForm userActivateCardForm, BindingResult result)
	{ 
		  
		userValidatorForActiveUser.validate(userActivateCardForm, result); 
		if (result.hasErrors()) { 
			model.addAttribute("userActivateCardForm",userActivateCardForm);
			model.addAttribute("email",userActivateCardForm.getEmail());
			return "MySIM"; 
		}    
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
				
	boolean status = userService.activateCard(userActivateCardForm.getSerialNo(),userActivateCardForm.getPrefix()+userActivateCardForm.getMobileNo(),user.getAccountId(),user.getCustomerId());
		if(status){
			model.addAttribute("cardActivationStatus", "Thank you for activating your Roamly SIM card! Just one more step before you are ready to travel abroad with Roamly. You will need an initial top-up of at least $10 US into your account. Click the button below to proceed.");
			model.addAttribute("flag",true);
		}
		else{
			model.addAttribute("cardActivationStatus", "Activation Failed");
			model.addAttribute("flag",false);
		}    
		      
		 
		
		return "activationStatus";
		
	} 
	
	 
	
	
	
}


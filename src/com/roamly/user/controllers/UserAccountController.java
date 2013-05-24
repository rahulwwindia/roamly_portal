package com.roamly.user.controllers;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.user.beans.UserActiveSimCard;
import com.roamly.user.beans.UserDateForm;
import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.services.UserDateFormatFactory;
import com.roamly.user.services.UserService;
import com.roamly.user.services.UserServiceImp;
import com.roamly.user.validator.UserMakePaymentValidator;
/**
 *
 * Controller for user account  
 * @document  UserAccountController.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 05/10/2012
 */
@Controller  
@SessionAttributes("principal")
public class UserAccountController { 
	private UserService userService;
	private UserMakePaymentValidator userValidator;
	
	private static Logger logger = Logger.getLogger(UserAccountController.class);
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}  
	@Autowired
	public void setUserValidator(UserMakePaymentValidator userValidator) {
		this.userValidator = userValidator;
	}     
	  
	 
	@RequestMapping(value="myAccount.htm")
	/**
	 * call business logic to get account information by  consuming web services and 
	 * render the result to MyAccount.jsp
	 *@param model
	 *@param session contain user object
	 *@return String
	 */
	public String getMyAccount(Model model,HttpSession session)
	{ 
		String action = session.getAttribute("action")!=null?session.getAttribute("action").toString():"";
		session.removeAttribute("action");
		UserFullDetail userFullDetail= (UserFullDetail)session.getAttribute("userObj");
		System.out.println("---"+userFullDetail.getRole()); 
		if(userFullDetail.getRole().equalsIgnoreCase("ROLE_CC"))
		{    
			System.out.println("---"+userFullDetail.getRole());
			session.removeAttribute("userObj");
			return "redirect:customerCare/ccForm.htm";  
		} 
		   
		
		logger.info("session.getAttribute : "+session.getAttribute("action"));
		if(action.equalsIgnoreCase("01")){
			logger.info("case 01");
			return "redirect:myAccount.htm";
		}else if(action.equalsIgnoreCase("02")){
			logger.info("case 02");
			return "redirect:makePayment.htm";
		}else if(action.equalsIgnoreCase("03")){ 
			logger.info("case 03");
			return "redirect:mySIM.htm"; 
		}else{
			UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
			logger.info("full name==="+user.getFullName());
			logger.info("full name==="+user.getLoginId()); 
			model.addAttribute("userName", user.getLoginId());  
			logger.info("----"+user.getAccountId());
			UserDateForm userDateForm = new UserDateFormatFactory().getDateFormat();
			List<UserActiveSimCard> activeCardList=userService.getUserActiveSimCardDetails(user.getCustomerId());
			Iterator<UserActiveSimCard> itr = activeCardList.iterator();
			 String simAccountID=null; 
			 String simCustomerID=null; 
			 while(itr.hasNext()) {  
				 UserActiveSimCard element = itr.next();  
				 
				 if(element.getIsDefault().equals("1")) 
				 {
					simAccountID = element.getSimAccount_ID();  
					simCustomerID=element.getSimCustomer_ID();
					model.addAttribute("myAccount", userService.getMyAccount(simCustomerID,userDateForm)); 
				 }
			 }
			model.addAttribute("userActiveCardDetails", activeCardList);
			   
			logger.info("in myAccount"); 
			return "myAccount";
		}
	}    
	
} 

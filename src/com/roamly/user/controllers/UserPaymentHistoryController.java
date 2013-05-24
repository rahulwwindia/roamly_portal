package com.roamly.user.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.user.beans.UserActiveSimCard;
import com.roamly.user.beans.UserDateForm;
import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.beans.UserRegistrationDetails;
import com.roamly.user.beans.UserTransactionHistoryRs;
import com.roamly.user.services.UserDateFormatFactory;
import com.roamly.user.services.UserService;
import com.roamly.user.validator.UserMakePaymentValidator;
import com.roamly.user.validator.UserPaymentHistoryValidator;
/**
 * controller for payment history
 * @document UserPaymentHistoryController.java
 * @author  Rahul Mahajan
 * @version 1.0
 * @date 1-Oct-2012
 */
@Controller 
@SessionAttributes("principal")
public class UserPaymentHistoryController {
	private static Logger logger = Logger.getLogger(UserPaymentHistoryController.class);
	private UserService userService;
	private UserPaymentHistoryValidator userValidator;
	   
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Autowired
	public void setUserValidator(UserPaymentHistoryValidator userValidator) {
		this.userValidator = userValidator;
	}  
	   
	/**
	 * get User payment history information and render the result to PaymentHistory.jsp
	 *@param model
	 *@param session contain user session object
	 *@return String
	 */ 
	@RequestMapping(value="paymentHistory.htm")
	public String paymentHistory(Model model,HttpSession session)
	{  
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
		List<UserActiveSimCard> activeCardList=userService.getUserActiveSimCardDetails(user.getCustomerId());
		UserDateForm userDateForm = new UserDateFormatFactory().getDateFormat();
		
		session.setAttribute("activeCardList", activeCardList);
		
		Iterator<UserActiveSimCard> itr = activeCardList.iterator();
		
		String simAccountID=null; 
		 String simCustomerID=null;
		 while(itr.hasNext()) {
			 logger.info("in while");
			 UserActiveSimCard element = itr.next(); 
			 if(element.getIsDefault().equals("1"))
			 { 
				 logger.info("PaymentHistory if");
				simAccountID = element.getSimAccount_ID();  
				simCustomerID=element.getSimCustomer_ID();
				model.addAttribute("userActiveCardDetails", activeCardList);  
				model.addAttribute("paymentHistory",userService.getUserTransationHistory(simAccountID,userDateForm));
				return "PaymentHistory";
				   
			 } 
			 else
				 return "PaymentHistoryFailure";
	      } 
		
		 return "PaymentHistoryFailure"; 
		/*model.addAttribute("userActiveCardDetails", activeCardList);  
		model.addAttribute("paymentHistory",userService.getUserTransationHistory(user.getAccountId(),userDateForm));
	      
		return "PaymentHistory";   */  
	}  
	 
	@RequestMapping(value="paymentHistoryGo.htm")
	public String paymentHistoryGo(Model model,HttpSession session,@ModelAttribute("dateForm") UserDateForm userDateForm, BindingResult result)
	{  
		List<UserActiveSimCard> userActiveSimCards = (List<UserActiveSimCard>)session.getAttribute("activeCardList");
		model.addAttribute("userActiveCardDetails",userActiveSimCards);    
		userValidator.validate(userDateForm, result);
		if (result.hasErrors()) { 
			logger.info("in has error");
			
			return "PaymentHistory";     
		}   
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");  
		userDateForm = new UserDateFormatFactory().getDateFormat(userDateForm);
				    
		Iterator<UserActiveSimCard> itr = userActiveSimCards.iterator();
		 String simAccountID=null; 
		 String simCustomerID=null; 
		 while(itr.hasNext()) {
			 UserActiveSimCard element = itr.next();
			 logger.info("userDateForm.getActiveSim()"+userDateForm.getActiveSim()); 
			 if(userDateForm.getActiveSim().split(":")[0].equals(element.getSerialNum()))
			 {
				simAccountID = element.getSimAccount_ID();  
				simCustomerID=element.getSimCustomer_ID();
				break;  
			 } 
	      }
		 
		logger.info("userDetails active card");
		logger.info("Account ID"+simAccountID); 
		logger.info("Customer ID"+simCustomerID);
		model.addAttribute("optionSel", userDateForm.getActiveSim()); 
		UserTransactionHistoryRs paymentHistory= userService.getUserTransationHistory(simAccountID,userDateForm);
		model.addAttribute("paymentHistory",paymentHistory);
		 session.setAttribute("paymentHistory", paymentHistory);
		return "PaymentHistory";      
	}  
	 
	@RequestMapping(value="getAllPaymentDetails.htm") 
	public String registration(Model model, @ModelAttribute("userRegistration") UserRegistrationDetails userRegistration, BindingResult result)
	{       
		
		return "getAllPayment";      
	} 
	

}

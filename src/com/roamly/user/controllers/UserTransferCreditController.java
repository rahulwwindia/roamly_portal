package com.roamly.user.controllers;

import java.security.Principal;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.roamly.user.beans.UserActiveSimCard;
import com.roamly.user.beans.UserDateForm;
import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.beans.UserTransferCreditFormBean;
import com.roamly.user.services.UserService;
import com.roamly.user.validator.UserMakePaymentValidator;

/**
*
* Controller for transfer credit
* @document  UserTransferCreditController.java
* @author Rahul Mahajan
* @version 1.0
* @date 05/10/2012
*/ 
@Controller 
public class UserTransferCreditController {
private UserService userService;
private UserMakePaymentValidator userTransCrdValidator;
   
@Autowired
public void setUserService(UserService userService) {
this.userService = userService;
}
@Autowired
public void setUserTransCrdValidator(UserMakePaymentValidator userTransCrdValidator) {
this.userTransCrdValidator = userTransCrdValidator;
}
@RequestMapping(value="transferCredits.htm")
public String transferCredits(Model model,Principal principal,HttpSession session)
{  
  
UserFullDetail user= (UserFullDetail)session.getAttribute("userObj"); 
List<UserActiveSimCard> activeCardList=userService.getUserActiveSimCardDetails(user.getCustomerId());
session.setAttribute("activeCardList", activeCardList);
model.addAttribute("userActiveCardDetails", activeCardList);
model.addAttribute("userName", user.getFullName());  
return "TransferCredits";  
} 
@RequestMapping(value="transferCreditForm.htm")
public String transferCreditsForm(Model model,Principal principal,HttpSession session,@ModelAttribute("transferCreditForm") UserTransferCreditFormBean userTransferCredit )
{  
  
UserFullDetail user= (UserFullDetail)session.getAttribute("userObj"); 
List<UserActiveSimCard> userActiveSimCards = (List<UserActiveSimCard>)session.getAttribute("activeCardList");
Iterator<UserActiveSimCard> itr = userActiveSimCards.iterator();
Iterator<UserActiveSimCard> itr1 = userActiveSimCards.iterator();
String simAccountID1=null;
String SerialNum=null;
String simAccountID2=null;
while(itr.hasNext()) {
UserActiveSimCard element = itr.next();
if(userTransferCredit.getActiveSim().split(":")[0].equals(element.getSerialNum()))
{
simAccountID1 = element.getSimAccount_ID();
break;
} 
} 

while(itr1.hasNext()) {
UserActiveSimCard element = itr1.next();
if(userTransferCredit.getPolarSerial().split(":")[0].equals(element.getSerialNum()))
{
simAccountID2 = element.getSimAccount_ID();
break;
} 
} 
  if(userService.transferAmountValidate(userTransferCredit.getActiveSim().split(":")[0], userTransferCredit.getTransferAmount(), simAccountID1).equals("1"))
  {
	userService.transferAmount(simAccountID1,userTransferCredit.getTransferAmount(),simAccountID2);
	return "TransferCreditSuccess";
  }
  else
	  return "TransferCreditFailure";
 
  
    
} 
   
} 




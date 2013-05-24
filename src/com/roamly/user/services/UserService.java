package com.roamly.user.services;

import java.util.List;

import com.roamly.customercare.beans.CustomerDetails;
import com.roamly.customercare.beans.CustomerDetailsForm;
import com.roamly.user.beans.UserActiveSimCard;
import com.roamly.user.beans.UserAutoRefill;
import com.roamly.user.beans.UserBalance;
import com.roamly.user.beans.UserCallHistory;
import com.roamly.user.beans.UserChangePassword;
import com.roamly.user.beans.UserDateForm;
import com.roamly.user.beans.UserMakePaymentCC;
import com.roamly.user.beans.UserMakePaymentCCRs;
import com.roamly.user.beans.UserMyAccount;
import com.roamly.user.beans.UserMyPhoneNum;
import com.roamly.user.beans.UserPaymentDetailsWithToken;
import com.roamly.user.beans.UserPaymentHistoryRs;
import com.roamly.user.beans.UserPolarDetails;
import com.roamly.user.beans.UserProfile;
import com.roamly.user.beans.UserSMSHistory;
import com.roamly.user.beans.UserState;
import com.roamly.user.beans.UserTaxesList;
import com.roamly.user.beans.UserTopUpDetails;
import com.roamly.user.beans.UserTransactionHistory;
import com.roamly.user.beans.UserTransactionHistoryRs;
import com.roamly.user.beans.UserTransferCredit;
import com.roamly.user.beans.UserTransferCreditFormBean;

 
/**
 * 
 * UserService interface has all methods require for business login
 * 
 * @document UserService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 05/10/2012
 */
public interface UserService {
	     
	public List<String> getMyNumber();
	public UserBalance getUserBalance(String accountId);  
	public List<UserMyAccount> getMyAccount(String customerId,UserDateForm userDateForm);  
	public UserPaymentHistoryRs getPaymentHistory(String userName);   
	public List<UserCallHistory> getCallHistory(String userName,UserDateForm userDateForm);  
	public List<UserSMSHistory> getSMSHistory(String userName,UserDateForm userDateForm);
	public List<UserProfile> getUserProfile(String userName);  
	public  boolean updateUserProfile(UserProfile userProfile,String customerId);
	public  boolean changeUserPassword(UserChangePassword changePassword, String customerId); 
	public UserMakePaymentCCRs paymentProcess(UserMakePaymentCC userDetails,String simCustId,String login,String simAccountId,String customerId,String serialNo);
	public boolean activateCard(String serialNumber,String pin,String accountID, String customerID);
	public void getTopUp(UserTopUpDetails usertTopUpDetails);
	public String getUserToken(String userName); 
	public void paymentProcessForExistingUser(UserPaymentDetailsWithToken userDetails,String customerId,String username,String accountId,String serialNo);
	public List<UserMyPhoneNum> getUserPhoneDetails(String customerId);
	public UserTransactionHistoryRs getUserTransationHistory(String customerId,UserDateForm userDateForm);
	public List<UserActiveSimCard> getUserActiveSimCardDetails(String custmerId);
	public String  transferAmountValidate(String serialNo,String amount,String simAccountId);
	public String transferAmount(String senderAccountID,String amount,String recAccountID);
	public String autoRefill(UserAutoRefill userAutoRefill);
	public String getCountryCode(String countryCode);
	public CustomerDetails getCustomerDetails(CustomerDetailsForm customerDetailsForm);
	public List<UserState> getStates(String countryId);
	public UserTaxesList getTaxListByName(String stateName);
	public UserTaxesList getTaxList(String stateId);
}  
 
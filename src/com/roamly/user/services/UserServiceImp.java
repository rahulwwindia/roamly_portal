package com.roamly.user.services;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.roamly.customercare.beans.CustomerDetails;
import com.roamly.customercare.beans.CustomerDetailsForm;
import com.roamly.customercare.ws.CustomerDetailsWebService;
import com.roamly.user.beans.UserActivateCardRs;
import com.roamly.user.beans.UserActiveSimCard;
import com.roamly.user.beans.UserActiveSimCardRs;
import com.roamly.user.beans.UserAutoRefill;
import com.roamly.user.beans.UserAutoRefillRs;
import com.roamly.user.beans.UserBalance;
import com.roamly.user.beans.UserBalanceRs;
import com.roamly.user.beans.UserCallHistory;
import com.roamly.user.beans.UserCallHistoryRs;
import com.roamly.user.beans.UserChangePassword;
import com.roamly.user.beans.UserChangePasswordRs;
import com.roamly.user.beans.UserCountryCodeRs;
import com.roamly.user.beans.UserDateForm;
import com.roamly.user.beans.UserMakePaymentCC;
import com.roamly.user.beans.UserMakePaymentCCRs;
import com.roamly.user.beans.UserMyAccount;
import com.roamly.user.beans.UserMyAccountRs;
import com.roamly.user.beans.UserMyPhoneNum;
import com.roamly.user.beans.UserMyPhoneNumRs;
import com.roamly.user.beans.UserPaymentDetailsWithToken;
import com.roamly.user.beans.UserPaymentDetailsWithTokenRs;
import com.roamly.user.beans.UserPaymentHistoryRs;
import com.roamly.user.beans.UserPolarDetails;
import com.roamly.user.beans.UserProfile;
import com.roamly.user.beans.UserProfileRs;
import com.roamly.user.beans.UserSMSHistory;
import com.roamly.user.beans.UserSMSHistoryRs;
import com.roamly.user.beans.UserState;
import com.roamly.user.beans.UserStateRs;
import com.roamly.user.beans.UserTaxesList;
import com.roamly.user.beans.UserTokenInfoRs;
import com.roamly.user.beans.UserTopUpDetails;
import com.roamly.user.beans.UserTransactionHistory;
import com.roamly.user.beans.UserTransactionHistoryRs;
import com.roamly.user.beans.UserTransferCredit;
import com.roamly.user.beans.UserTransferCreditFormBean;
import com.roamly.user.beans.UserUpdateProfileRs;
import com.roamly.user.ws.UserActivateCardWebService;
import com.roamly.user.ws.UserActiveSimDetailsWebService;
import com.roamly.user.ws.UserAutoRefillWebService;
import com.roamly.user.ws.UserBalanceWebService;
import com.roamly.user.ws.UserCallHistoryWebService;
import com.roamly.user.ws.UserChangePasswordWebService;
import com.roamly.user.ws.UserCountryCodeWebService;
import com.roamly.user.ws.UserMakePaymentCCTokenWebService;
import com.roamly.user.ws.UserMakePaymentCCWebService;
import com.roamly.user.ws.UserMyAccountWebService;
import com.roamly.user.ws.UserMyPhoneNumWebService;
import com.roamly.user.ws.UserPaymentHistoryWebService;
import com.roamly.user.ws.UserProfileWebService;
import com.roamly.user.ws.UserSMSHistoryWebService;
import com.roamly.user.ws.UserStateListWebService;
import com.roamly.user.ws.UserTaxesByStateWebService;
import com.roamly.user.ws.UserTaxesWebService;
import com.roamly.user.ws.UserTokenWebService;
import com.roamly.user.ws.UserTransactionHistoryWebService;
import com.roamly.user.ws.UserTransferAmountWebService;
import com.roamly.user.ws.UserTrasferCreditWebService;
import com.roamly.user.ws.UserUpdateProfileWebService;

/**
 * implement UserService class  
 * @document UserUpdateProfileWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
 
//import org.springframework.jdbc.core.JdbcTemplate;


public class UserServiceImp implements UserService {

	// private JdbcTemplate jdbcTemplate;

	private static Logger logger = Logger.getLogger(UserServiceImp.class);
	private UserServiceImp customUserDetailsService;
 
	UserServiceImp() {

	}
 
	/*
	 * public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
	 * this.jdbcTemplate = jdbcTemplate; }
	 */

	public UserServiceImp getCustomUserDetailsService() {
		return customUserDetailsService;
	}

	public void setCustomUserDetailsService(
			UserServiceImp customUserDetailsService) {
		this.customUserDetailsService = customUserDetailsService;
	}

	public List<String> getMyNumber() {

		return null;

	}

	/**
	 * Generate user payment history
	 * it consume the web service and return the UserPaymentHistoryRs
	 * object that contain all information regarding payment history of the user 
	 * 
	 * @param userName
	 * @return userPaymentHistoryRs
	 */
	public UserPaymentHistoryRs getPaymentHistory(String userName) {

	/*	
		 * WsUrl wsUrl = new WsUrl(); Gson gson = new Gson();
		 * List<UserPaymentHistory> userHistories = new
		 * ArrayList<UserPaymentHistory>(); UserPaymentHistoryTotal
		 * userHistorieTotals = new UserPaymentHistoryTotal(); try { String
		 * jsonString =
		 * wsUrl.readJsonFromUrl(wsUrl.getWsUrl("ws.paymentHistory"));
		 * JSONObject json = new JSONObject(jsonString);
		 * 
		 * JSONArray jsonArray= new JSONArray(json.getString("#result-set-1"));
		 * for(int i=0;i<jsonArray.length();i++) { UserPaymentHistory
		 * userPaymentHistory=
		 * gson.fromJson(jsonArray.getJSONObject(i).toString(),
		 * UserPaymentHistory.class); userHistories.add(userPaymentHistory); }
		 * userHistorieTotals.setUserPaymentHistory(userHistories);
		 * userHistorieTotals.setTotalGST(json.getString("$TotalGST"));
		 * userHistorieTotals.setTotalPST(json.getString("$TotalPST"));
		 * userHistorieTotals.setTotalAmount(json.getString("$TotalAmount"));
		 * 
		 * } catch (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); } catch (JSONException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 
*/
		Map<String, String> params = new HashMap<String, String>();
		params.put("accountID", "2717");
		params.put("startDate", "2010-10-10");
		params.put("endDate", "2012-10-10");
		UserPaymentHistoryWebService userPaymentHistoryWebService = new UserPaymentHistoryWebService(
				params);
		// userCallHistoryWebService.setDebug(true);
		UserPaymentHistoryRs userPaymentHistoryRs = (UserPaymentHistoryRs) userPaymentHistoryWebService
				.getResponseObject();

		return userPaymentHistoryRs;
	}

	/**
	 * Generate user call history
	 * by consuming the web service
	 * @param accountId
	 * @param userDateForm
	 * @return userCallHistoryList has list of UserCallHistory objects 
	 */
	public List<UserCallHistory> getCallHistory(String accountId,UserDateForm userDateForm) {
		
		logger.info("in method : ID"+accountId);
		logger.info("in method : from Date"+userDateForm.getToDate()); 
		logger.info("in method : to Date"+userDateForm.getFromDate());  
		logger.info("in call ============" + userDateForm.getToDate());
		Map<String, String> params = new HashMap<String, String>();
		params.put("accountID", accountId);  
		params.put("startDate", userDateForm.getFromDate());
		params.put("endDate", userDateForm.getToDate());
		UserCallHistoryWebService userCallHistoryWebService = new UserCallHistoryWebService(
				params);
		// userCallHistoryWebService.setDebug(true);  
		UserCallHistoryRs userCallHistoryRs = (UserCallHistoryRs) userCallHistoryWebService
				.getResponseObject();
 
		
		List<UserCallHistory> userCallHistoryList = userCallHistoryRs
				.getCallHistories();

		return userCallHistoryList;      
	}

	/**
	 * Generate user sms history
	 * by consuming web service 
	 * @param accountId
	 * @param userDateForm
	 * @return userSMSHistoryList has list of UserSMSHistory objects
	 */
	public List<UserSMSHistory> getSMSHistory(String accountId,
			UserDateForm userDateForm) { 
		logger.info("sms ID:"+accountId);
		logger.info("SMS from Date " + userDateForm.getFromDate());
		logger.info("SMS to Date " + userDateForm.getToDate());  
		Map<String, String> params = new HashMap<String, String>();
		params.put("accountID",accountId);  
		params.put("startDate", userDateForm.getFromDate()); 
		params.put("endDate", userDateForm.getToDate());
		UserSMSHistoryWebService userCallHistoryWebService = new UserSMSHistoryWebService(
				params);

		UserSMSHistoryRs userSMSHistoryRs = (UserSMSHistoryRs) userCallHistoryWebService
				.getResponseObject();

		List<UserSMSHistory> userSMSHistoryList = userSMSHistoryRs
				.getSMSHistory();

		
		return userSMSHistoryList;
	}

	/** 
	 * get user profile information by 
	 * consuming the web service 
	 * 
	 * @param accountId
	 * @return userProfileList has list of UserProfile objects
	 */
	public List<UserProfile> getUserProfile(String accountId) {

		logger.info("customer id ****"+accountId);
		Map<String, String> params = new HashMap<String, String>();
		params.put("accountID",accountId); 
		UserProfileWebService profileWebService = new UserProfileWebService(
				params);
		// userCallHistoryWebService.setDebug(true);
		UserProfileRs userProfileRs = (UserProfileRs) profileWebService.getResponseObject();

		List<UserProfile> userProfileList = userProfileRs.getUserProfile();
 
		return userProfileList;
	}
	
	/**
	 * Update user profile
	 * by consuming the web service and return the boolean (true/false)
	 * true for successfully update and false for failure  
	 * 
	 * @param userProfile
	 * @param customerId
	* @return <CODE>true</CODE> for successfully update, 
     * <CODE>false</CODE> otherwise
	 */
	public boolean updateUserProfile(UserProfile userProfile,String customerId) {

		Map<String, String> params = new HashMap<String, String>();
		params.put("fName", userProfile.getFirstName());
		params.put("lName", userProfile.getLastName());
		params.put("streetNum", userProfile.getStreetNum());
		params.put("address", userProfile.getAddress());
		params.put("city", userProfile.getCity());
		params.put("state", userProfile.getState());
		params.put("zip", userProfile.getPostalCode());
		params.put("countryID", userProfile.getCountryId());
		params.put("email", userProfile.getEmail());
		params.put("timeZoneID", userProfile.getTimeZoneId());
		params.put("customerID", customerId); 

		UserUpdateProfileWebService profileWebService = new UserUpdateProfileWebService(
				params);
		UserUpdateProfileRs updateProfileRs = (UserUpdateProfileRs) profileWebService
				.getResponseObject();
		
		List<UserProfile> userProfileList = updateProfileRs.getUserProfile();
		return userProfile.equals(userProfileList.get(0));
	}

	/**
	 * Change user's current password
	 * by consuming the web service, and it return boolean (true/false)
	 * true for successfully change and false for failure  
	 * 
	 * @param changePassword
	 * @param customerId
	* @return <CODE>true</CODE> for successfully change, 
     * <CODE>false</CODE> otherwise
	 */
	public boolean changeUserPassword(UserChangePassword changePassword,String customerId) {
		Map<String, String> params = new HashMap<String, String>();

		params.put("customerID", customerId); 
		params.put("password", changePassword.getNewPassword());
		UserChangePasswordWebService profileWebService = new UserChangePasswordWebService(
				params);
		UserChangePasswordRs changePasswordRs = (UserChangePasswordRs) profileWebService
				.getResponseObject();
		return true;
	} 

	/**
	 * Generate account information
	 * by consuming the web service, and it return UserMyAccount object 
	 * that has userAccount information 
	 * 
	 * @param customerId
	 * @param userDateForm
	 * @return userMyAccounts has list of UserMyAccount objects 
	 */
	public List<UserMyAccount> getMyAccount(String accountId,UserDateForm userDateForm) {
		// TODO Auto-generated method stub
		logger.info("in my account"+accountId);
   
		Map<String, String> params = new HashMap<String, String>();
		params.put("accountID",accountId); 
		params.put("startDate", userDateForm.getFromDate());
		params.put("endDate", userDateForm.getToDate()); 
		UserMyAccountWebService userAccountWebService = new UserMyAccountWebService(
				params);
		UserMyAccountRs userMyAccountRs = (UserMyAccountRs) userAccountWebService
				.getResponseObject();

		List<UserMyAccount> userMyAccounts = userMyAccountRs.getMyAccounts();

		return userMyAccounts;
	}
	/**
	 * Generate account information
	 * by consuming the web service
	 * 
	 * @param accountId
	 * @return userBalances object of UserBalance
	 */
	public UserBalance getUserBalance(String accountId) {  
		Map<String, String> params = new HashMap<String, String>();
		params.put("accountID", accountId); 
		UserBalanceWebService userBalanceWebService = new UserBalanceWebService(
				params); 
		// userCallHistoryWebService.setDebug(true);
		UserBalanceRs userBalanceRs = (UserBalanceRs) userBalanceWebService
				.getResponseObject();

		List<UserBalance> userBalances = userBalanceRs.getUserBalance();

		return userBalances.get(0);
	}
 
	/**
	 * Activate user card 
	 * @param serialNumber
	 * @param pin
	 * @param accountID
	 * @param customerID
	 * @return <CODE>true</CODE> if successfully activate
     * <CODE>false</CODE> otherwise
	 */ 
	public boolean activateCard(String serialNumber, String mobileNo, String accountID, String customerID) {
 
		Map<String, String> params = new HashMap<String, String>();

		params.put("serialNO", serialNumber); 
		params.put("homePhone", mobileNo);
		params.put("accountID", accountID);
		params.put("customerID", customerID); 
		UserActivateCardWebService activateCardWebService = new UserActivateCardWebService(params);
		UserActivateCardRs activateCardRs = (UserActivateCardRs) activateCardWebService
				.getResponseObject();
		return activateCardRs.getActivationStatus();
	}

	/**
	 * Collect all information regarding credit card and pass that information to internet secure payment gateway
	 * by consuming web service
	 * 
	 * @param userDetails
	 * @return UserMakePaymentCCRs
	 */
	public UserMakePaymentCCRs paymentProcess(UserMakePaymentCC userDetails,String simCustId,String login,String simAccountId,String customerId,String serialNo) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("simCustomerId", simCustId); 
		params.put("PST",userDetails.getPST() );
		params.put("GST", userDetails.getGST());
		params.put("HST", userDetails.getHST());
		params.put("TAX",userDetails.getTotalTAX());
		params.put("totalAmountInUSD",userDetails.getTotalAmount());
		params.put("serialNO", serialNo); 
		params.put("customerId", customerId);  
		params.put("simAccountID", simAccountId);
		params.put("login", login); 
		params.put("custName", userDetails.getCustName()); 
		params.put("address", userDetails.getAddress1()+userDetails.getAddress2());
		params.put("city", userDetails.getCity());
		params.put("state",userDetails.getState());
		params.put("postalCode", userDetails.getPostalCode());
		params.put("company", "neosoft");
		params.put("email", userDetails.getEmail()); 
		params.put("country", userDetails.getCountry());
		params.put("phone", userDetails.getPhone());
		params.put("creditCardNo", userDetails.getCreditCardNo());
		params.put("expiryDateMM", userDetails.getExpiryDateMM());
		params.put("expiryDateYY", userDetails.getExpiryDateYY());
		params.put("cvvCode", userDetails.getCvvCode());
		params.put("ammountInUSD", userDetails.getAmmountInUSD());
		params.put("cardType", userDetails.getCardType());
		params.put("paymentType", "00"); 
		params.put("PIN", userDetails.getPin()); 
		params.put("makeDefault", userDetails.getMakeDefaultSet()); 
		UserMakePaymentCCWebService userMakePaymentCCWebService = new UserMakePaymentCCWebService(
				params);  
		UserMakePaymentCCRs userMakePaymentCCRs = (UserMakePaymentCCRs) userMakePaymentCCWebService.getResponseObject();
		return userMakePaymentCCRs;
	
		
	} 
 
	public void getTopUp(UserTopUpDetails userTopUpDetails) {

		logger.info("user");
		
	}
	/**
	 * Get existing user token
	 * by consuming the web service
	 * 
	 * @param userName
	 * @return token
	 */ 
	
	public String getUserToken(String userName) {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("username", userName);
		UserTokenWebService userTokenWebService = new UserTokenWebService(params); 
		UserTokenInfoRs userTokenInfoRs = (UserTokenInfoRs) userTokenWebService.getResponseObject();
		return userTokenInfoRs.getCcTokenForUser();
	 
		
	}

	/**
	 * Make payment for the existing
	 * user with the help of token and following parameters 
	 * by consuming the web service
	 * @param userDetails
	 * @param customerId
	 * @param userName
	 * @param accountId
	 * @param userName 
	 *
	 */ 
	public void paymentProcessForExistingUser(
			UserPaymentDetailsWithToken userDetails,String customerId,String username,String accountId,String serialNo) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("transactionAmount", userDetails.getAmmountInUSD());
		params.put("customer_name", username);
		
		params.put("PST", userDetails.getPST()); 
		params.put("GST", userDetails.getGST());  
		params.put("HST", userDetails.getHST());  
		params.put("totalAmount", userDetails.getTotalAmount());
		params.put("TAX", userDetails.getTotalTAX());
		params.put("accountID", accountId);  
		params.put("serialNO", serialNo);  
		params.put("customerId", customerId); 
		params.put("paymentType", "00");
		params.put("token", userDetails.getToken()); 
		params.put("phone", userDetails.getPhone());
		params.put("email", userDetails.getEmail()); 
		params.put("CVV", userDetails.getCvvCode());  
		 
		UserMakePaymentCCTokenWebService userMakePaymentCCTokenWebService = new UserMakePaymentCCTokenWebService(
				params); 
		UserPaymentDetailsWithTokenRs userMakePaymentCCRs = (UserPaymentDetailsWithTokenRs) userMakePaymentCCTokenWebService.getResponseObject();
 
	} 
	/**
	 *Get phone details by using customerID
	 
	 * @param customerId
	 * @return list of UserMyPhoneNum objects 
	 *
	 */ 
	public List<UserMyPhoneNum> getUserPhoneDetails(String customerId) {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("customerID",customerId); 
		UserMyPhoneNumWebService userMyPhoneNumWebService = new UserMyPhoneNumWebService(
				params); 
		UserMyPhoneNumRs userMyPhoneNumRs = (UserMyPhoneNumRs) userMyPhoneNumWebService.getResponseObject();
 	 
		return userMyPhoneNumRs.getMyPhoneNums();
	} 

	/**
	 * Generate user transaction history by using accountID in given date range
	 * @param userDateForm
	 * @param accountId
	 * @return userTransactionHistoryRs
	 *
	 */ 
	
	public UserTransactionHistoryRs getUserTransationHistory(
			String accountID,UserDateForm userDateForm) { 
		 
				 logger.info("in getToDate"+userDateForm.getToDate());
				 logger.info("in from date"+userDateForm.getFromDate());
				 logger.info("in accountID"+accountID);  
		String frmArr[] = userDateForm.getFromDate().split("-");
		String toArr[] = userDateForm.getToDate().split("-");
		Map<String, String> params = new HashMap<String, String>();
		params.put("accountID",accountID);   
		params.put("toDate",userDateForm.getToDate());  
		params.put("fromDate",userDateForm.getFromDate());      
  
		UserTransactionHistoryWebService userTransactionHistoryWebService = new UserTransactionHistoryWebService(
				params); 
		UserTransactionHistoryRs userTransactionHistoryRs = (UserTransactionHistoryRs) userTransactionHistoryWebService.getResponseObject();
   
		return userTransactionHistoryRs ;
	}   
 
	/**
	 *Get user active sim card details by using custmerId and given date range
	 * @param custmerId
	 * @return list of UserActiveSimCard object
	 *
	 */ 
	
	public List<UserActiveSimCard> getUserActiveSimCardDetails(String custmerId) {
		Map<String, String> params = new HashMap<String, String>();
		System.out.println("UserActiveSimCard customerID****"+custmerId);
		params.put("customerID", custmerId);   
		UserActiveSimDetailsWebService userTokenWebService = new UserActiveSimDetailsWebService(params); 
		UserActiveSimCardRs userTokenInfoRs = (UserActiveSimCardRs) userTokenWebService.getResponseObject();
		return userTokenInfoRs.getUserActiveSimCard();
	}

	/**
	 * Transfer amount validator to perform validation before transfer credit
	 * @param serialNo
	 * @param amount
	 * @param senderAccountID
	 * @return 1 or 0 string
	 *
	 */ 
	public String transferAmountValidate(
			String serialNo,String amount,String senderAccountID) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("serialNO",serialNo );
		params.put("amount", amount);
		params.put("senderAccountID", senderAccountID);  
	UserTrasferCreditWebService userTrasferCreditWebService = new UserTrasferCreditWebService(
				params); 
		UserTransferCredit userMakePaymentCCRs = (UserTransferCredit) userTrasferCreditWebService.getResponseObject();
 
		 
		
		return userMakePaymentCCRs.get$IsBalanceOK().toString();
	}

	
	/**
	 * transferAmount from one card to another card   
	 * @param senderAccountID
	 * @param amount
	 * @param rcptAccountID
	 *
	 */ 
	public String transferAmount(String senderAccountID,String amount,String rcptAccountID) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("senderAccountID",senderAccountID);
		params.put("amount", amount);
		params.put("rcptAccountID", rcptAccountID); 
		params.put("phone","99345345567");
		params.put("customerIPAddr", "0000");
		params.put("srcAmount", "0");  
		params.put("srcCurrencyID","3");
		params.put("commission", "0");
		params.put("conversionRate", "1");  

	UserTransferAmountWebService userTrasferCreditWebService = new UserTransferAmountWebService(
				params);  
		UserTransferCredit userMakePaymentCCRs = (UserTransferCredit) userTrasferCreditWebService.getResponseObject();
 
		return null;
	}
	/**
	 * Perform auto top up functionality 
	 * @param userAutoRefill
	 * @return update count 1 or 0 
	 */ 
	public String autoRefill(UserAutoRefill userAutoRefill) {
		UserAutoRefillRs userAutoRefillRs=null;
		String auto=null;
		String autoPhone=null; 
		logger.info("length--"+userAutoRefill.getSerialNo().split(",").length);
		for(int i=0;i<userAutoRefill.getSerialNo().split(",").length;i++)
		{
			if(userAutoRefill.getAutoRefillList().split(",")[i].equals("true"))
				auto="1";
			if(userAutoRefill.getAutoRefillList().split(",")[i].equals("false"))
				auto="0"; 
			if(userAutoRefill.getPhoneTopUpList().split(",")[i].equals("true"))
				autoPhone="1"; 
			if(userAutoRefill.getPhoneTopUpList().split(",")[i].equals("false"))
				autoPhone="0";
		Map<String, String> params = new HashMap<String, String>();
		params.put("serialNo",userAutoRefill.getSerialNo().split(",")[i]);
		params.put("autoRefill", auto);
		params.put("amount", userAutoRefill.getAmount().split(",")[i]); 
		params.put("balance", userAutoRefill.getBalance().split(",")[i]);
		params.put("phoneTopUp",autoPhone);   
		UserAutoRefillWebService userAutoRefillWebService = new UserAutoRefillWebService(
				params);
		userAutoRefillRs = (UserAutoRefillRs) userAutoRefillWebService.getResponseObject();
		}
		return userAutoRefillRs.getUpdateCount();
	}

	public String getCountryCode(String countryCode) {
	 
		Map<String, String> params = new HashMap<String, String>();
		params.put("CountryID",countryCode);
		
		UserCountryCodeWebService userCountryCodeWebService = new UserCountryCodeWebService(params);
		UserCountryCodeRs userCountryCodeRs=  userCountryCodeWebService.getResponseObject();
		 
		
		return userCountryCodeRs.getUserCountryCode().get(0).getCountryCode();
	}

	public CustomerDetails getCustomerDetails(CustomerDetailsForm customerDetailsForm) {

		Map<String, String> params = new HashMap<String, String>();
		params.put("FN",customerDetailsForm.getFirstName());
		params.put("LN",customerDetailsForm.getLastName());
		params.put("serialNum",customerDetailsForm.getSerialNo());
		params.put("email",customerDetailsForm.getEmail());
		CustomerDetailsWebService customerDetailsWebService = new CustomerDetailsWebService(params);
		CustomerDetails customerDetails=  customerDetailsWebService.getResponseObject();
        logger.info("customerDetails**********"+customerDetails.getAddress());
		 
		return customerDetails;
	}

	public List<UserState> getStates(String countryId) {
		logger.info("getStates for :"+countryId);
		Map<String, String> params = new HashMap<String, String>();
		params.put("CountryID",countryId);
		UserStateListWebService userStateListWebService = new UserStateListWebService(params);
		UserStateRs userStateRs=  userStateListWebService.getResponseObject();
		System.out.println(userStateRs.getUserStateList().get(0).getState()); 
       return userStateRs.getUserStateList();

	}

	public UserTaxesList getTaxList(String stateId) {
		logger.info("getTaxList:"+stateId);
		Map<String, String> params = new HashMap<String, String>();
		params.put("StateID",stateId);
		UserTaxesWebService userTaxesWebService = new UserTaxesWebService(params);
		UserTaxesList userTaxesList=  userTaxesWebService.getResponseObject();
		 
       return userTaxesList;
	}

	public UserTaxesList getTaxListByName(String stateName) {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("StateName",stateName);
		UserTaxesByStateWebService userTaxesWebService = new UserTaxesByStateWebService(params);
		UserTaxesList userTaxesList=  userTaxesWebService.getResponseObject();
		 
       return userTaxesList;
	}
        
} 


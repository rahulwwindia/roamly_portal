package com.roamly.user.beans;


 
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.google.gson.annotations.SerializedName;

public class UserFullDetail extends User {
	  
	
	@Override
	public String toString() {
		return "UserFullDetail [customerId=" + customerId + ", accountId="
				+ accountId + ", fullName=" + fullName + ", organization="
				+ organization + ", countryId=" + countryId + ", loginId="
				+ loginId + ", password=" + password + ", email=" + email
				+ ", timeZone=" + timeZone + ", balance=" + balance
				+ ", currencyId=" + currencyId + ", resellerId=" + resellerId
				+ ", regDate=" + regDate + ", isCorporate=" + isCorporate
				+ ", isCorpAccountMgr=" + isCorpAccountMgr + ", interfaceLang="
				+ interfaceLang + "]";
	}

	public UserFullDetail(String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked, Collection<GrantedAuthority> authorities) {
		
		super(username, password, enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, authorities);
		// TODO Auto-generated constructor stub
	}
 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;  
	@SerializedName("Customer_ID")
	private String customerId;
	@SerializedName("Account_ID")
	private String accountId;
	@SerializedName("FullName")
	private String fullName;
	
	public void setRole(String role) {
		this.role = role;
	}

	@SerializedName("State") 
	private String state;
	
	
	public String getRole() {
		return role;
	}

	@SerializedName("Role_Name")
	private String role;
	
	public String getState() {
		return state;
	}

	@SerializedName("Organization")
	private String organization;
	@SerializedName("Country_ID")
	private String countryId;
	@SerializedName("Login")
	private String loginId; 
	 
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getLoginId() {
		return loginId;
	} 

	public String getPassword() {
		return password;
	}

	@SerializedName("Pwd")
	private String password; 
	@SerializedName("Email")
	private String email;
	@SerializedName("TimeZone_ID")
	private String timeZone;
	@SerializedName("Balance")
	private String balance;
	@SerializedName("Currency_ID")
	private String currencyId;
	@SerializedName("Reseller_ID")
	private String resellerId;
	@SerializedName("RegDate")
	private String regDate;
	@SerializedName("IsCorporate")
	private String isCorporate;
	@SerializedName("IsCorpAccountMgr")
	private String isCorpAccountMgr;
	@SerializedName("InterfaceLang")
	private String interfaceLang;
 
	
 
	public String getCustomerId() {
		return customerId;
	}

	public String getAccountId() {
		return accountId;
	}

	public String getFullName() {
		return fullName;
	}

	public String getOrganization() {
		return organization;
	}

	public String getCountryId() {
		return countryId;
	}

	public String getEmail() {
		return email;
	}

	public String getTimeZone() {
		return timeZone;
	}

	public String getBalance() {
		return balance;
	}

	public String getCurrencyId() {
		return currencyId;
	}

	public String getResellerId() {
		return resellerId;
	}

	public String getRegDate() {
		return regDate;
	}

	public String getIsCorporate() {
		return isCorporate;
	}
 
	public String getIsCorpAccountMgr() {
		return isCorpAccountMgr;
	}

	public String getInterfaceLang() {
		return interfaceLang;
	}

	
}

package com.roamly.user.beans;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserCallHistory{

	@SerializedName("CDR_ID")
	private String cdrId; 
	@SerializedName("Customer_ID")
	private String customerId;
	@SerializedName("SourcePhone")
	private String sourcePhone;
	@SerializedName("DestinationPhone")
	private String destinationPhone;
	@SerializedName("CallLength60Src")
	private String callLength60Src;
	@SerializedName("CallLength60Dst")
	private String callLength60Dst;
	@SerializedName("CallLength1Src")
	private String callLength1Src;
	@SerializedName("CallLength1Dst")
	private String callLength1Dst;
	@SerializedName("DstCallTime")
	private String dstCallTime;
	@SerializedName("Rate")
	private String rate;
	@SerializedName("PerSecTotal")
	private String perSecTotal;
	@SerializedName("PerMinTotal")
	private String perMinTotal;
	@SerializedName("Service_ID")
	private String serviceId;
	@SerializedName("EN_ShortName")
	private String enShortName;

	public String getCdrId() {
		return cdrId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public String getSourcePhone() {
		return sourcePhone;
	}

	public String getDestinationPhone() {
		return destinationPhone;
	}

	public String getCallLength60Src() {
		return callLength60Src;
	}

	public String getCallLength60Dst() {
		return callLength60Dst;
	}

	public String getCallLength1Src() {
		return callLength1Src;
	} 

	public String getCallLength1Dst() {
		return callLength1Dst;
	}

	public String getDstCallTime() {
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(Long.parseLong(dstCallTime)); 
        String date = formatter.format(calendar.getTime());
		return date;  
	}

	public String getRate() {
		return rate;
	}

	public String getPerSecTotal() {
		return perSecTotal;
	}

	public String getPerMinTotal() {
		return perMinTotal;
	}

	public String getServiceId() {
		return serviceId;
	}

	public String getEnShortName() {
		return enShortName;
	}

	/*
	 * public String toString() { return "CallHistory [CDR_ID=" + CDR_ID +
	 * ", Customer_ID=" + Customer_ID + ", SourcePhone=" + SourcePhone +
	 * ", DestinationPhone=" + DestinationPhone + ", CallLength60Src=" +
	 * CallLength60Src + ", CallLength60Dst=" + CallLength60Dst +
	 * ", CallLength1Src=" + CallLength1Src + ", CallLength1Dst=" +
	 * CallLength1Dst + ", DstCallTime=" + DstCallTime + ", Rate=" + Rate +
	 * ", PerSecTotal=" + PerSecTotal + ", PerMinTotal=" + PerMinTotal +
	 * ", Service_ID=" + Service_ID + ", EN_ShortName=" + EN_ShortName + "]"; }
	 */
}

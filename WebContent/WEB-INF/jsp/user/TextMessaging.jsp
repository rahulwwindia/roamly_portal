<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="label.title"/></title>     
<link href="<%=request.getContextPath()%>/resources/styles/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/styles/style_user.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/styles/main.css" rel="stylesheet" type="text/css" />
 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script> 

<script>
$(document).ready(function() {
	  var max = 70;
 $('#smsText').keyup(function(){
	
                  
                    var len = $(this).val().length;
                    if (len >  max) {
                    	var r=confirm("New sms start");
                    	if (r==true)
                    	  {
                    	 max=max+70;
                    	 
                    	  } 
                    	else
                    	  {
                    	  
                    	  } 
                         
                    }else { 
                    	
                        document.getElementById("chCount").value=len;
  
                    }
    });
}); 
 
 </script>
</head>  
<body>   
<div id="container" class="full-width">
<div id="header">
	<div id="headerTitle"><tiles:insertAttribute name="header" /></div>
</div> 
   <div id="accountContent2">
      <div id="contentTitle"><span class="title"><spring:message code="label.textMessaging"/></span></div>
      <div id="contentTx4">
        <div class="content">
          <div class="accountWhiteBoxBody1">
            <div style="padding: 20px;"> <spring:message code="label.sendSmsText"/></div>
            <div class="buyNowBlueSq"><spring:message code="label.selectSim"/></div>
            <div id="ctl00_ContentPlaceHolder1_MySim">
              <div style="padding: 20px;">
                <table>
                  <tbody>
                    <tr>
                      <td align="left" style="width: 60%"> <spring:message code="label.serialNo"/></td> 
                      <td><span style="display:inline-block;width:200px;" id="ctl00_ContentPlaceHolder1_lbl_sim_one">176366086</span></td>
                    </tr>
                  </tbody>
                </table>
                <span id="ctl00_ContentPlaceHolder1_UpdatePanel5">
                <table cellspacing="0" cellpadding="0" class="tablepayment"> 
                  <tbody>
                    <tr>
                      <td align="left" style="width: 45%"><span class="callHistoryBox1" id="ctl00_ContentPlaceHolder1_lbl_User"><spring:message code="label.currentBalance"/></span></td>
                      <td align="left"><span class="callHistoryBox3" id="ctl00_ContentPlaceHolder1_lbl_balance">${userBalance.balance}</span></td>  
                    </tr>
                  </tbody>
                </table>
                </span> </div>
            </div>
            <div class="buyNowBlueSq"><spring:message code="label.recipientDetails"/></div>
            <div style="padding: 20px;"> <spring:message code="label.smsRecipient"/>
              <input type="image" style="border-width:0px;" src="../Images/ratesQuestion.png" id="ctl00_ContentPlaceHolder1_ib_pinhlp" name="ctl00$ContentPlaceHolder1$ib_pinhlp">
              <table cellspacing="0" cellpadding="0" class="tablepayment">
                <tbody>
                  <tr>
                    <td align="left" style="width: 45%"><span id="ctl00_ContentPlaceHolder1_lbl_country"><spring:message code="label.polarPhoneNo"/></span></td>
                    <td align="left"><input type="text" style="width:200px;" id="ctl00_ContentPlaceHolder1_tb_serial" name="ctl00$ContentPlaceHolder1$tb_serial">
                      <span style="color:Red;display:none;" title="Phone # is required." id="ctl00_ContentPlaceHolder1_RequiredFieldValidator1"><spring:message code="label.phoneRequire"/></span></td>
                  </tr>
                  <tr>
                    <td align="left" style="font-weight:bold; font-size:smaller; text-align:center" colspan="2"><span id="ctl00_ContentPlaceHolder1_lbl_phone2"><spring:message code="label.plzVerifyNo"/></span></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="buyNowBlueSq"><spring:message code="label.textToSent"/></div>
            <div style="padding: 20px;"> <span id="ctl00_ContentPlaceHolder1_Label1"><spring:message code="label.smsRestriction"/></span>
              <table cellspacing="0" cellpadding="0" class="tablepayment">
                <tbody>
                  <tr>
                    <td align="center" colspan="2"><textarea  rows="5" cols="82" id="smsText" name="smsText"></textarea></td>
                  </tr> 
                  <tr>
                    <td valign="middle" class="style1" colspan="2"><span id="ctl00_ContentPlaceHolder1_lbl_NumberEntered"><spring:message code="label.NoCharEnter"/></span>
                      <input type="text"  maxlength="4" size="4" name="remLen2" id="chCount" readonly=""></td>
                  </tr> 
                  <tr>
                    <td colspan="2"><div class="callHistGrayTinyLine"> </div></td>
                  </tr>
                  <tr>
                    <td colspan="2"><span style="font-size:0.7em;" id="ctl00_ContentPlaceHolder1_lbl_disclaimer"><spring:message code="label.notResponsible"/></span></td>
                  </tr>
                  <tr>
                    <td colspan="2"><div class="callHistGrayTinyLine"> </div></td>
                  </tr>
                  <tr>
                    <td align="center" style="text-align: center" colspan="2"><input type="button" class="blue-button" >
                      <br>
                      <span style="color:#FF8000;font-weight:bold;" id="ctl00_ContentPlaceHolder1_lbl_validation"></span>
                      <div style="display:none;" id="ctl00_ContentPlaceHolder1_UpdateProgress1"> <img style="border-width:0px;" src="../Images/ajax-loader_sm.gif" id="ctl00_ContentPlaceHolder1_Image2"> </div></td>
                  </tr>
                  <tr> 
                    <td style="text-align: center" colspan="2"><span id="ctl00_ContentPlaceHolder1_lbl_result"></span></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div style="clear:both"></div>
      </div>
    </div>
    
<div id="rightmenu">
			<tiles:insertAttribute name="rightmenu" />
		</div>
	</div>
	</div> 
</body>
</html>
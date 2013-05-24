<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="label.title"/></title>     
<link href="<%=request.getContextPath()%>/resources/styles/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/styles/style_user.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/styles/main.css" rel="stylesheet" type="text/css" />
<script 
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<style>  
.error { 
color: #ff0000;
font-style: italic;
} 
.r-button.update-button {
    float: left;
    font-size: 13px;
    font-weight: bold;
    height: 22px;
    margin-left: 308px;
    padding-left: 12px;
    padding-right: 13px;
    padding-top: 6px;
    width: 85px; 
} 
</style>   
<script type="text/javascript">
 
var phoneTopUp = new Array();
var autoRefill = new Array();

 
function saveInfo()
{
	var i=0;
	
	for (var j=1;j<=document.getElementById("range").value;j++)
	{
		
		phoneTopUp[i]=document.getElementById(i).checked; 
	i++;
	} 
	var i=0;
	for (var j=1;j<=document.getElementById("range").value;j++)
	{
		autoRefill[i]=document.getElementById("autoRefill"+i).checked; 
	i++;
	}   
	
	document.getElementById("phoneTopUpList").value=phoneTopUp;
	
	
	document.getElementById("autoRefillList").value=autoRefill; 
	
	if($("#amount").val().trim()==''){
		alert("Amount should not be blank ");
		$("#amount").focus();
		return false;
	}
	
	if(isNaN(document.getElementById("amount").value))
	{
	alert("Invalid Amount");
	return false;
	} 
	
	
	
	if($("#balance").val().trim()==''){
		alert("Balance should not be blank ");
		$("#balance").focus();
		return false;
	} 
	if(isNaN(document.getElementById("balance").value))
	{
	alert("Invalid Balance"); 
	return false;
	} 
	
	var r=confirm("Do you want to update the changes!")
	if (r==true)
	  {
		document.autoForm.submit(); 
	  }
	else
		{
		document.autoForm.action="autoRefill.htm";
		document.autoForm.submit();  
		}
	
	  
}   

function innerPage(call)
{
  window.location.href=call;
} 
</script> 
</head>  
<%
int i=0;
%>   
<body>  
<div id="container" class="full-width"> 
<div id="header">
	<div id="headerTitle"><tiles:insertAttribute name="header" /></div>
</div>
      <div id="accountContent2">
        <div id="contentTitle"><span class="title"><spring:message code="label.orderHistory"/></span></div>
        <div id="contentTx4">
          <div class="tabs-head">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab-btn">
                 <tr>
                <td  onclick="javascript:innerPage('myProfile.htm')"><spring:message code="label.basicInfo"/></td>
                    <%-- <td><spring:message code="label.accountSetting"/></td>   --%>
                    <%--  <td><spring:message code="label.currentPassword"/></td> --%>
                    <%-- <td onclick="javascript:innerPage('changePassword.htm')"><spring:message code="label.currentPassword"/></td> --%>    
                    <td class="first-btn active" onclick="javascript:innerPage('autoRefill.htm')"><spring:message code="label.autoRefil"/></td> 
                </tr>     
            </table>   
          </div>   
          <div class="myAccountbody"> <span id="ctl00_ContentPlaceHolder1_UpdatePanel1">
          
         <table border="0" width="100%" cellspacing="0" cellpadding="5"
					class="table">
					<thead> 
						<tr>
							<td width="15%"><spring:message code="label.serialNo" /></td>
							<td width="15%"><spring:message code="label.autoRefil" /></td>
							<td width="15%"><spring:message code="label.amount" /></td>
							<td width="15%"><spring:message code="label.balance" /></td>
							<td align="left" width="11%"><spring:message code="label.phoneTopUp" /></td>
						</tr>
					</thead>
						<form:form name="autoForm" id="autoForm" action="autoRefillGo.htm" commandName="autoForm" >
					<c:forEach items="${userActiveCardDetails}" var="userActiveCardDetails"
						varStatus="status" end="5">
						<tbody>
							<tr>    
								<td><input type="text" size="10" name="serialNo" id="serialNo" value="${userActiveCardDetails.serialNum}" readonly="readonly"></input></td>
								<c:choose>
									<c:when test="${userActiveCardDetails.autoRefill=='1'}">
													<td><input type="checkbox" name="autoRefill" id="autoRefill<%=i%>" checked></input></td>
									</c:when>

								<c:otherwise>
												<td><input type="checkbox" name="autoRefill" id="autoRefill<%=i%>"></input></td>
								</c:otherwise>
								</c:choose>
								
								
								 
								<td>US$<input type="text" size="10" name="amount" id="amount" value="${userActiveCardDetails.amount}" ></input></td>  
									<td>US$<input type="text" size="10" name="balance" id="balance" value="${userActiveCardDetails.lowBalance}"></input></td> 
										<c:choose>     
									<c:when test="${userActiveCardDetails.phoneTopUp=='1'}"> 
												<td><input type="checkbox" name="phoneTopUp" id="<%=i %>" checked ></input></td>
									</c:when>
  
								<c:otherwise>
												<td><input type="checkbox" name="phoneTopUp" id="<%=i %>" ></input></td>
								</c:otherwise>
								</c:choose>
										
										
										 
									</tr>     
								
						</tbody>    
						<% i++; %>  
					</c:forEach>
					 <input type="hidden" name="range" id="range" value="<%=i %>"></input>
					<input type="hidden" name="phoneTopUpList" id="phoneTopUpList"></input> 
					<input type="hidden" name="autoRefillList" id="autoRefillList"></input> 
					
				</table>
				</span>  
				<div class="clear separator"></div> 
								    <!--  <input type="button" onclick="javascript:saveInfo()" value="Update" id="TopUp" name="TopUp" style="margin-top: 10px;" /> -->
				
            
            <div style="display:none;" id="ctl00_ContentPlaceHolder1_UpdateProgress1">
              <div style="border-right: black 1px solid; border-top: black 1px solid; left: 50%;
									border-left: black 1px solid; width: 100px; color: white; border-bottom: black 1px solid;
									position: absolute; top: 50%; height: 60px; background-color: white; background-position: center center;
				 					background-image: url(../Images/ajax-loader_green.gif); text-align: center; background-repeat: no-repeat;"> </div>
            </div>
          </div>
          <div id="auorefillSaveChangesBt">
						<input type="button" class="blue-button" value="Update"
							hidefocus="true" style="margin-left: 163px;" id="ctl00_ContentPlaceHolder1_ib_autorefill"
							name="ctl00$ContentPlaceHolder1$ib_autorefill" onclick="javascript:saveInfo()" />
							 
							   
					</div>   
        </div>  
        </form:form>    
      <div style="clear:both"></div> 
   
</div> 
<div id="rightmenu">  
	<tiles:insertAttribute name="rightmenu" />
</div>  
</div>  
</body> 
</html>    


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="label.title" /></title>
<link href="<%=request.getContextPath()%>/resources/styles/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/resources/styles/style_user.css"
	rel="stylesheet" type="text/css" /> 
<link
	href="<%=request.getContextPath()%>/resources/styles/main.css"
	rel="stylesheet" type="text/css" />
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

<script
	src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>
<script type="text/javascript">
      var jquery = $;
      jquery(document).ready(function () {
    	
         // $("#toDate").datepicker();
          
          jquery("#toDate").datepicker(
        	        {
        	    });
          
          jquery("#fromDate").datepicker(
      	        {
      	        	
      	    });
        	
       
       jquery("#activeSim option[value=\"${optionSel}\"]").attr("selected","selected");
        	
        	  
      	    
        
      }); 
      
      
      
    
         
  </script>

     
</head> 
<style>
#NoHistory
{
text-align:center;
color:red; 
font-size: 15px; 
} 
</style>
<body>
<div id="container" class="full-width">  
	<div id="header">
		<div id="headerTitle">
			<tiles:insertAttribute name="header" />
		</div>
	</div>
	<div id="accountContent2"> 
		<div id="contentTitle">
			<span class="title"><spring:message code="label.callHistory" /></span>
		</div>
		 <form:form id="dateForm" name="dateForm" action="callHistoryGo.htm" method="POST"
							commandName="dateForm">  
		<div id="contentTx4">
			<div class="head"><spring:message code="label.selectPolar1Sim" /> &nbsp;&nbsp;&nbsp;&nbsp;
			 
			<select	title="Select Polar Wireless Package" 
											id="activeSim"
											name="activeSim" onchange="javascript:getOption()"> 
											
											<c:forEach items="${userActiveCardDetails}" var="activeSimList" varStatus="status">
						 					
       										<option value="${activeSimList.serialNum}:${activeSimList.balance}" id="${activeSimList.serialNum}" >${activeSimList.serialNum}:<spring:message code="label.currency" /><fmt:formatNumber value="${activeSimList.balance}" pattern="0.00"/></option>
       										
											</c:forEach>        
										</select> 
			  						 
			</div> 
			<div class="content"> 
				<table border="0" width="100%" cellspacing="0" cellpadding="5"
					class="table">
					<tbody> 
					
							<tr>  
								<td><spring:message code="label.fromDate" /> <input id="fromDate" type = "text" name="fromDate" required="required"></input><form:errors path="dateError" cssClass="error" /></td> 
								<td><spring:message code="label.toDate" /> <input id="toDate" name="toDate" type = "text" required="required"></input><form:errors path="dateError" cssClass="error" /></td>
								<td><input type="submit" class="blue-button" value="Go"
							hidefocus="true" id="ctl00_ContentPlaceHolder1_ib_autorefill"
							name="ctl00$ContentPlaceHolder1$ib_autorefill" /><!-- <input type="submit" value="Go" name="go"> --></input></td> 
							</tr>   
							<tr>   
							 
							<td></td> 
 
							</tr> 
						</form:form> 
				
						   
					</tbody> 
				</table> 
			</div>  
		</div>
		<!--    
         <div class="head">Select your Polar1 Sim </div>
          <div class="content">
          	<p>Nickname\Serial Number: 	176366086</p>
            <table border="0" width="100%" cellspacing="0" cellpadding="5" class="table">
              <tbody><tr>
              	<td><input type="radio" id="" name="">Today</td>
                <td><input type="radio" id="" name=""><span>Last 7 days</span></td>
                <td><input type="radio" id="" name=""><span>This month</span></td>
                <td><input type="radio" id="" name=""><span>Previous month</span></td>
                <td><input type="radio" id="" name=""><span>3 months</span></td>
                <td><input type="radio" id="" name=""><span>All</span></td>
                <td><input type="image" style="border-width:0px;" onclick="ShowDL_DLG('/Users/CallHistoryXls.ashx?D=Today&amp;C=2875&amp;L=en-US&amp;IC=False&amp;A=2882'); HideDL_DLG();" src="../Images/xls.jpg" id="ctl00_ContentPlaceHolder1_ib_xls" name="ctl00$ContentPlaceHolder1$ib_xls"></td>
               </tr>
              
            </tbody></table>
          </div>
        </div> -->
<c:choose>
<c:when test="${empty callHistory}">
  <p id="NoHistory">No Call/SMS History Found</p>  
</c:when>
<c:otherwise>
		<div id="contentTx4">
			<div class="head"><spring:message code="label.callDetails" /></div>
			<div class="content">
				<table border="0" width="100%" cellspacing="0" cellpadding="5"
					class="table">
					<thead>
						<tr style="font-weight: bold"> 
							<td><spring:message code="label.callTime" /></td>
							<td><spring:message code="label.source" /></td>
							<td><spring:message code="label.destination" /></td>
							<td><spring:message code="label.type" /></td>
							<td><spring:message code="label.length" /></td>
							<td><spring:message code="label.rate" /></td>
							<td><spring:message code="label.total" /></td>
						</tr>
					</thead>  
					<c:forEach items="${callHistory}" var="callHistory"
						varStatus="status" end="5">
						<tbody>
							<tr>  
								<td><c:out value="${callHistory.dstCallTime}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.sourcePhone}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.destinationPhone}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.enShortName}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.callLength60Src}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.rate}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.perMinTotal}"
										default="Not Available" escapeXml="false"></c:out></td>
							</tr>
						</tbody>
					</c:forEach>
				</table> 
			</div>
		</div>

		<div id="contentTx4">
			<div class="head"><spring:message code="label.smsDataUsage" /></div>
			<div class="content">
				<table border="0" width="100%" cellspacing="0" cellpadding="5"
					class="table">
					<thead>
						<tr style="font-weight: bold"> 
							<td><spring:message code="label.callTime" /></td>
							<td><spring:message code="label.source" /></td>
							<td><spring:message code="label.destination" /></td>
							<td><spring:message code="label.type" /></td>
							<td><spring:message code="label.length" /></td>
							<td><spring:message code="label.rate" /></td>
							<td><spring:message code="label.total" /></td>
						</tr>
					</thead>
					<c:forEach items="${smsHistory}" var="smsHistory"
						varStatus="status" end="5">
						<tbody>
							<tr> 
								<td><c:out value="${smsHistory.dstCallTime}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.sourcePhone}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.destinationPhone}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.enValue}"
										default="Not Available" escapeXml="false"></c:out></td> 
								<td><c:out value="${smsHistory.messageUnits}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.rate}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.chargedAmount}"
										default="Not Available" escapeXml="false"></c:out></td>
							</tr>
						</tbody>
					</c:forEach> 
				</table>
			</div>
		</div>
		 </c:otherwise>
		 </c:choose>
		<%-- <p style="font-size: 11px; margin: 20px 10px;"><spring:message code="label.callHistoryNote" /></p> --%>
	<div style="clear: both"></div>
	
	</div>  
	<div id="rightmenu">  
	<tiles:insertAttribute name="rightmenu" />
</div>   
	</div>
</body> 
</html>  

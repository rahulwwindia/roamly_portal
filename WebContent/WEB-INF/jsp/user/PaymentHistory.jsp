<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="label.title" /></title>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<link href="<%=request.getContextPath()%>/resources/styles/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/resources/styles/style_user.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/styles/main.css"
	rel="stylesheet" type="text/css" />
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
      
      function getDataByDate()
      {
    	  if(document.getElementById("fromDate").value="")
    		  {
    		  alert("Please select from Date");
    		  return false ;
    		  }
    	  if(document.getElementById("toDate").value="")
		  {
		  alert("Please select to Date");
		  return false ;
		  }
    	  document.dateForm.submit();
      } 
      
      function getAllDetails(debitId)
      {
   	  $.ajax({
  		    type: "Get", 
  		   	 
  		    url: "getAllPaymentDetails.htm?debitId="+debitId,
  		     success: function(data){ 
  		    	 
  		    	 document.getElementById("getAll").innerHTML=data;
  		     }
  		    });  
      }
  </script>

</head>
<body>
	<div id="container" class="full-width">
		<div id="header">
			<div id="headerTitle">
				<tiles:insertAttribute name="header" />
			</div>
		</div>
		<form:form id="dateForm" name="dateForm" action="paymentHistoryGo.htm"
			method="POST" commandName="dateForm">
			<div id="accountContent2">
				<div id="contentTitle">
					<span class="title"><spring:message
							code="label.paymentHistory" /> </span>
				</div>
				<div id="contentTx4">
					<div class="head">
						<spring:message code="label.selectSim" />
						&nbsp; &nbsp; &nbsp; &nbsp; <select
							title="Select Polar Wireless Package" id="activeSim"
							name="activeSim">
							<c:forEach items="${userActiveCardDetails}" var="activeSimList"
								varStatus="status">
								<option
									value="${activeSimList.serialNum}:${activeSimList.balance}">
									${activeSimList.serialNum}:
									<spring:message code="label.currency" />
									<fmt:formatNumber value="${activeSimList.balance}"
										pattern="0.00" />
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="content">
						<div id="ctl00_ContentPlaceHolder1_UpdatePanel1">
							<%--  <center>   
              <div class="callHistLink"> <span style="font-family:Arial;font-size:Small;" id="ctl00_ContentPlaceHolder1_rbl_days">
                <input type="radio" checked="checked" value="This month" name="ctl00$ContentPlaceHolder1$rbl_days" id="ctl00_ContentPlaceHolder1_rbl_days_0">
                <label for="ctl00_ContentPlaceHolder1_rbl_days_0"><spring:message code="label.thisM"/></label>
                <input type="radio" onclick="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$rbl_days$1\',\'\')', 0)" value="Previous month" name="ctl00$ContentPlaceHolder1$rbl_days" id="ctl00_ContentPlaceHolder1_rbl_days_1">
                <label for="ctl00_ContentPlaceHolder1_rbl_days_1"><spring:message code="label.prevM"/></label>
                <input type="radio" onclick="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$rbl_days$2\',\'\')', 0)" value="Last 3 months" name="ctl00$ContentPlaceHolder1$rbl_days" id="ctl00_ContentPlaceHolder1_rbl_days_2">
                <label for="ctl00_ContentPlaceHolder1_rbl_days_2"><spring:message code="label.threeM"/></label>
                <input type="radio" onclick="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$rbl_days$3\',\'\')', 0)" value="Last 6 months" name="ctl00$ContentPlaceHolder1$rbl_days" id="ctl00_ContentPlaceHolder1_rbl_days_3">
                <label fotoDater="ctl00_ContentPlaceHolder1_rbl_days_3"><spring:message code="label.sixM"/></label>
                <input type="radio" onclick="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$rbl_days$4\',\'\')', 0)" value="Last Year" name="ctl00$ContentPlaceHolder1$rbl_days" id="ctl00_ContentPlaceHolder1_rbl_days_4">
                <label for="ctl00_ContentPlaceHolder1_rbl_days_4"><spring:message code="label.lastY"/></label>
                </span> </div>
            </center>  --%>

							<table border="0" width="100%" cellspacing="0" cellpadding="5"
								class="table">
								<tbody>
									<tr>
										<td><spring:message code="label.fromDate" /> <input
											id="fromDate" name="fromDate" required="required"></input> <form:errors
												path="dateError" cssClass="error" /></td>
										<td><spring:message code="label.toDate" /> <input
											id="toDate" name="toDate" required="required"></input> <form:errors
												path="dateError" cssClass="error" /></td>
										<td><td><input type="submit" class="blue-button"
												value="Go" hidefocus="true"
												id="ctl00_ContentPlaceHolder1_ib_autorefill"
												name="ctl00$ContentPlaceHolder1$ib_autorefill" /></input></td>
									</tr>
									<!--<tr>

										<td></td>
									</tr>
									-->
									</form:form>
								</tbody>
							</table>
							<c:choose>
								<c:when test="${empty paymentHistory.userTransactionHistories}">
								</c:when>
								<c:otherwise>
									<div style="width: 100%; text-align: center;"
										id="ctl00_ContentPlaceHolder1_PanelCalls">
										<div>
											<table cellspacing="15" cellpadding="2"
												id="ctl00_ContentPlaceHolder1_GridView1" class="grid">
												<tbody>
													<tr style="font-weight: bold;" class="headervisible">
														<th align="center" style="width: 120px;" scope="col"><b><spring:message
																	code="label.paymentDate" /> </b></th>
														<th align="center" style="width: 120px;" scope="col"><b><spring:message
																	code="label.paymentId" /> </b></th>
														<th align="center" style="width: 70px;" scope="col"><b><spring:message
																	code="label.amount" /> </b></th>
														<th align="center" style="width: 140px;" scope="col"><b><spring:message
																	code="label.tax" /> </b></th>
														<th align="center" style="width: 100px;" scope="col"><b><spring:message
																	code="label.total" /> </b></th>
														<th align="center" style="width: 100px;" scope="col"><b><spring:message
																	code="label.details" /> </b></th>
													</tr>
													<br />
													<!--<tr> 
                    <td>
                     </td></tr>
                    -->
													<c:forEach
														items="${paymentHistory.userTransactionHistories}"
														var="userPaymentHistory" varStatus="status" end="9">
														<tr class="itemselected">
															<td align="center" style="width: 120px;">${userPaymentHistory.purchaseDate}</td>
															<td align="center" style="width: 120px;">${userPaymentHistory.accountDebitId}</td>
															<td align="center" style="width: 70px;"><spring:message
																	code="label.currency" /> <fmt:formatNumber
																	value="${userPaymentHistory.amount}" pattern="0.00" />
															</td>
															<td align="center" style="width: 140px;"><spring:message
																	code="label.currency" /> <fmt:formatNumber
																	value="${userPaymentHistory.transFee}" pattern="0.00" />
															</td>
															<td align="center" style="width: 100px;"><spring:message
																	code="label.currency" /> <fmt:formatNumber
																	value="${userPaymentHistory.total}" pattern="0.00" />
															</td>
															<td align="center">
																<!-- <a href="#all"><img src="request.getContextPath()/resources/images/searchTn1.png"  title="Search" onclick="javascript:getAllDetails(${userPaymentHistory.accountDebitId})" /></a> </td>-->
																 <a href="#all"><img src="<%=request.getContextPath()%>/resources/images/button_blank_yellow_01.png" alt="Details" height="25" width="25" onclick="javascript:getAllDetails(${userPaymentHistory.accountDebitId})"></img></a> 
																
															</td>   
														</tr>
													</c:forEach>
												</tbody> 
											</table>
										</div>
									</div> 
									<div style="clear: both"></div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div id="all">
						<div id="getAll"></div>
					</div>
					<div style="clear: both"></div>
				</div>
			</div>
			<div id="rightmenu">
				<tiles:insertAttribute name="rightmenu" />
			</div>
	</div>
</body>
</html>

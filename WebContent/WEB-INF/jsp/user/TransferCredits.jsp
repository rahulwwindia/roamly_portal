
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="<%=request.getContextPath()%>/resources/styles/main.css"
	rel="stylesheet" type="text/css" />
<script>
	function transferCredit() {
		//alert("func called");

		if (document.getElementById("agree").checked) {

			document.frmTransferCredits.action = "transferCreditForm.htm";
			document.frmTransferCredits.submit();
		} else {
			alert("Please Check the Agree Conditions check box");
		}
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
		<div id="accountContent2">
			<div id="contentTitle">
				<span class="title"><spring:message
						code="label.transferCredit" /></span>
			</div>
			<c:choose>
				<c:when test="${empty userActiveCardDetails}">

					<input type="button" name="activate" value="Activate Card"
						onclick="activateCard()"></input>
				</c:when>
				<c:otherwise>
					<div id="contentTx4">
						<div class="head">
							<spring:message code="label.myPolar1" />
							&nbsp;&nbsp;&nbsp;&nbsp;


						</div>
						<div class="content">
							<form:form name="frmTransferCredits"
								action="transferCreditForm.htm" commandName="transferCreditForm"
								method="post">

								<div class="clear separator"></div>
								<div class="text clear">
									<tr>
										<td><div class="icon left">
												<div class="number">1</div>
											</div>
											<spring:message code="label.selectYourPolar1Sim" /></td>
										<td><select title="Select Polar Wireless Package"
											id="activeSim" name="activeSim"
											style="margin-left: 18px; width: 205px;">
												<c:forEach items="${userActiveCardDetails}"
													var="activeSimList" varStatus="status">
													<option
														value="${activeSimList.serialNum}:${activeSimList.balance}">
														${activeSimList.serialNum}:
														<spring:message code="label.currency" />
														<fmt:formatNumber value="${activeSimList.balance}"
															pattern="0.00" />
													</option>
												</c:forEach>
										</select></td>
									</tr>
									<div class="clear separator"></div>
									<div class="top-header clear"></div>
									<div class="clear separator"></div>
									<div class="text clear">
										<div class="label left">
											<label for="polar-serial"></label>
										</div>

										<div class="text clear">
											<tr>
												<td><div class="icon left">
														<div class="number">2</div>
													</div>
													<spring:message code="label.receiptDetails" /></td>
												<td><select title="Select Polar Wireless Package"
													id="polarSerial" name="polarSerial">
														<c:forEach items="${userActiveCardDetails}"
															var="activeSimList" varStatus="status">
															<option
																value="${activeSimList.serialNum}:${activeSimList.balance}">
																${activeSimList.serialNum}:
																<spring:message code="label.currency" />
																<fmt:formatNumber value="${activeSimList.balance}"
																	pattern="0.00" />
															</option>
														</c:forEach>
												</select></td>
											</tr>
										</div>
									</div>
									<div class="clear separator"></div>
									<div class="top-header clear"></div>
									<div class="clear separator"></div>
									<div class="text clear">


										<%-- <div class="label left">
											<label for="transfer-amount"><spring:message
													code="label.amountToTransfer" /></label>
										</div> --%>
										<div class="value left">
											<t>
											<td><div class="icon left">
													<div class="number">3</div>
												</div>
												<spring:message code="label.enterAmountToTras" /></td>
											<select name="transferAmount" id="transferAmount"
												style="margin-left: 201px; width: 213px; font:">
												<option value="5">USD$ 5.00</option>
												<option value="10">USD$ 10.00</option>
												<option value="20">USD$ 20.00</option>
												<option value="40">USD$ 40.00</option>
												<option value="80">USD$ 80.00</option>
												<option value="100">USD$ 100.00</option>

											</select>
										</div>
										<div class="label full left"
											style="margin-left: 381px; width: 237px; font-size: smaller;">
											<spring:message code="label.noteTrasRange" />
										</div>
									</div>
									<div class="clear separator"></div>
									<div class="hr"></div>
									<div class="clear separator"></div>
									<div class="text clear">
										<div class="label left">
											<input type="checkbox" id="agree" name="agree" class="left" />
											<label for="agree" class="left"><spring:message
													code="label.checkBoxAgree" />. </label>
										</div>

									</div>
									<div class="clear separator"></div>
									<div id="auorefillSaveChangesBt">
						<input type="button" class="blue-button" value="<spring:message code="label.transfer" />"
							hidefocus="true" style="margin-left: 117px;" id="ctl00_ContentPlaceHolder1_ib_autorefill"
							name="ctl00$ContentPlaceHolder1$ib_autorefill" onclick="javascript:transferCredit()" />
							 
							   
					</div> 
							</form:form>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
	</div>
	</div>
	<div id="rightmenu">
		<tiles:insertAttribute name="rightmenu" />
	</div>

</body>
</html>

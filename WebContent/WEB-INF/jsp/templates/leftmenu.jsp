	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
	<div class="grayBar"></div>
		<div style="clear: both"></div>
		<div id="contentBox">
			<div id="accountSubBox">
				<div class="box">   
					<ul class="submenu">  
						<li class="first"
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_liMyAccount"><a
							href="myAccount.htm" title="<spring:message code="label.myAccount"/>" 
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_HyperLink2">01. <spring:message code="label.myAccount"/></a>
						</li>
						<li id="ctl00_ContentPlaceHolder1_UC_UserMenu1_liPartner"><a
							href="inventory.htm" title="<spring:message code="label.partnerArea"/>"
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_lnkPartner">02.
								<spring:message code="label.partnerArea"/></a>
						</li> 
						<li id="ctl00_ContentPlaceHolder1_UC_UserMenu1_liMakePayment">
							<a href="makePayment.htm" title="<spring:message code="label.makeAPayment"/>"
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_lnkMakePayment">03.
								<spring:message code="label.makeAPayment"/></a></li> 
						<li id="ctl00_ContentPlaceHolder1_UC_UserMenu1_liTransferCredits">
							<a href="transferCredits.htm" title="<spring:message code="label.transferCredits"/>"
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_lnkTransferCredits">04.
								<spring:message code="label.transferCredits"/></a>
						</li>
						<li id="ctl00_ContentPlaceHolder1_UC_UserMenu1_liMyPhoneNum">
							<a href="myNumbers.htm" title="<spring:message code="label.myPhoneNumbers"/>"
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_lnkMyPhoneNum">05.
								<spring:message code="label.myPhoneNumbers"/></a>
						</li>
						<li id="ctl00_ContentPlaceHolder1_UC_UserMenu1_liMyProfile">
							<a href="myProfile.htm" title="<spring:message code="label.myProfile"/>"
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_lnkMyProfile">06.
								<spring:message code="label.myProfile"/></a>
						</li>
						<li id="ctl00_ContentPlaceHolder1_UC_UserMenu1_liPaymentHistory">
							<a href="paymentHistory.htm" title="<spring:message code="label.paymentHistory"/>"
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_lnkPaymentHistory">07.
								<spring:message code="label.paymentHistory"/></a>
						</li>
						<li id="ctl00_ContentPlaceHolder1_UC_UserMenu1_liCallHistory">
							<a href="callHistory.htm" title="<spring:message code="label.callHistory"/>"
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_lnkCallHistory">08.
								<spring:message code="label.callHistory"/></a>
						</li>
						<li id="ctl00_ContentPlaceHolder1_UC_UserMenu1_liPolarSIM"><a
							href="mySIM.htm" title="<spring:message code="label.myPolar1"/>"
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_lnkPolarSim">09.
								<spring:message code="label.myPolar1"/></a>
						</li>  
						<li class="last" 
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_liMessaging"><a
							href="textMessaging.htm" title="<spring:message code="label.textMessaging"/>"
							id="ctl00_ContentPlaceHolder1_UC_UserMenu1_lnkMessaging">10. 
								<spring:message code="label.textMessaging"/></a>
						</li>
					</ul>
				</div>  
			</div>  
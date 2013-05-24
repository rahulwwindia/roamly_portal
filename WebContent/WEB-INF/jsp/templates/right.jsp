	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript">

	$(document).ready(function() {
	   
		$("ul.vertical-nav a").each(function(){
		    var current_href = $(this).attr("href").toString();
		   	var url=document.location.toString();
		   		var arr = url.split("/");
		   		var htm=arr[arr.length-1];
		   		if(htm=="paymentHistoryGo.htm")
		   			{
		   			htm="paymentHistory.htm";
		   			}
		   		if(htm=="callHistoryGo.htm")
	   			{
	   			htm="callHistory.htm";
	   			}
		   		if(htm=="autoRefill.htm")
	   			{
	   			htm="myProfile.htm";
	   			}
		   		 
			if (htm==current_href) {
		      	$(this).addClass("selected");
		    } 
		  });
	});


</script>
    <div class="one-fifth no-padding-right column left">
                <ul class="vertical-nav left-nav clear">
                    <li><a href="myAccount.htm" title="<spring:message code="label.myAccount"/>"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.myAccount"/></span></a></li>
                   <%--  <li><a href="#" title="<spring:message code="label.partnerArea"/>"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.partnerArea"/></span></a></li> --%>
                    <li><a href="makePayment.htm" title="<spring:message code="label.makeAPayment"/>"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.makeAPayment"/></span></a></li>
                    <li><a href="transferCredits.htm" title="<spring:message code="label.transferCredits"/>"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.transferCredits"/></span></a></li>
                    <li><a href="myNumbers.htm" title="<spring:message code="label.myPhoneNumbers"/>"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.myPhoneNumbers"/></span></a></li>
                    <li><a href="myProfile.htm" title="<spring:message code="label.myProfile"/>"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.myProfile"/></span></a></li>
                    <li><a href="paymentHistory.htm" title="<spring:message code="label.paymentHistory"/>"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.paymentHistory"/></span></a></li>
                    <li><a href="callHistory.htm" title="<spring:message code="label.callHistory"/>"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.callHistory"/></span></a></li>
                    <li><a href="mySIM.htm" title="<spring:message code="label.myPolar1"/>"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.myPolar1"/></span></a></li>
                   <%--  <li><a href="textMessaging.htm" title="<spring:message code="label.textMessaging"/>"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.textMessaging"/></span></a></li> --%>
                </ul>   
                <div class="clear separator"></div>   
                <div class="clear separator"></div>  
                <div class="clear separator"></div>
                <div class="clear separator"></div> 
                <ul class="vertical-nav vertical-nav-big left-nav clear">
                  <li><a href="#" title="Features"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.features"/></span></a></li>
                  <li><a href="#" title="Support"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.support"/></span></a></li>
                  <li><a href="#" title="Contact"><span class="arrow">&raquo;</span><span class="nav-text"><spring:message code="label.contact"/></span></a></li>
                </ul>
            </div>  
            <div class="clear separator"></div>
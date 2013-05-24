<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<html>
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
 
<script
	src="http://docs.jquery.com/Plugins/Validation"></script> 
	<script
	src="http://code.jquery.com/jquery.min.js"></script> 
<script>

$(document).ready(function() {
	$("#stateLoad").hide();  
	$("#loading").hide();
	$("#country").change(function() {
		$("#stateLoad").show(); 
		  
		$.ajax({
		    type: "Get", 
		   	data:{val1:$(this).val()},
		    url: "getStates.htm",
			dataType:"json",
			 
		     success: function(data){
		    	 $("#stateLoad").hide();
		    	 var stateLabel="<spring:message code="label.state" />"
		    	 document.getElementById("stateLabel").innerHTML=stateLabel;
		    	 if(document.getElementById("country").value=="40")
		    		 {
		    		 var selectStart='<select style="width: 240px;" id="state" name="state" onchange="javasciprt:callTax();">'
		    		var newlist = "<option value='-1'>Select State</option>";
		    	   for(var i in data) 
		    		   {  
		    		    
		    		   newlist = newlist + "<option value=" + data[i].id + ">" + data[i].state+"</option>"; 
		    		    
		    		   }
		    	   		selectStart=selectStart+newlist+'</select>';
		    	   		
		    	   document.getElementById("stateId").innerHTML=selectStart;
		    		 }
		    	 else{ 
		    		 var stateText="<input type='text' style='width: 240px;' id='state' name='state'></input>"
		    		 document.getElementById("stateId").innerHTML=stateText;
		    		 document.getElementById("PST").value="0";
			    	 document.getElementById("GST").value="0";
			    	 document.getElementById("HST").value="0";
			    	 document.getElementById("totalTAX").value = "0"; 
			    	 document.getElementById("totalAmount").value=document.getElementById("ammountInUSD").value;
			    	 $("#taxAutoTable").hide();
		    	 }
		       
		     }
		    
		    });  
		     
	
	});  
	
	
	
	
	
	
		      
		
	
	
	
}); 

function callTax(){
	document.getElementById("taxTable").innerHTML="";
	 if($("#ammountInUSD").val().trim()!='-1' && $("#state").val().trim()!='-1' ){
		 $("#loading").show(); 
		}
	
	$("#taxTable").ajaxStart(function(){
	    $("#loading").css("display","block");
	  });
	$("#taxTable").ajaxComplete(function(){
	    $("#loading").css("display","none");
	  });
	document.getElementById("totalAmount").value=document.getElementById("ammountInUSD").value;
	$.ajax({
	    type: "Get", 
	   	data:{stateCode:document.getElementById("state").value},
	    url: "getTaxes.htm",
		dataType:"json", 
		 
	     success: function(data){
	    	 if(data.piggyBack=="1")
	    	{
	    		 topUpAmount=parseFloat(document.getElementById("ammountInUSD").value);
	    		 gst=parseFloat(((topUpAmount*data.gst)/100));
		    	 pst=parseFloat(((topUpAmount+gst)*data.pst)/100);
		    	 hst=parseFloat((topUpAmount*data.hst)/100);
		    	 totalTax=0;
		    	 total=topUpAmount+pst+gst+hst;
	    	}
	    	 else
	    		 {
	    		 topUpAmount=parseFloat(document.getElementById("ammountInUSD").value);
		    	 pst=parseFloat((topUpAmount*data.pst)/100);
		    	 gst=parseFloat(((topUpAmount*data.gst)/100));
		    	 hst=parseFloat((topUpAmount*data.hst)/100);
		    	 totalTax=0;
		    	 total=topUpAmount+pst+gst+hst;
	    		 }
	    	 document.getElementById("PST").value=pst;
	    	 document.getElementById("GST").value=gst;
	    	 document.getElementById("HST").value=hst;
	    	 document.getElementById("totalTAX").value = totalTax; 
	    	 document.getElementById("totalAmount").value=total;
	    	 
	    	 document.getElementById("PST").value=pst;
	    	 var taxTable="<table class='tablepayment' id='taxAutoTable' border='1' style='width:100px;vertical-align: middle;'><tr>" +
				"<th >Top Up Amount</th>" +
				"<th>PST ("+data.pst+"%)</th>" +
				"<th>GST ("+data.gst+"%)</th>" +
				"<th>HST ("+data.hst+"%)</th>" + 
				"<th>Total Amount</th>" +
				"</tr> " + 
				"<tr>" + 
				"<td>US$"+topUpAmount+"</td>" + 
				"<td>US$"+pst+"</td>" +
				"<td>US$"+gst+"</td>" + 
				"<td>US$"+hst+"</td>" +
				"<td>US$"+total+"</td>" +
				"</tr>" + 
				"</table>"; 
				
				document.getElementById("taxTable").innerHTML=taxTable;
	    	
	     }  
	    
	    });  
}

function paymentDetails()
{
	$("#contentTx5").show();	
}
function cancel() 
{
	window.location.href="makePayment.htm"	
}

function activateCard()
{
	  window.location.href="./mySIM.htm"; 
}
  
function makePayment()
{ 
	
	
	
	
	 if($("#ammountInUSD").val().trim()=='-1'){
		 alert("Please select amount");
			$("#ammountInUSD").focus();
			return false;
		}
	if(document.getElementById("cardType").value=="1") 
	{
		alert("please select payment type");
		return false;
		
	} 
	
	if($("#custName").val().trim()==''){
		alert("please insert customer name");
		$("#custName").focus();
		return false;
	}
	
	if($("#address1").val().trim()==''){
		alert("please insert address1");
		$("#address1").focus();
		return false;
	}
		 
	if($("#address2").val().trim()==''){
		alert("please insert address2");
		$("#address2").focus();
		return false;
	}
	
	if($("#city").val().trim()==''){
		alert("please insert city"); 
		$("#city").focus();
		return false;
	}
	
	if($("#email").val().trim()==''){
		alert("please insert email"); 
		$("#email").focus();
		return false;
	}
	 
	if(!validate(document.getElementById("email").value))
	 	{
		return false;
	 	} 
	  
	if(document.getElementById("country").value=="1") 
	{
		alert("please select country");
		return false;
		
	} 
	if($("#state").val().trim()=='-1'){
		 alert("Please select state");
			$("#state").focus();
			return false;
		}
	
	if($("#postalCode").val().trim()==''){
		alert("please insert postal code");
		$("#postalCode").focus();
		return false;
	}
	
	if($("#creditCardNo").val().trim()==''){
		alert("please insert credit card no");
		$("#creditCardNo").focus();
		return false;
	}
	
	
	if(isNaN(document.getElementById("creditCardNo").value) || document.getElementById("creditCardNo").value.length<14 )
		{
		alert("Invalid credit card number");
		return false;
		} 
	  
	
	if($("#cvvCode").val().trim()==''){
		alert("please insert CVC/CVV code");
		$("#cvvCode").focus();
		return false;
	} 
	
	if(isNaN(document.getElementById("cvvCode").value) || document.getElementById("cvvCode").value.length !=3 )
	{
	alert("Invalid CVC/CVV code");
	return false;
	}  
	 
	if($("#pin").val().trim()==''){
		alert("please enter PIN");
		$("#pin").focus();
		return false;
	}
	
	if(document.getElementById("pin").value.length !=4) 
	{
		alert("Invalid PIN");
		return false;
	} 
	
	if($("#rePin").val().trim()==''){
		alert("please Re-Enter PIN");
		$("#rePin").focus();
		return false;
	}
	if(document.getElementById("rePin").value.length !=4) 
	{
		alert("Invalid PIN please re-enter again ");
		return false;
	} 
	
	if(!document.getElementById("rePin").value.match(document.getElementById("pin").value)) 
	{
		alert("Pins don't Match");
		return false; 
	}  
	
	
	if(document.getElementById("activeSim").value < document.getElementById("totalAmount").value)
	{
	alert("you don't have enough balance"); 
	return false;
	}  
	
	 
	document.getElementById("makeDefaultSet").value=document.getElementById("makedefault").checked
	if(document.getElementById("acceptTermsConditions").checked)
	{
	document.payment.action="./paymentGateway.htm";
	document.payment.submit();
	} 
	else    
	{
		alert("Accept terms and conditions");
		return false;
	}
}  

function validate(email) {

    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    //var address = document.getElementById[email].value;
    if (reg.test(email) == false) 
    {
        alert('Invalid Email Address');
        return false;
    }
    else
    	return true;
    
} 
</script>  
<style>  
.error { 
color: #ff0000;
font-style: italic;
}

.serialNo td {
    padding: 3px 0 0 1px;
    text-align: left;
}
</style>

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
			<span class="title"><spring:message code="label.makeAPayment" /></span>
		</div>
		<div id="contentTx4">
			<div class="head"><spring:message code="label.myPolar1" /></div>
			<div class="content">
				<div class="col full">

	<c:choose>
		 <c:when test="${empty userActiveCardDetails}">
        
        Please Active SIM <input type="button" name="activate" value="Activate Card" onclick="activateCard()"></input>
    </c:when>
     <c:otherwise> 
					<table class="serialNo">
							<tbody> 
								<tr>  
									<td align="left"><table width="167%">
             								<tr>    
                							<td>Serial Number</td>
                							<td>Balance</td> 
                							</tr>  
             								 <c:forEach items="${userActiveCardDetails}" var="activeSimList" varStatus="status">
											
											<tr>   
                							<td>${activeSimList.serialNum}</td>
                							<td><spring:message code="label.currency" /><fmt:formatNumber value="${activeSimList.balance}" pattern="0.00"></fmt:formatNumber></td>  
                							</tr>  
                							</c:forEach>
											</table></td> 
								</tr> 
							</tbody> 
						</table>
						<%-- <table class="tablepayment">
							<tbody>
								<tr> 
									<td align="left" style="width: 40%"><span
										class="callHistoryBox1"
										id="currentBalance" name="currentBalance">
											</span></td>
									<td align="left"><span class="callHistoryBox3"
										id="balance" name="balance">
										<table width="100%" border="1" cellpadding="3" cellspacing="0" class="table">
             								<tr>    
                							<td>Serial Number</td>
                							<td>Balance</td>
                							</tr> 
             								 <c:forEach items="${userActiveCardDetails}" var="activeSimList" varStatus="status">
											 
											<tr>    
                							<td>${activeSimList.serialNum}</td>  
                							<td><spring:message code="label.currency" /><fmt:formatNumber value="${activeSimList.balance}" pattern="0.00"/></td>  
                							</tr> 
                							</c:forEach>
											</table></span></td> 
								</tr>  
							</tbody> 
						</table>  --%>  
			
					  
					
					
					<div class="paymentaccepted">
						<ul id="payments" name="payments"> 
							<li id="visa"><a href="#">Visa</a></li> 
							<li id="mastercard"><a href="#">Master Card</a></li>
					 		<li id="amex"><a href="#">Amex</a></li> 				
					 		</ul>  
					</div>
					<div style="clear: both"></div>
					<form:form name="payment" commandName="userDetails" method="post">  
					<div class="col full">
						<div class="accountWhiteBoxTitle">TopUp</div>
						<div style="width: 100%; text-align: center;" 
							id="ctl00_ContentPlaceHolder1_PanelSP">
							<div class="clear separator"></div>
							<table class="tablepayment">
								<tbody>
									<tr> 
									<td><spring:message code="label.activeSimCards" /></td><td><select
											title="Select Polar Wireless Package"
											id="activeSim"
											name="activeSim">
											<c:forEach items="${userActiveCardDetails}" var="activeSimList" varStatus="status">
											<option value="${activeSimList.serialNum}:${activeSimList.balance}">${activeSimList.serialNum}:<spring:message code="label.currency" /><fmt:formatNumber value="${activeSimList.balance}" pattern="0.00"/></option>
											</c:forEach>      
										</select></td> 
										</tr>   
										<tr>  
										<td><spring:message code="label.selectAnAmount" /></td><td><select
											title="Select Polar Wireless Package"
											id="ammountInUSD" 
											onchange="javascript:callTax();"
											name="ammountInUSD"> 
											<option value="-1">Select Amount</option>
											<option value="10.00">Prepaid Mobile Credit $10
													USD</option>
												<option value="20.00">Prepaid Mobile Credit $20
													USD</option> 
												
												<option value="40.00">Prepaid
													Mobile Credit $40 USD</option>
												<option value="80.00">Prepaid Mobile Credit $80
													USD</option> 
												
										</select></td>   
									</tr>  
									<tr>  
								<td><spring:message code="label.selectPayment" /></td> 
											<td><select style="width: 239px;" id="cardType" 
												name="cardType" value="${userDetails.cardType}" onchange="paymentDetails();">
													<option value="1" selected="selected"><spring:message code="label.selectPayment" /></option> 
													<option value="VISA">VISA</option>
													<option value="Mastercard">Mastercard</option>
												<option value="ameX">American Express</option> 
											</select><form:errors path="cardType" cssClass="error" /></td>
										</tr> 
									<tr>  
										<td><span
											style="color: Black; font-size: 0.7em; font-weight: normal;"
											id="ctl00_ContentPlaceHolder1_Label3"></span></td>
									</tr>
								</tbody>
							</table> 
						</div>
						 <div style="width: 100%; text-align: center;" id="paymentMethod" name="paymentMethod"> 
								<table class="tablepayment">
									<tbody>
								
									</tbody>
								</table>  
							</div> 
							<div class="clear separator"></div>
							<div style="clear: both"></div>
							<div id="contentTx5">
				<div class="accountWhiteBoxTitle"><spring:message code="label.paymentDetails" /></div>
				<div class="clear separator"></div>
				<table class="tablepayment">
					<tbody>
						<tr>
							<td>Customer Name</td>
							<td colspan="2" ><input
								type="text" style="width: 240px;"
								id="custName"
								name="custName" value="${userDetails.custName}" required="required" /><form:errors path="custName" cssClass="error" /></td>
						</tr>     
						
												<tr>
							<td >Address1</td>
							<td colspan="2" ><input
								type="text" style="width: 240px;"
								id="address1"
								name="address1" value="${userDetails.address1}" required="required" /></td>
						</tr> 
						
								 				<tr>
							<td >Address2</td>
							<td colspan="2"><input
								type="text" style="width: 240px;"
								id="address2"
								name="address2" value="${userDetails.address2}" required="required"/></td>
						</tr> 
						 
						<tr>  
							<td><spring:message code="label.city" /></td>
							<td colspan="2" ><input
								type="text" style="width: 240px;"
								id="city"
								name="city" value="${userDetails.city}" required="required"/><form:errors path="city" cssClass="error" /></td>
						</tr>
						<tr> 
							<td colspan="2" class="autorefillpaymentcol2"><input
								type="hidden" style="width: 240px;"
								id="phone"
								name="phone" required="required"/></td>
						</tr>
						
						<tr> 
							<td>Email</td>
							<td colspan="2"><input
								type="text" style="width: 240px;"
								id="email"
								name="email" value="${userDetails.email}" required="required"/><form:errors path="email" cssClass="error" /></td>
						</tr>
						<tr>
							<td><spring:message code="label.country" /></td>
							<td colspan="2" ><select
								style="width: 240px;" id="country" 
								name="country" value="${userDetails.country}">
									<option value="1" selected="selected"><spring:message code="label.selectCountry" /></option>
									<option value="251">Abkhazia</option>
									<option value="2">Afghanistan</option> 
									<option value="3">Albania</option>
									<option value="4">Algeria</option>
									<option value="5">American Samoa</option>
									<option value="6">Andorra</option> 
									<option value="7">Angola</option>
									<option value="8">Anguilla</option>
									<option value="9">Antarctica</option>
									<option value="10">Antigua and Barbuda</option>
									<option value="11">Argentina</option>
									<option value="12">Armenia</option>
									<option value="13">Aruba</option>
									<option value="14">Ascension Islands</option>
									<option value="15">Australia</option>
									<option value="16">Austria</option>
									<option value="17">Azerbaijan</option>
									<option value="18">Bahamas</option>
									<option value="19">Bahrain</option>
									<option value="20">Bangladesh</option>
									<option value="21">Barbados</option>
									<option value="22">Belarus</option>
									<option value="23">Belgium</option>
									<option value="24">Belize</option>
									<option value="25">Benin</option>
									<option value="26">Bermuda</option>
									<option value="27">Bhutan</option>
									<option value="28">Bolivia</option>
									<option value="29">Bosnia and Herzegovina</option>
									<option value="30">Botswana</option>
									<option value="31">Bouvet Island</option>
									<option value="32">Brazil</option>
									<option value="33">British Indian Ocean Territory</option>
									<option value="34">Brunei Darussalam</option>
									<option value="35">Bulgaria</option>
									<option value="36">Burkina Faso</option>
									<option value="37">Burundi</option>
									<option value="38">Cambodia</option>
									<option value="39">Cameroon</option>
									<option value="40">Canada</option>
									<option value="41">Cape Verde</option>
									<option value="42">Cayman Islands</option>
									<option value="43">Central African Republic</option>
									<option value="44">Chad</option>
									<option value="45">Chile</option>
									<option value="46">China</option>
									<option value="243">Cocos (Keeling) Islands</option>
									<option value="47">Colombia</option>
									<option value="48">Comoros</option>
									<option value="49">Congo</option>
									<option value="50">Congo, The Democratic Republic</option>
									<option value="51">Cook Islands</option>
									<option value="52">Costa Rica</option>
									<option value="53">Cote D'Ivoire</option>
									<option value="54">Croatia</option>
									<option value="55">Cuba</option>
									<option value="56">Cyprus</option>
									<option value="57">Czech Republic</option>
									<option value="58">Denmark</option>
									<option value="245">Deutsche Telekom</option>
									<option value="241">Diego Garcia</option>
									<option value="59">Djibouti</option>
									<option value="60">Dominica</option>
									<option value="61">Dominican Republic</option>
									<option value="240">East Timor</option>
									<option value="62">Ecuador</option>
									<option value="63">Egypt</option> 
									<option value="64">El Salvador</option>
									<option value="65">Equatorial Guinea</option>
									<option value="66">Eritrea</option>
									<option value="67">Estonia</option>
									<option value="68">Ethiopia</option>
									<option value="70">Falkland Islands (Malvinas)</option>
									<option value="71">Faroe Islands</option>
									<option value="72">Fiji</option>
									<option value="73">Finland</option>
									<option value="74">France</option>
									<option value="75">French Guiana</option>
									<option value="76">French Polynesia</option>
									<option value="77">French Southern Territories</option>
									<option value="78">Gabon</option>
									<option value="79">Gambia</option>
									<option value="80">Georgia</option>
									<option value="81">Germany</option>
									<option value="82">Ghana</option>
									<option value="83">Gibraltar</option>
									<option value="247">Globalstar Network</option>
									<option value="236">Glorioso Islands</option>
									<option value="84">Greece</option>
									<option value="85">Greenland</option>
									<option value="86">Grenada</option>
									<option value="87">Guadeloupe</option>
									<option value="88">Guam</option>
									<option value="89">Guatemala</option>
									<option value="235">Guernsey</option>
									<option value="90">Guinea</option>
									<option value="91">Guinea-Bissau</option>
									<option value="92">Guyana</option>
									<option value="93">Haiti</option>
									<option value="94">Heard Island and McDonald Islands</option>
									<option value="95">Holy See (Vatican City State)</option>
									<option value="96">Honduras</option>
									<option value="97">Hong Kong</option>
									<option value="98">Hungary</option>
									<option value="99">Iceland</option>
									<option value="100">India</option>
									<option value="101">Indonesia</option>
									<option value="102">Iran, Islamic Republic of</option>
									<option value="103">Iraq</option>
									<option value="104">Ireland</option>
									<option value="105">Israel</option>
									<option value="106">Italy</option>
									<option value="107">Jamaica</option>
									<option value="108">Japan</option>
									<option value="109">Jordan</option>
									<option value="248">Karabakh</option>
									<option value="110">Kazakhstan</option>
									<option value="111">Kenya</option>
									<option value="112">Kiribati</option>
									<option value="113">Korea, Democratic People's
										Republic of</option>
									<option value="114">Korea, Republic of</option>
									<option value="115">Kuwait</option>
									<option value="116">Kyrgyzstan</option>
									<option value="117">Lao People's Democratic Republic</option>
									<option value="118">Latvia</option>
									<option value="119">Lebanon</option>
									<option value="120">Lesotho</option>
									<option value="121">Liberia</option>
									<option value="122">Libyan Arab Jamahiriya</option>
									<option value="123">Liechtenstein</option>
									<option value="124">Lithuania</option>
									<option value="125">Luxembourg</option>
									<option value="126">Macau</option>
									<option value="127">Macedonia</option>
									<option value="128">Madagascar</option>
									<option value="129">Malawi</option>
									<option value="130">Malaysia</option>
									<option value="131">Maldives</option>
									<option value="132">Mali</option>
									<option value="133">Malta</option>
									<option value="134">Marshall Islands</option>
									<option value="135">Martinique</option>
									<option value="136">Mauritania</option>
									<option value="137">Mauritius</option>
									<option value="138">Mayotte</option>
									<option value="139">Mexico</option>
									<option value="140">Micronesia, Federated States of</option>
									<option value="252">Midway Islands-Wake Island</option>
									<option value="141">Moldova, Republic of</option>
									<option value="142">Monaco</option>
									<option value="143">Mongolia</option>
									<option value="238">Montenegro</option>
									<option value="144">Montserrat</option>
									<option value="145">Morocco</option>
									<option value="146">Mozambique</option>
									<option value="147">Myanmar</option>
									<option value="148">Namibia</option>
									<option value="149">Nauru</option>
									<option value="150">Nepal</option>			
										<option value="151">Netherlands</option>
									<option value="152">Netherlands Antilles</option>
									<option value="153">New Caledonia</option>
									<option value="154">New Zealand</option>
									<option value="155">Nicaragua</option>
									<option value="156">Niger</option>
									<option value="157">Nigeria</option>
									<option value="158">Niue</option>
									<option value="159">Norfolk Island</option>
									<option value="160">Northern Mariana Islands</option>
									<option value="161">Norway</option>
									<option value="162">Oman</option>
									<option value="163">Pakistan</option>
									<option value="164">Palau</option>
									<option value="165">Palestinian Territory</option>
									<option value="166">Panama</option>
									<option value="167">Papua New Guinea</option>
									<option value="168">Paraguay</option>
									<option value="169">Peru</option>
									<option value="170">Philippines</option>
									<option value="171">Poland</option>
									<option value="172">Portugal</option>
									<option value="173">Puerto Rico</option>
									<option value="174">Qatar</option>
									<option value="175">Reunion</option>
									<option value="176">Romania</option>
									<option value="177">Russian Federation</option>
									<option value="178">Rwanda</option>
									<option value="234">Saint Helena</option>
									<option value="179">Saint Kitts and Nevis</option>
									<option value="180">Saint Lucia</option>
									<option value="253">Saint Martin</option>
									<option value="181">Saint Vincent and the Grenadines</option>
									<option value="182">Samoa</option>
									<option value="183">San Marino</option>
									<option value="184">Sao Tome and Principe</option>
									<option value="185">Saudi Arabia</option>
									<option value="186">Senegal</option>
									<option value="187">Serbia and Montenegro</option>
									<option value="188">Seychelles</option>
									<option value="189">Sierra Leone</option>
									<option value="190">Singapore</option>
									<option value="191">Slovakia</option>
									<option value="192">Slovenia</option>
									<option value="193">Solomon Islands</option>
									<option value="194">Somalia</option>
									<option value="195">South Africa</option>
									<option value="196">Spain</option>
									<option value="197">Sri Lanka</option>
									<option value="239">St Pierre and Miquelon</option>
									<option value="198">Sudan</option>
									<option value="199">Suriname</option>
									<option value="200">Swaziland</option>
									<option value="201">Sweden</option>
									<option value="202">Switzerland</option>
									<option value="203">Syrian Arab Republic</option>
									<option value="204">Taiwan</option>
									<option value="205">Tajikistan</option>
									<option value="206">Tanzania, United Republic of</option>
									<option value="207">Thailand</option>
									<option value="208">Togo</option>
									<option value="209">Tokelau</option>
									<option value="210">Tonga</option>
									<option value="211">Trinidad and Tobago</option>
									<option value="254">Tristan De Cunha</option>
									<option value="212">Tunisia</option>
									<option value="213">Turkey</option>
									<option value="214">Turkmenistan</option>
									<option value="215">Turks and Caicos Islands</option>
									<option value="216">Tuvalu</option>
									<option value="217">Uganda</option>
									<option value="218">Ukraine</option>
									<option value="219">United Arab Emirates</option>
									<option value="220">United Kingdom</option>
									<option value="221">United States</option>
									<option value="223">Uruguay</option>
									<option value="224">Uzbekistan</option>
									<option value="225">Vanuatu</option>
									<option value="242">Vatican City State</option>
									<option value="226">Venezuela</option>
									<option value="227">Vietnam</option>
									<option value="228">Virgin Islands, British</option>
									<option value="229">Virgin Islands, U.S.</option>
									<option value="230">Wallis and Futuna</option>
									<option value="231">Yemen</option>
									<option value="232">Zambia</option>
									<option value="255">Zanzibar</option> 
									<option value="233">Zimbabwe</option>
							</select><div id="stateLoad"><img src='<%=request.getContextPath()%>/resources/images/loading.gif' width="10" hight="10"/>loading...</div><form:errors path="country" cssClass="error" /></td>
						</tr>
							<tr>  
							<td><div id="stateLabel"></div></td>  
							<td><div id="stateId"></div></td></tr>   
								
						<%-- <tr id="stateText"><td><spring:message code="label.state" /></td><td><input
								type="text" style="width: 240px;"
								id="state"
								name="state" required="required"/></td></tr>
						<tr id="stateList"><td><spring:message code="label.state" /></td>
						<td><select
								style="width: 240px;" 
								id="state"  
								name="state">
								<c:forEach items="${stateList}" var="stateList">
									<option value="BC" selected="selected">BC</option>
									</c:forEach>							
									</select></td></tr>  --%>
						
						<tr> 
							<td>Postal Code</td>
							<td><input
								type="text" style="width: 240px;"
								id="postalCode" 
								name="postalCode" value="${userDetails.postalCode}" /><span
								style="color: Red; visibility: hidden;"
								id="ctl00_ContentPlaceHolder1_RequiredFieldValidator4">*</span><form:errors path="postalCode" cssClass="error" /></td>
						 
						</tr>
						<tr><td></td><td><div id="loading"><img src='<%=request.getContextPath()%>/resources/images/loading.gif' width="25" hight="25"/><br></br>loading...</div></td></tr> 
						</tbody>
						</table>
						
						<div id="taxTable"></div> 
						<div class="clear separator"></div>
						<div class="accountWhiteBoxTitle"><spring:message code="label.CreditCard" /></div>
						<div class="clear separator"></div>
						<table class="tablepayment" >
					<tbody>
						<tr>
							<td ><spring:message code="label.creditCardNo" /></td>
							<td ><input type="text"
								style="width: 240px;"
								id="creditCardNo"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
								name="creditCardNo"/><form:errors path="creditCardNo" cssClass="error" /><br/></>Please enter credit card no without spaces or dashes<span 
								style="color: OrangeRed; display: none;"
								id="ctl00_ContentPlaceHolder1_rev_ccReq"/> <input
									type="hidden"
									id="ctl00_ContentPlaceHolder1_vce_rev_ccReq_ClientState"
									name="ctl00$ContentPlaceHolder1$vce_rev_ccReq_ClientState"/></td>
						</tr>
						<tr> 
							<td><spring:message code="label.expiryDate" /></td>
							<td ><select
								style="width: 50px;"
								id="expiryDateMM" 
								name="expiryDateMM">
									<option value="01" selected="selected">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
							</select> &nbsp;/&nbsp; <select style="width: 70px;"
								id="expiryDateYY"
								name="expiryDateYY">
									<option value="2009">2009</option>
									<option value="10" selected="selected">2010</option>
									<option value="11">2011</option>
									<option value="12">2012</option>
									<option value="13">2013</option>
									<option value="14">2014</option>
									<option value="15">2015</option>
									<option value="16">2016</option>
									<option value="17">2017</option>
									<option value="18">2018</option>
									<option value="19">2019</option>
									<option value="20">2020</option>
									<option value="21">2021</option>
									<option value="22">2022</option>
							</select></td>
						</tr>
						<tr>
							<td><spring:message code="label.cvv" /></td>
							<td ><input
								type="text" style="width: 60px;"
								id="cvvCode"  
								name="cvvCode" maxlength="3"/><form:errors path="cvvCode" cssClass="error" /> <span 
									style="color: OrangeRed; display: none;"
									id="ctl00_ContentPlaceHolder1_rv_CVV2"/> <input
									type="hidden"
									id="ctl00_ContentPlaceHolder1_vce_rv_CVV2_ClientState"
									name="ctl00$ContentPlaceHolder1$vce_rv_CVV2_ClientState"/>
										<img width="18" src="../images/ratesQuestion.png"
										class="autorefilquest" alt=""/>
											<div style="display: none;" class="msg_body2">
												<div id="autorefillinfoBox1">
													<div>
														<img width="341" height="134" src="../images/cv_card1.jpg"
															alt=""/>
													</div>
												</div>
											</div></td>
						</tr>
						<tr>  
							<td>Create 4 Digit PIN</td>
							<td><input
								type="text" style="width: 240px;"
								id="pin"
								name="pin"/><form:errors path="pin" cssClass="error" /></td>
						</tr> 
						<tr> 
							<td>Re-Enter PIN</td>
							<td><input
								type="text" style="width: 240px;"
								id="rePin"
								name="rePin"/><form:errors path="rePin" cssClass="error" /></td>
						</tr>
						
						 <tr>
						 <td></td>
						 <td >
						<input type="checkbox" name="makedefault" 
								id="makedefault" ></input><spring:message code="label.makedefault" /></label>
						 </td>
						 </tr>
					</tbody>
				</table> 
				
				<div id="contentTx4">
				<div class="content">
					<div style="margin-left:20px; vertical-align:center;">
						<span> <span style="font-size: 0.8em;"> <input 
								type="checkbox" name="acceptTermsConditions"
								id="acceptTermsConditions" class="required" /> <label 
								for="acceptTermsConditions"><spring:message code="label.termsAndConditions" /></label></span>
						</span>
						<div></div> 
					</div> 
					<div class="clear separator"></div>
					 <div id="auorefillSaveChangesBt">
						<input type="button" class="blue-button" value="Submit"
							hidefocus="true" id="ctl00_ContentPlaceHolder1_ib_autorefill"
							name="ctl00$ContentPlaceHolder1$ib_autorefill" onclick="javascript:makePayment()" />
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="blue-button" value="Cancel"
							hidefocus="true" id="useDiffCard"
							name="useDiffCard" onclick="javascript:cancel()"  />
							   
					</div> 
					 
					
					</div>     
					<input type="hidden" name="makeDefaultSet" id="makeDefaultSet"></input>
					<input type="hidden" name="PST" id="PST"></input>
					<input type="hidden" name="GST" id="GST"></input>
					<input type="hidden" name="HST" id="HST"></input>
					<input type="hidden" name="totalTAX" id="totalTAX"></input>
					<input type="hidden" name="totalAmount" id="totalAmount"></input>
					</form:form>  
					  </c:otherwise>
				</c:choose> 
				</div> 
			</div>

			</div> 			
					</div> 
					
					
					<!--  
					<div class="col lesshalf">
						<div class="accountWhiteBoxTitle"><spring:message code="label.transaction" /></div>
						<div style="width: 100%;" xmlhttp.responseText
							id="transaction" name="transaction">
							<table class="tablepayment">
								<tbody>
									<tr style="visibility: hidden; display: none;">
										<td align="left" style="width: 50%"><spring:message code="label.productDescription" />
										</td>
										<td class="label"><span class="label"
											id="ctl00_ContentPlaceHolder1_lbl_Decsription"><spring:message code="label.prepaidMCr" /></span></td>
									</tr>
									<tr> 
										<td align="left"><spring:message code="label.amountCAD" /></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_Price"></span></td>
									</tr>
									<tr>
										<td align="left" style="width: 50%"><spring:message code="label.GST" /></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_gst"></span></td>
									</tr>
									<tr>
										<td align="left" style="width: 50%"><spring:message code="label.PST" /></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_pst"></span></td>
									</tr>
									<tr> 
										<td align="left" style="width: 50%"><spring:message code="label.HST" /></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_hst"></span></td>
									</tr> 
									<tr>
										<td align="left" style="width: 50%"><spring:message code="label.transFee" /></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_fee"></span></td>
									</tr>
									<tr style="visibility: hidden; display: none;">
										<td align="left" style="width: 50%"><spring:message code="label.Shipping" /></td>
										<td><span class="label"
											id="ctl00_ContentPlaceHolder1_lbl_shipping"></span></td>
									</tr>
									<tr>
										<td align="left" style="width: 50%"><spring:message code="label.total" /></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_total"></span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="clear: both"></div>
					</div>
					
					-->
					<div style="clear: both"></div>
				</div>
			</div>
		
			
	<div style="clear: both"></div>
 
</div>  
<div id="rightmenu">  
	<tiles:insertAttribute name="rightmenu" />
</div> 
</div> 
</div>
</body>
</html>
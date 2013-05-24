<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script> 
<script>
$(document).ready(function() {
	
    $("#country").change(function() {
	$.ajax({
    type: "Get",
   data:{val1:$(this).val()},
    url: "mySIMPhone.htm",   
       success: function(data){
      
        $("#prefix").val(data);
     }
    
    }); 
    });
}); 


</script>
<style> 
.error { 
color: #ff0000; 
font-style: italic;
}
</style> 
</head> 
<body>  
<div id="container" class="full-width">
<div id="header">
	<div id="headerTitle"><tiles:insertAttribute name="header" /></div>
</div>  
    <div id="accountContent2">
      <div id="contentTitle"><span class="title"><spring:message code="label.title"/></span></div>
      
      <div id="contentTx4">
        <div class="head"><spring:message code="label.addPolarSim"/></div>
        <div class="content">
          <div class="myRegisterbutton">
            <div id="ctl00_ContentPlaceHolder1_AddNewPanel">
              <div id="ctl00_ContentPlaceHolder1_UpdatePanel2">
              <form:form action="activateCard.htm" commandName="activateCard"> 
                <table  class="tablepayment">
                  <tbody>   
                    <tr>  
                      <td width="40%">
                      	<span id="ctl00_ContentPlaceHolder1_LabelSN"><spring:message code="label.serialNo"/>&nbsp;&nbsp;</span>
                      </td>
                      <td width="60%">
                      	<input type="text" style="width:200px;" id="serialNo" name="serialNo" value="${userActivateCardForm.serialNo}" class="validate[requireds] text-input"><form:errors path="serialNo" cssClass="error" />
                        <span style="color:Red;visibility:hidden;" id="ctl00_ContentPlaceHolder1_SerialNumberRequired">*</span>
                       </td>
                   
                     <tr> 
                      <td width="40%">
                      	<span id="ctl00_ContentPlaceHolder1_LabelSN"><spring:message code="label.email"/>&nbsp;&nbsp;</span>
                      </td>
                      <td width="60%">
                      	<input type="text" style="width:200px;" id="email" name="email" class="validate[requireds] text-input" value="${email}" readonly="readonly"><form:errors path="email" cssClass="error" />
                        <span style="color:Red;visibility:hidden;" id="ctl00_ContentPlaceHolder1_SerialNumberRequired">*</span>
                       </td>
                   
                     </tr>
                     <tr>
	                    <td width="40%">
							<span id="ctl00_ContentPlaceHolder1_LabelCntry"><spring:message code="label.selectCountry"/>&nbsp;&nbsp;</span>
						</td>
							
						<td width="60%"><select
							style="width: 240px;" id="country" 
							name="country" class="validate[requireds]">
								<option value="1" selected="selected">Select Country</option>
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
								<optionaddPolarSim value="107">Jamaica</option>
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
								<option value="203">Syrian Arab Republic</option>ctl00_ContentPlaceHolder1_ddl_country
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
						</select><form:errors path="country" cssClass="error" /></td>
					
                     </tr>
                     <tr> 
                      <td width="40%">
                      	<span id="ctl00_ContentPlaceHolder1_LabelSN"><spring:message code="label.mobileNo"/>&nbsp;&nbsp;</span>
                      </td>
                      <td width="60%"> 
                      	<input type="text" style="width:40px;" id="prefix" name="prefix"  class="validate[requireds] text-input" readonly="readonly">&nbsp;&nbsp;&nbsp;<input type="text" style="width:200px;" id="mobileNo" name="mobileNo" value="${userActivateCardForm.mobileNo}" class="validate[requireds] text-input"><form:errors path="mobileNo" cssClass="error" />
                       <!--  <span style="color:Red;visibility:hidden;" id="ctl00_ContentPlaceHolder1_SerialNumberRequired">*</span> -->
                       </td>
                    </tr>   <tr><td>&nbsp;</td><td>Ctry code &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone Number</td>
                    
                    
                    <tr>
                      <td style="text-align: center;" colspan="6"><span style="color:Red;font-size:0.7em;font-weight:bold;visibility:hidden;" id="ctl00_ContentPlaceHolder1_cv_sn"></span></td>
                    </tr>
                  </tbody>
                </table>
              
                
                <center>
                  <input type="submit" class="blue-button" value="<spring:message code="label.activateCard"/>" onclick="return doValidations();" name="ctl00$ContentPlaceHolder1$btn_add">
                </center>
              </div> 
            </div> 
              </form:form> 
            <div style="display:none;" id="ctl00_ContentPlaceHolder1_UpdateProgress1">
              <div style="border-right: black 1px solid; border-top: black 1px solid; left: 50%;

                                        border-left: black 1px solid; width: 100px; color: white; border-bottom: black 1px solid;

                                        position: absolute; top: 30%; height: 60px; background-color: white; background-position: center center;

                                        background-image: url(../Images/ajax-loader_green.gif); text-align: center; background-repeat: no-repeat;"> </div>
            </div>
          </div>
        </div>
    </div>
    <div id="contentTx4">
        <div class="head">Activated Roamly SIM</div>
        <div class="content">
    <table border="0" width="100%" cellspacing="0" cellpadding="5"
					class="table">
					<thead>
						<tr> 
							<td>Serial No</td>
							<td>Balance</td>
							<td>Activation Date</td>
						</tr>
					</thead>  
					<c:forEach items="${phoneDetails}" var="phoneDetails"
						varStatus="status" end="10"> 
						<tbody> 
							<tr> 
								<td><c:out value="${phoneDetails.serialNum}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><spring:message code="label.currency" /><fmt:formatNumber value="${phoneDetails.balance}" pattern="0.00"/> 
										</td> 
								<td><c:out value="${phoneDetails.activationDate}" 
								 		default="Not Available" escapeXml="false"></c:out></td>
								
								<%--<td><c:out value="${callHistory.callLength1Dst}" 
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.rate}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.sourcePhone}"
										default="Not Available" escapeXml="false"></c:out></td>
					 --%>		</tr>
						</tbody>
					</c:forEach>
				</table> </div> </div> 
    <div style="clear:both"></div> 
    </div>
  <div id="rightmenu">   
	<tiles:insertAttribute name="rightmenu" />
</div>  
</div>
<script>
var countryArray = new Array('195','15','227','16','58','67','73','118','124','177','196','201','202','220','40','139','221','166');
function doValidations(){
	
	 
	if($("#serialNo").val().trim()==''){
		alert('<spring:message code="label.serialNo"/> cannot be blank');
		$("#serialNo").focus();
		return false;
	}
	
	if($("#country").val().trim()=='1'){
		alert('Please <spring:message code="label.selectCountry"/>');
		$("#country").focus();
		return false; 
	}
	var value = $("#country").val();
 var index = $.inArray(value,countryArray);
	if(index==-1){
		alert('Incoming calls to home number will not work while roaming');
		return false;
	} 
	  
	
 if($("#mobileNo").val().trim()==''){
		alert('<spring:message code="label.mobileNo"/> cannot be blank');
		$("#mobileNo").focus();
		return false;
	}  
} 
</script>
</body> 
</html>  

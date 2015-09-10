<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/NAPopulation.css" />" />
<script src="<c:url value="/js/user.js"/>"></script>
<script>

$(document).ready(function() {
$country = $("select[name='country']");
$state = $("select[name='state']");
$city = $("select[name='city']");
 
$country.change(function() {
 
if ($(this).val() == "United States") {
$("select[name='state'] option").remove();
$("<option>Please select</option>").appendTo($state);
$("<option>Texas</option>").appendTo($state);
$("<option>California</option>").appendTo($state);
$("<option>Pennsylvania</option>").appendTo($state);
$("<option>New York</option>").appendTo($state);
}
 
if ($(this).val() == "Canada") 
{
$("select[name='state'] option").remove();
$("<option>Please select</option>").appendTo($state);
$("<option>British Columbia</option>").appendTo($state);
}

if ($(this).val() == "") 
{
$("select[name='state'] option").remove();
$("<option>Please select</option>").appendTo($state);
}

$state.change(function() {
	 
	if ($(this).val() == "Texas") {
	$("select[name='city'] option").remove();
	$("<option>Houston</option>").appendTo($city);
	$("<option>Austin</option>").appendTo($city);
	$("<option>San Antonio</option>").appendTo($city);
	$("<option>Corpus Christie</option>").appendTo($city);
	}
	 
	if ($(this).val() == "California") 
	{
	$("select[name='city'] option").remove();
	$("<option>LA</option>").appendTo($city);
	$("<option>San Francisco</option>").appendTo($city);
	$("<option>San Diego</option>").appendTo($city);
	}
	
	if ($(this).val() == "Pennsylvania") 
	{
	$("select[name='city'] option").remove();
	$("<option>Philadelphia</option>").appendTo($city);
	$("<option>Pittsburg</option>").appendTo($city);
	$("<option>Harrisburg</option>").appendTo($city);
	}
	
	if ($(this).val() == "New York") 
	{
	$("select[name='city'] option").remove();
	$("<option>New York</option>").appendTo($city);
	$("<option>Manhattan</option>").appendTo($city);
	}
	
	if ($(this).val() == "British Columbia") 
	{
	$("select[name='city'] option").remove();
	$("<option>Vancouver</option>").appendTo($city);
	$("<option>Victoria</option>").appendTo($city);
	}

	if ($(this).val() == "") 
	{
	$("select[name='city'] option").remove();
	$("<option>Please select</option>").appendTo($city);
	}
	 
	});
 
});


});
</script>
    <title>NA Population Form</title>
</head>
<body>

<h2 style="color: red">Enter your Record</h2>
<form:form method="POST" action="/NAPopulation/addUser" id="userForm">
   <table>
    <tr>
        <td class="title"><form:label path="fname">First Name:</form:label></td>
        <td class="input"><form:input path="fname" /></td>
    </tr>
    <tr>
        <td class="title"><form:label path="lname">Last Name:</form:label></td>
        <td class="input"><form:input path="lname" /></td>
    </tr>
    <tr>
        <td class="title"><form:label path="gender">Gender:</form:label></td>
        <td class="input"><form:radiobutton path="gender" value="Male"/> Male <form:radiobutton path="gender" value="Female"/> Female </td>
    </tr>
    <tr>
        <td class="title"><form:label path="fLineAddr">First Line Address:</form:label></td>
        <td class="input"><form:input path="fLineAddr" /></td>
    </tr>
    <tr>
        <td class="title"><form:label path="city">City:</form:label></td>
        <td class="input"><form:select path="city">
        <form:option value="">Please Select</form:option>
        </form:select></td>
    </tr>
    <tr>
        <td class="title"><form:label path="state">State:</form:label></td>
        <td class="input"><form:select path="state">
        <form:option value="">Please Select</form:option>
        </form:select></td>
    </tr>
    <tr>
        <td class="title"><form:label path="country">Country:</form:label></td>
        <td class="input">
        <form:select path="country">
            <form:option value="">Please Select</form:option> 
        	<form:option value="United States">United States</form:option> 
        	<form:option value="Canada">Canada</form:option>
        </form:select>
        </td>
    </tr>
    <tr>
        <td class="title"><form:label path="zipCode">ZipCode:</form:label></td>
        <td class="input"><form:input path="zipCode" /></td>
    </tr>  
    <tr>
        <td class="title"><form:label path="passportNumber">Passport number:</form:label></td>
        <td class="input"><form:input path="passportNumber" /></td>
    </tr> 
    <tr>
        <td class="title"><form:label path="dob">Date Of Birth (mm/dd/yyyy): </form:label></td>
        <td class="input"><form:input path="dob"/></td>
    </tr> 
    <tr>
        <td class="title"><form:label path="hhi">Annual House Hold Income</form:label></td>
        <td class="input">
        <form:select path="hhi">
        	<form:option value="1">Less than $40,000</form:option>
        	<form:option value="2">$40,000 &#60; $80000</form:option>
        	<form:option value="3">$80,000 &#60; $100,000</form:option>
        	<form:option value="4">More than $100,000</form:option>
        </form:select>
        </td>
    </tr>
    <tr></tr><tr></tr>             
    <tr>
        <td colspan="2">
            <input id="btn1" type="submit" value="Submit" class="buttonstyle"/>
        </td>
    </tr>
</table>
</form:form>
<h2 style="color: red">Search Records</h2>
<form:form method="GET" action="/NAPopulation/search"> 
<table>
    <tr>
        <td colspan="2">
            <input id="btn2" type="submit" value="Search" class="buttonstyle"/>
        </td>
    </tr>
</table> 
</form:form>
</body>
</html>


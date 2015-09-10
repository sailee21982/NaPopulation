<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/NAPopulation.css" />" />
<script src="<c:url value="/js/user.js"/>"></script>
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
        <td class="input"><form:input path="city" /></td>
    </tr>
    <tr>
        <td class="title"><form:label path="state">State:</form:label></td>
        <td class="input"><form:input path="state" /></td>
    </tr>
    <tr>
        <td class="title"><form:label path="country">Country:</form:label></td>
        <td class="input">
        <form:select path="country">
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


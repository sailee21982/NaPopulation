<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/NAPopulation.css" />" />
    <title>NA Population Form</title>
</head>
<body>

<h2 style="color: red">Record Successfully Created</h2>
   <table>
    <tr>
        <td class="title">First Name:</td>
        <td class="input">${fname}</td>
    </tr>
    <tr>
        <td class="title">Last Name:</td>
        <td class="input">${lname}</td>
    </tr>
    <tr>
        <td class="title">Gender:</td>
        <td class="input">
		<c:choose>
		    <c:when test="${gender == null}">
		       Not Specified
		    </c:when>
		    <c:otherwise>
		        ${gender}
		    </c:otherwise>
		</c:choose>
		</td>
    </tr>
    <tr>
        <td class="title">First Line Address:</td>
        <td class="input">${fLineAddr}</td>
    </tr>
    <tr>
        <td class="title">City:</td>
        <td class="input">${city}</td>
    </tr>
    <tr>
        <td class="title">State:</td>
        <td class="input">${state}</td>
    </tr>
    <tr>
        <td class="title">Country:</td>
        <td class="input">${country}</td>
    </tr>
    <tr>
        <td class="title">Zip Code:</td>
        <td class="input">${zipCode}</td>
    </tr>
    <tr>
        <td class="title">Passport Number:</td>
        <td class="input">${passportNumber}</td>
    </tr>
    <tr>
        <td class="title">Date Of Birth:</td>
        <td class="input">${dob}</td>
    </tr>
    <tr>
        <td class="title">Annual House Hold Income:</td>
        <td class="input">${hhi}</td>
    </tr>
    
</table>  
</body>
</html>
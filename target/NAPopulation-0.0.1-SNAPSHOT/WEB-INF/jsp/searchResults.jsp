<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NAPopulation.css" />
<title>NA Population Search Results</title>
</head>
<body>
<h2 style="color: red">Search Results</h2>
   <table>
    <tr>
        <td class="title">First Name:</td>
        <td class="input">${firstName}</td>
    </tr>
    <tr>
        <td class="title">Gender:</td>
        <td class="input">${gender}</td>
    </tr>
    <tr>
        <td class="title">Passport Number:</td>
        <td class="input">${passportNumber}</td>
    </tr>
    </table>
	<table class="table">
    <tr>
        <th class="th">First Name</th>
        <th class="th">Last Name</th>
        <th class="th">City</th>
        <th class="th">State</th>
	    <th class="th">Country</th>
	    <th class="th">Zip Code</th>
	    <th class="th">Passport Number</th>
    </tr>
<c:forEach var="user" items="${usersAl}">
<tr>
    <td class="td">${user.fname}</td>
    <td class="td">${user.lname}</td>
    <td class="td">${user.city}</td>
    <td class="td">${user.state}</td>
    <td class="td">${user.country}</td>
    <td class="td">${user.zipCode}</td>
    <td class="td">${user.passportNumber}</td>
</tr>
</c:forEach>
    </table>
</body>
</html>
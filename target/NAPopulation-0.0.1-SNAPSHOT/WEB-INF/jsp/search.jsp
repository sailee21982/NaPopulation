<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NAPopulation.css" />
<title>NA Population Search</title>
</head>
<body>
<h2 style="color: red">Search Records</h2>
<form:form method="POST" action="/NAPopulation/searchUsers" id="searchForm">
   <table>
    <tr>
        <td class="title"><form:label path="firstName">First Name:</form:label></td>
        <td class="input"><form:input path="firstName" /></td>
    </tr>
    <tr>
        <td class="title"><form:label path="passportNumber">Passport Number:</form:label></td>
        <td class="input"><form:input path="passportNumber" /></td>
    </tr>
     <tr>
        <td class="title"><form:label path="gender">Gender:</form:label></td>
        <td class="input"><form:input path="gender" /></td>
    </tr>
    <tr>
        <td colspan="2">
            <input id="searchbtn" type="submit" value="Submit" class="buttonstyle"/>
        </td>
    </tr>
    </table>
</form:form>
</body>
</html>
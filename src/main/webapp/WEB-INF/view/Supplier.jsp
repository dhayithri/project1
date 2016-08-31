<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Suppler</title>
</head>
<body>
<c:url var="action" value="addsupplier"></c:url>
<form:form  action="${action}" commandName="supplier">
Id:<form:input path="id"/>
<br>
Name:<form:input path="name"/>
<br>
Address:<form:input path="address"/>
<br>
<input type="submit" value="Add" />
</form:form>

<c:url var="deleteaction" value="deletesupplier"></c:url>	
<form:form  action="${deleteaction}" commandName="supplier">
Id:<form:input path="id"/>
<br>
<input type="submit" value="Delete" />
</form:form>

        <c:forEach items="${supplierList}" var="supplier">
		<c:out value="${supplier.id}"/>
		<c:out value="${supplier.name}"/>
		<c:out value="${supplier.address}"/>
		</c:forEach>
		
<c:url var="updateaction" value="updatesupplier"></c:url>	
<form:form  action="${updateaction}" commandName="supplier">
Id:<form:input path="id"/>
<br>
Name:<form:input path="name"/>
<br>
Address:<form:input path="address"/>
<br>
<input type="submit" value="Update" />
</form:form>
<br>
 <style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
</style>


<table style="width:100%">
<tr>
<th>Supplier ID</th>
<th>Supplier Name</th>
<th>Supplier Address</th>
<th>Update</th>
<th>Delete</th>
</tr>

<tbody>
<c:forEach items="${supplierList}" var="supplier">
 <tr>
<td><c:out value="${supplier.id }"/></td>
<td><c:out value="${supplier.name }"/></td>
<td><c:out value="${supplier.address}"/></td>
<td><a href ="additsupplier/${supplier.id}"/>update</td>
<td><a href ="adddeletesupplier${supplier.id}"/>delete</td>
    
</tr>
</c:forEach>
  
  
   </tbody>
</table>
</body>
</html>
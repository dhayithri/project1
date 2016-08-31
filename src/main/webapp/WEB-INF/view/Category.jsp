<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
</head>
<body>

<c:url var="action" value="addcategory"></c:url>
<form:form  action="${action}" commandName="category">
Id:<form:input path="id"/>
<br>
Name:<form:input path="name"/>
<br>
Description:<form:input path="description"/>
<br>
<input type="submit" value="Add" />
</form:form>

<c:url var="deleteaction" value="deletecategory"></c:url>	
<form:form  action="${deleteaction}" commandName="category">
Id:<form:input path="id"/>
<br>
<input type="submit" value="Delete" />
</form:form>

        <c:forEach items="${categoryList}" var="category">
		<c:out value="${category.id}"/>
		<c:out value="${category.name}"/>
		<c:out value="${category.description}"/>
		</c:forEach>
		
<c:url var="updateaction" value="updatecategory"></c:url>	
<form:form  action="${updateaction}" commandName="category">
Id:<form:input path="id"/>
<br>
Name:<form:input path="name"/>
<br>
Description:<form:input path="description"/>
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
<th>Category ID</th>
<th>Category Name</th>
<th>Category Description</th>
<th>Update</th>
<th>Delete</th>
</tr>

<tbody>
<c:forEach items="${categoryList}" var="category">
 <tr>
<td><c:out value="${category.id }"/></td>
<td><c:out value="${category.name }"/></td>
<td><c:out value="${category.description }"/></td>
<td><a href ="additcategory/${category.id}"/>update</td>
<td><a href ="adddeletecategory${category.id}"/>delete</td>
    
</tr>
</c:forEach>
  
   </tbody>
</table>
</body>
</html>
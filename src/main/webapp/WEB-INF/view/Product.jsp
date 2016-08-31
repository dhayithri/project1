<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
</head>
<body>

<c:url var="action" value="addproduct"></c:url>
<form:form  action="${action}" commandName="product">
Id:<form:input path="id"/>
<br>
Name:<form:input path="name"/>
<br>
Price:<form:input path="price"/>
<br>
<input type="submit" value="Add" />
</form:form>

<c:url var="deleteaction" value="deleteproduct"></c:url>	
<form:form  action="${deleteaction}" commandName="product">
Id:<form:input path="id"/>
<br>
<input type="submit" value="Delete" />
</form:form>

        <c:forEach items="${productList}" var="product">
		<c:out value="${product.id}"/>
		<c:out value="${product.name}"/>
		<c:out value="${product.price}"/>
		</c:forEach>
		
<c:url var="updateaction" value="updateproduct"></c:url>	
<form:form  action="${updateaction}" commandName="product">
Id:<form:input path="id"/>
<br>
Name:<form:input path="name"/>
<br>
Price:<form:input path="price"/>
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
<th>Product ID</th>
<th>Product Name</th>
<th>Product Price</th>
<th>Update</th>
<th>Delete</th>
</tr>

<tbody>
<c:forEach items="${productList}" var="product">
 <tr>
<td><c:out value="${product.id }"/></td>
<td><c:out value="${product.name }"/></td>
<td><c:out value="${product.price}"/></td>
<td><a href ="additproduct/${product.id}"/>update</td>
<td><a href ="adddeleteproduct${product.id}"/>delete</td>
    
</tr>
</c:forEach>
  
  
   </tbody>
</table>

</body>
</html>
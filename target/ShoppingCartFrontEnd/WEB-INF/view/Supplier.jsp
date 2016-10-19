<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stymaxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier</title>
 <style>
 h3{
    text-align: center;
    }
 table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: purple;
    color: white;
}
<!-----table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}----->
</style>
</head>
 
<body>

	<!----<c:url var="action" value="addsupplier"></c:url>
	<form:form action="${action}" modelAttribute="supplier">
ID:<form:input path="id" />
Name:<form:input path="name" />
Address:<form:input path="address" />

		<input type="submit" name="add" value="Add" />
</form:form>

<c:url var="deleteaction" value="deletesupplier"></c:url>
<form:form action="${deleteaction}" modelAttribute="supplier2">
		ID:<form:input path="id"/>
		<input type="submit" value="Delete">
</form:form>--->
<h3>Supplier</h3><br>
${msg1}
      <c:url var="updateaction" value="updatesupplier"></c:url>
<form:form action="${updateaction}" modelAttribute="supplier1">
	    ID:<form:input path="id"/>
		Name:<form:input path="name" />
        Address:<form:input path="address" /> 
        Product:<form:input path="product"/>
       
		<input type="submit" value="Edit">
</form:form>
<br>
<!---${msg}
<div align="center">
<table style="width:80%">
<caption>Supplier</caption>
<thead>--->
<table style="width:100%">
<thead>
<tr>
<th>Supplier Id</th>
<th>Supplier Name</th>
<th>Supplier Address</th>
<th>Supplier Product</th>
<th>Edit</th>
<th>Delete</th>
</tr>
</thead>
<tbody>
<c:forEach items="${supplierList}" var ="supplier">
<tr>
<td><c:out value="${supplier.id}"/>
<td><c:out value="${supplier.name}"/>
<td><c:out value="${supplier.address}"/>
<td><c:out value="${supplier.product}"/>
<td><a href="addupdatesupplier/${supplier.id }"class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-edit"></span> Edit
        </a>
<td><a href="adddeletesupplier/${supplier.id }"class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-trash"></span> Delete
        </a>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html> 
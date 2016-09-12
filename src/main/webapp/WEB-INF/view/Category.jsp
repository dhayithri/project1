<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<!----table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}----->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
</head>
<body>
<h3>Category</h3><br>
<!------<c:url var="action" value="addcategory"></c:url>
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
		</c:forEach>---->
		
 <c:url var="updateaction" value="updatecategory"></c:url>
<form:form action="${updateaction}" modelAttribute="category">
	    ID:<form:input path="id"/>
		Name:<form:input path="name" />
      Description:<form:input path="description" /> 
		<input type="submit" value="Edit">
</form:form>
<br>
<table style="width:100%">
<tr>
<th>Category ID</th>
<th>Category Name</th>
<th>Category Description</th>
<th>Edit</th>
<th>Delete</th>
</tr>

<tbody>
<c:forEach items="${categoryList}" var="category">
 <tr>
<td><c:out value="${category.id }"/></td>
<td><c:out value="${category.name }"/></td>
<td><c:out value="${category.description }"/></td>
<td><a href ="addupdatecategory/${category.id}"class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-edit"></span> Edit
        </a>
<td><a href ="adddeletecategory/${category.id}"class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-trash"></span> Delete
        </a>
    
</tr>
</c:forEach>
  
   </tbody>
</table>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Page</title>
<style>
body {
    background-image: url("C:\Users\majjipoojihta\Desktop\dha3\85.jpg");
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
</style>
</head>
<body>
<h1>Your Shopping</h1>
${emptycart}

<table style="width:100%">
<tr>

<th>Product Name</th>
<th>Quantity</th>
<th>Price</th>
<th>Delete</th>
</tr>

<c:forEach items="${cartList}" var ="cart">
<tr>

<td><c:out value="${cart.productname}"/>

<td><c:out value="${cart.quantity }"/>
<td><c:out value="${cart.price }"/>
<td><a href="delete/${cart.id}"class="btn btn-info btn-lg">
<span class="glyphicon glyphicon-trash"></span> Delete</a>
<br>       
</tr> 

</c:forEach>

</table>


<%-- 
<tbody>
<c:forEach items="${cartList }" var="cart">
Product:<c:out value="${cart.productname }"/><br>
Price:Rs.<c:out value="${cart.price }"/><br>
<a href="delete/${cart.id}">delete</a><br>
quantity:<c:out value="${cart.quantity }"></c:out>
<hr>
Total Price:
</c:forEach>
   </tbody>
   </table> --%>

				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-3">
							<a href="" class="btn btn-info btn-sm btn-block">Continue Shopping</a></div>
							
						 <div class="col-xs-6">
							<h4 class="text-right">Total Price: Rs ${CartPrice}</h4>
						</div>
						<form action="placeorder">
						<div  class="col-xs-3">
							<button type="submit" class="btn btn-info btn-block">
								Payment
							</button>
						</div>
						</form>
					</div>
</div>

</body>
</html>
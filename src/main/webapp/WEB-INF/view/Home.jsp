<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>
</head>
<body>
<h2>Welcome to shopping cart</h2>

${message}  <br>
 
<a href="Login" > Login Here </a>
<a href="Registration" > New User</a>
<a href= "Supplier">Supplier</a>
<a href="Product" >Product</a>
<a href="Category" >Category</a>
<hr color ="green">

<!-- <c:if test="${userClickedRegisterHere} ==true">
<jsp:include page="Registration.jsp"></jsp:include>
</c:if>

<c:if test="${userClickedLoginHere} ==true">
<jsp:include page="Login.jsp"></jsp:include>
</c:if>-->
<c:choose>
<c:when test="${UserClickedsupplier}">
<c:import url="/WEB-INF/view/Supplier.jsp"></c:import>
</c:when>
</c:choose>

 
<c:choose>
<c:when test="${userClickedProduct} ">
<c:import url="/WEB-INF/view/Product.jsp"></c:import>
</c:when>
</c:choose> 
</body>
</html>
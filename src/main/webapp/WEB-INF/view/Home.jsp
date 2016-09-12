<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
<title>Shopping Cart</title>
 
</head>
<body background="C:\Users\majjipoojihta\Desktop\dha3\85.jpg" ng-app="myApp">
<h1>Welcome to ShoppingCart</h1>
 <body>

<nav class="navbar navbar-inverse">

  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><p>ShoppingCart <span class="glyphicon glyphicon-shopping-cart"></span></p></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#"><p>Home<span class="glyphicon glyphicon-home"></span></p></a></li>
    <li><a href="Login"><p>Login <span class="glyphicon glyphicon-log-in"></span></p></a></li>
      <li><a href="Registration"><p>Registration<span class="glyphicon glyphicon-edit"></span></p></a></li>
      <li><a href="#">About Us</a></li>
 <li><a href="#"> <p>Contact Us<span class="glyphicon glyphicon-phone"></span></p></a></li>
<li><a href="#">Today's Offers</a></li>

    </ul>
  </div>
</nav>
 
</body>
      
${message}  <br>
 <h3>
<!--<p><a href="Login" ></a></p>
<a href="Registration" >Register Here</a></h3>--->

<a href="Admin">Admin</a>
<hr color ="black">


<%-- <c:if test="${userClickedRegisterHere} ==true">
<jsp:include page="Registration.jsp"></jsp:include>
</c:if> --%>


<!--<c:if test="${userClickedLoginHere} ==true">
<jsp:include page="Login.jsp"></jsp:include>
</c:if>-->

<!--   <c:choose>
<c:when test="${UserClickedsupplier}">
<c:import url="/WEB-INF/view/Supplier.jsp"></c:import>
</c:when>
</c:choose>
 
<c:choose>
<c:when test="${UserClickedcategory}">
<c:import url="/WEB-INF/view/Category.jsp"></c:import>
</c:when>
</c:choose> 
<c:choose>
<c:when test="${UserClickedproduct}">
<c:import url="/WEB-INF/view/Product.jsp"></c:import>
</c:when>
</c:choose>  -->
 <div class="ng-view"></div>
<script>
var app = angular.module("myApp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/",{
    	templateUrl : "Home"
    })
     .when("/Login",{
    	templateUrl : "Login"
    })
    .when("/Register",{
        templateUrl : "Register"
    });
});
</script>
<c:choose>
<c:when test="${UserClickedadmin}">
<c:import url="/WEB-INF/view/Admin.jsp"></c:import>
</c:when>
</c:choose>  
</body>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  h1 {
    text-align: center;
}
  p {
    text-align: right;
}
  
  </style>
</head>
<body>

<div class="container-fluid">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
       
      <img src="C:\Users\majjipoojihta\Desktop\dha3\c24.jpg" alt="Cam" width="460" height="345">
      </div>

      <div class="item">
        
      <img src="C:\Users\majjipoojihta\Desktop\dha3\c10.jpg" alt="Cam" width="460" height="345">
      </div>
    
      <div class="item">
      
      <img src="C:\Users\majjipoojihta\Desktop\dha3\c19.jpg" alt="Cam" width="460" height="345">
      </div>

      <div class="item">
       
      <img src="C:\Users\majjipoojihta\Desktop\dha3\c23.jpg" alt="Cam" width="460" height="345">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  
  
	<c:forEach items="${productList}" var="product">
		<c:out value="${product.name}" />
		<div class="thumbnail">

			<img height="100px" width="100px" alt="${product.id }"
				src="<c:url value="/resources/images/${product.id }.jpg"></c:url>">
		</div>

	</c:forEach>

	<div ng-view></div>

	
	<script>
		$(document).ready(function() {
			$('.dropdown a.test').on("click", function(e) {
				$(this).next('ul').toggle();
				e.stopPropagation();
				e.preventDefault();
			});
		});
	</script>
  </body>
</html>

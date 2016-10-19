<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <!--  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<title>Shopping Cart</title>
    <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  h1{text-align: center;
  font-style: italic;
  font-size: 40px;
  text-decoration: underline;
  
  color: blue;}
  

  p {
    text-align: right;
}
  
  </style>
</head>
<body background="C:\Users\majjipoojihta\Desktop\dha3\85.jpg" ng-app="myApp">
<h1> Online Emporium <span class="glyphicon glyphicon-shopping-cart"></span></h1><br>
 <body>

<nav class="navbar navbar-inverse">

  <div class="container-fluid">
    <div class="navbar-header">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href=""><p>Home<span class="glyphicon glyphicon-home"></span></p></a></li>
      
   <div class="col-sm-6 col-sm-offset-0">
            <div id="imaginary_container"> 
                <div class="input-group stylish-input-group">
                    <input type="text" class="form-control"  placeholder="Search" >
                    <span class="input-group-addon">
                        <button type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>  
                    </span>
                </div>
          </div></div>
           <li><a href="Cart"><p>Cart <span class="glyphicon glyphicon-shopping-cart"></span></p></a>
 
	  <li><a href="Registration"><p>Register<span class="glyphicon glyphicon-user"></span></p></a></li>
    <li><a href="Login"><p>Login <span class="glyphicon glyphicon-log-in"></span></p></a></li>
    
    <sec:authorize access="isAuthenticated()">

	<li><a href="perform_logout">Logout<i class="glyphicon glyphicon-log-out"></i></a></li>
	<li><a href="">Welcome<sec:authentication property="principal.username"/></a></li>
 </sec:authorize>
      
    </ul>          
    
  
</nav>
${message}  <br>
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
    .when("/Registration",{
        templateUrl : "Registration"
    });
});
</script>
<c:choose>
<c:when test="${userClickedLoginHere}">
<c:import url="/WEB-INF/view/Login.jsp"></c:import>
</c:when>
</c:choose> 
<c:choose>
<c:when test="${userClickedRegistrationHere}">
<c:import url="/WEB-INF/view/Registration.jsp"></c:import>
</c:when>
</c:choose>  
  


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
  <br>
  <!-- --<div align="center">
		<table class="table1" style="width: 100%">
		<thead>
		<th>Product Name</th>
		<th>Product Price</th>
		<th>Image</th>
	</thead>
	<tbody> -->
	<c:forEach items="${productList}" var="product"><tr>
<td id="td1"><c:out value="${product.name}" />
<td id="td1"><c:out value="${product.price}" />
							<td><div class="thumbnail">
							  <!-- --<div class="col-md-4">-->
							<a href="ShowProduct/${product.id}"> 
     					<img height="150px" width="150px" alt="${product.id }"
     					src="<c:url value="/resources/images/${product.id }.jpg"></c:url>"></a>
     					
     					<td><c:url var="action" value="addtocart/${product.id}"></c:url>
			<form:form action="${action}" modelAttribute="cart">
			<input type="submit" class="btn btn-primary" value="Add To Cart" />
			</form:form></td>
									
							</div>
							
			
</tr>						
</td></c:forEach>
</div>
		
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
	
	<c:choose>
		<c:when test="${UserClickedadmin}">
			<c:import url="/WEB-INF/views/Admin.jsp"></c:import>
		</c:when>
	</c:choose>
	
	<c:choose>
		<c:when test="${Clickedshowproduct}">
			<c:import url="/WEB-INF/views/ShowProduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
	<c:when test="${IfCartClicked}">
	<c:import url="/WEB-INF/views/Cart.jsp"></c:import>
	</c:when>
</c:choose>
  </body>
</html>
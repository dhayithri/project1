<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Shopping Cart</title>
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
	margin: auto;
}

h3 {
	text-align: center;
	font-style: italic;
	font-size: 30px;
	/* text-decoration: underline; */
	color: white;
}

p {
	text-align: right;
}

#myDIV {
	width: 100%;
	padding: 50px 0;
	text-align: center;
	background-color: lightblue;
	margin-top: 20px;
}

.w3-black, .w3-hover-black:hover {
	color: #fff !important;
	background-color: #808184 !important;
}

.button {
	border-radius: 1px;
	background-color: #5f5f5f;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 15px;
	padding: 10px;
	width: 140px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}
</style>

</head>
<body>
	<nav class="navbar navbar-inverse">
	<h3>
		Online Emporium <span class="glyphicon glyphicon-shopping-cart"></span>
	</h3>
	<div class="container-fluid">
		<div class="navbar-header">
			<ul class="nav navbar-nav ">
				<li class="active"><a href="">Home<span
						class="glyphicon glyphicon-home"></span></a></li>
				<sec:authorize access="isAuthenticated()">
					<li><a href="Cart">Cart <span
							class="glyphicon glyphicon-shopping-cart"></span></a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a href="<c:url value="/perform_logout" />">Logout<span
							class="glyphicon glyphicon-log-out"></span></a></li>
					<li><a href="">Welcome<sec:authentication
								property="principal.username" /></a></li>
				</sec:authorize>

				<sec:authorize access="!isAuthenticated()">
					<li><a href="Registration">Register<span
							class="glyphicon glyphicon-user"></span></a></li>
					<li><a href="Login">Login<span
							class="glyphicon glyphicon-log-in"></span></a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
	</nav>

	${message}
	<br>
	<div class="ng-view"></div>
	<script>
		var app = angular.module("myApp", [ "ngRoute" ]);
		app.config(function($routeProvider) {
			$routeProvider.when("/", {
				templateUrl : "Home"
			}).when("/Login", {
				templateUrl : "Login"
			}).when("/Registration", {
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
	<c:choose>
		<c:when test="${IfPaymentClicked}">
			<c:import url="/WEB-INF/view/Payment.jsp">
			</c:import>
		</c:when>
	</c:choose>

	<div class="container">
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
					<img
						src="http://www.gannett-cdn.com/-mm-/1d45be6d469ba11eb7a4520af7cb906a165e911c/r=4000x200/local/-/media/2016/07/20/USATODAY/USATODAY/636046300372069685-surface-book-hero-redux1.png"
						alt="Laptop" width="350" height="200">
				</div>

				<div class="item">
					<img
						src="https://cdn.lifestyle.com.au/cache/400x200/factsheets/thumbnails/vintage-clothing.jpg"
						alt="Clothes" width="460" height="345">
				</div>

				<div class="item">
					<img
						src="http://images.askmen.com/sports/fanatic/team-sahara-force-india_1372383405.jpg"
						alt="Mobiles" width="460" height="345">
				</div>

				<div class="item">
					<img
						src="http://newmobilereview.com/wp-content/uploads/2015/10/Vivo-Xplay-5S.jpg"
						alt="Offer" width="460" height="345">
				</div>
			</div>


			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
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
		<c:forEach items="${productList}" var="product">
			<tr>


				<td>
					<!-- --<div class="thumbnail">-->
					<div class="col-md-4">
						<a href="ShowProduct/${product.id}"> <img height="150px"
							width="150px" alt="${product.id }"
							src="<c:url value="/resources/images/${product.id }.jpg"></c:url>"></a>

						<td><c:url var="action" value="addtocart/${product.id}"></c:url>
							<form:form action="${action}" modelAttribute="cart">
								<td id="td1"><c:out value="${product.name}" /><br>
								<td id="td1"><c:out value="${product.price}" /> <input
									type="submit" class="btn btn-primary" value="Add To Cart" /><br>
							</form:form></td>
						<br>

					</div>
			</tr>
			</td>
		</c:forEach>
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
			<c:import url="/WEB-INF/view/Admin.jsp"></c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${UserClickedshowproduct}">
			<c:import url="/WEB-INF/view/ShowProduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${UserClickedCart}">
			<c:import url="/WEB-INF/view/Cart.jsp"></c:import>
		</c:when>
	</c:choose>

	<br>
	<div>
		<c:choose>
			<c:when test="${!Administrator}">
				<c:if test="${empty HideOthers}">
					<table class="table">
						<thead>
							<tr>
								<th>OUR COMPANY</th>
								<th>TOP CATEGORIES</th>
								<th>POLICIES AND INFO</th>
							</tr>
						</thead>
						<tbody>

							<tr>

								<td>About us<br> Online Emporium <br> Ethnico<br>
									Place of Origin<br> Blog<br>
								</td>

								<td>Sarees<br> Lehenga<br> Jewellery<br>
									Accessories<br> Salwar Suits<br></td>
								<td>Terms & Conditions<br> Policy for Sellers<br>
									Policy for Buyers<br> Shipping & Refund Policies<br>
									Wholesale Policy<br> Privacy Policy<br></td>
							</tr>

							<tr>
								<th>SUPPORT</th>
								<th>PAYMENT OPTIONS</th>
								<th>STAY CONNECTED</th>
							</tr>


							<tr>
								<td><i class="fa fa-envelope"
									style="font-size: 30px; color: blue"></i> <a
									href="mailto:support@company.com">support@onlineemporium.com</a><br>
									<i class="fa fa-phone" style="font-size: 30px; color: blue"><p>+11
											888 242 424</p></i><br> <i class="fa fa-map-marker"
									style="font-size: 30px; color: blue"></i>
									<p>
										<span>24/4-859 V V Nagar,VIJAYAWADA, </span> Andhra Pradesh,
										INDIA
									</p>
									<br></td>
								<td><div class="footer-icons">
										<a href=""><i class="fa fa-facebook-official"
											style="font-size: 30px; color: blue"></i> <a href=""><i
												class="fa fa-twitter"
												style="font-size: 30px; color: #00ffff"></i></a> <a href=""><i
												class="fa fa-linkedin-square"
												style="font-size: 30px; color: blue"></i></a> <a href=""><i
												class="fa fa-google" style="font-size: 30px; color: #3366ff"></i></a>
											<a href=""><i class="fa fa-google-plus-official"
												style="font-size: 30px; color: red"></i></a> <a href=""><i
												class="fa fa-whatsapp"
												style="font-size: 30px; color: #33ff00"></i></a>
									</div></td>
								<td><a href=""><i class="fa fa-paypal"
										aria-hidden="true" style="font-size: 30px; color: #0066ff"></i>
								</a> . <a href=""><i class="fa fa-cc-amex" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-cc-mastercard" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-cc-visa" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-credit-card" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-google-wallet" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-cc-stripe" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a></td>
						</tbody>
					</table>
				</c:if>
			</c:when>
		</c:choose>
	</div>
</body>
</html>
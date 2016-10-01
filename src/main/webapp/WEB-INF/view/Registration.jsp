<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <style>
 
 h1{
    text-align: center;
    }
 h3{
    text-align: center;
    }
    </style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> New User Registration</title>
</head>
<!-- ---<body>
<div class="container"> 
  <p><h1 class="well">Registration Form</h1></p>
	<div class="col-lg-12 well">
	 <h3> <div class="row">
				<form>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name:</label>
								<input type="text" placeholder="Enter First Name Here.." class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name:</label>
								<input type="text" placeholder="Enter Last Name Here.." class="form-control">
							</div>
						</div>
						<br>					
						<div class="form-group">
							<label>Address:</label>
							<textarea placeholder="Enter Address Here.." rows="3" class="form-control"></textarea>
						</div>	
						<br>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Password:</label>
								<input type="password" placeholder="Enter Password Here.." class="form-control">
							</div>	
							<div class="col-sm-6 form-group">
								<label>ReEnter Password:</label>
								<input type="password" placeholder="ReEnter Password Here.." class="form-control">
							</div>	
												
					<br>	
					<div class="form-group">
						<label>Phone Number:</label>
						<input type="text" placeholder="Enter Phone Number Here.." class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label>Email Address:</label>
						<input type="text" placeholder="Enter Email Address Here.." class="form-control">
					</div>	
					<br>
					<button type="button" class="btn btn-lg btn-info">Submit</button>					
					</div>
				</form> 
				</div>
	</div>- -->
	
	
	<body style="padding-top:">
	<div class="container">
	
	${message}
	<%-- <c:choose>
				<c:when test="${!empty SuccessMessage}">
					<td colspan="2">
						<div class="alert alert-success fade in">
							<a href="login" class="close" data-dismiss="alert" aria-label="close">&times;</a>${message}
						</div>
					</td>
				</c:when>
			</c:choose> --%>
	
	
	
	<section id="content">
			<c:url var="addAction" value="adduser"></c:url>
			<form:form action="${addAction}" commandName="userDetails"
				method="post">
				<h4>Registration</h4>
				<div>
					<form:input path="name" type="text" placeholder="Name"
						pattern=".{5,10}" required="true" id="username" name="username" 
						title="minimum length for name is 5"/>
				</div>
				<br>
				<div>
					<form:input path="userName" type="text" placeholder="Username"
					pattern=".{5,10}" required="true" id="username" name="username"
					title="minimum length for username is 5" />
				</div>
				<br>
				<div>
					<form:input path="password" type="password" placeholder="Password" pattern=".{3,8}"
						required="true" id="password" name="password" title="minimum length for passsword is 3" />
				</div>
				<br>
				<div>
					<form:input path="email" type="email" placeholder="Email"
						required="true" id="username" name="username" />
				</div>
				<br>

				<div>
					<form:input path="mobile" type="text" placeholder="Mobile"
						pattern="^[789]\d{9}$" required="true" id="username"
						name="username" title="Enter valid mobile number" />
				</div>
				<br>
				<div>
					<input type="submit" value="Register" /><a href="Login">Sign In</a>
				</div>

			</form:form>
			
		</section>
		
	</div>
	
</body>
</html>
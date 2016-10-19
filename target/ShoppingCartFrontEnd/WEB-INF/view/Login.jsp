<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<!-- -<body>
<form action="action_page.php">
  First name:<br>
  <input type="text" name="firstname">
  <br>
  Last name:<br>
  <input type="text" name="lastname" >
  <br><br>
  <input type="submit" value="Login">
</form>-- -->

<body style="padding-top:">
	<div class="container">
		<section id="content">
			<form action="perform_login" method="post">
				<h4>Login</h4>
				<div>
					<input type="text" placeholder="Username" required id="username" name="username" 
						pattern=".{5,10}" title="minimum length for name is 5"/>
				</div>
				<br>
				<div>
					<input type="password" placeholder="Password" required id="password" name="password" 
					 pattern=".{3,8}" title="Enter Valid credentials"/>
				</div>
				<br>
				<div>
					<input type="submit" value="Log in" />  <a href="Registration">Register</a>
				</div>
				
			</form>
			
			
		</section>
		
	</div>
	


</body>
</html>
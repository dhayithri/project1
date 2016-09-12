<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <style>
 
 h1{
 text-decoration: underline;
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
<body>
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
							<br>
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
							<div class="col-sm-4 form-group">
								<label>City:</label>
								<input type="text" placeholder="Enter City Name Here.." class="form-control">
							</div>
							<br>	
							<div class="col-sm-4 form-group">
								<label>State:</label>
								<input type="text" placeholder="Enter State Name Here.." class="form-control">
							</div>	
							<br>
							<div class="col-sm-4 form-group">
								<label>Zip:</label>
								<input type="text" placeholder="Enter Zip Code Here.." class="form-control">
							</div>		
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
	</div>
	</div></h3>
</body>
</html>
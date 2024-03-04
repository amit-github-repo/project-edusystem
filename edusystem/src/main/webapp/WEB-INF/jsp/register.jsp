
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EMS</title>
		<jsp:include page="anolayout/header.jsp" />
		<link rel="stylesheet" type="text/css" href="css/registerstyle.css">
	</head>
	<body>
		<div class="wrapper rounded bg-white">

	        <div class="h3">Registration Form</div><div class="h5" style="color: darkblue;">${sms}</div>
	        <form method="post" action="/register">
		        <div class="form"  >
		            <div class="row">
		                <div class="my-md-2 my-3">
		                    <label>User Name</label>
		                    <input type="text" name="name" id="name" class="form-control" required>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-6 mt-md-0 mt-3">
		                    <label>Role</label>
		                    <div class="d-flex align-items-center mt-2">
		                        <label class="option">
		                            <input type="radio" name="role" value="student">Student
		                            <span class="checkmark"></span>
		                        </label>
		                        <label class="option ms-4">
		                            <input type="radio" name="role" value="faculty">Faculty
		                            <span class="checkmark"></span>
		                        </label>
		                    </div>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-6 mt-md-0 mt-3">
		                    <label>Email</label>
		                    <input type="email" id="email" name="email" class="form-control" required>
		                </div>
		                <div class="col-md-6 mt-md-0 mt-3">
		                    <label>Password</label>
		                    <input type="text" id="password" name="password" class="form-control" required>
		                </div>
		            </div>
		            
		            <div class="row">
		            	<button class="btn btn-primary mt-3" type="submit">Register</button>
		            </div>
		        </div>
		    </form>
		</div>
	</body>
</html>

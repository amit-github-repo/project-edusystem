<a href="<% out.print(request.getParameter("page")); %>"> Back to Dashboard </a>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Change Profile</title>
	</head>
	<body>
		<form action="/updateProfile" method="post" >
			User Id:<input type="text" name="email" value="<% out.print(session.getAttribute("email")); %>" readonly /><br />
			User Name:<input type="text" name="name" /><br />
			User Pass:<input type="text" name="password" /><br />
			<input type="hidden" name="page" value="<% out.print(request.getParameter("page")); %>" /><br />
			<input type="submit" value="Update">
		</form>
	</body>
</html>

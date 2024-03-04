<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Faculty</title>
		<jsp:include page="studentlayout/studentHeader.jsp" />
	</head>
	<body>
		<h1>Welcome Student: <% out.println(session.getAttribute("name")); %></h2>
		<h2>Your Id: <% out.println(session.getAttribute("email")); %></h2>
	</body>
</html>
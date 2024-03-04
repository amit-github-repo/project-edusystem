<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Users</title>
		<jsp:include page="adminHeader.jsp" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	</head>
	<body>
		 <c:out value = "${usermaster}" />  <%--This is for check the data is comming or not--%>
		<form action="/update_user" method="post">
			Your Id: <input type="text" name="email" value="${usermaster[0].email}" readonly /><br />
			Name: <input type="text" name="name" value="${usermaster[0].name}" /><br />
			Role: <input type="text" name="role" value="${usermaster[0].role}" /><br />
			Status: <input type="text" name="status" value="${usermaster[0].status}" /><br /><br />
			<input type="submit" name="btn" class="btn btn-danger" />
		</form>
	</body>
</html>
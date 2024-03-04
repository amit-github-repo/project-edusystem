<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Profile</title>
		<jsp:include page="studentHeader.jsp" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<style type="text/css">
			.center {
			  border: 5px solid;
			  position: absolute;
			  top: 50%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			  padding: 10px;
			}
		</style>
	</head>
	<body>
		<div class="center">
			<%--<c:out value = "${userprofile}" />  	This is for check the data is comming or not--%>

			<% byte[] s=(byte[])request.getAttribute("photo"); %>
			<% if(s != null){ %>
				<img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(s) %>" width="200" height="200" style="border-radius: 50%;"/>
			<%	}else{ %>
				<img src="images/nullProfilepic.png" width="200" height="200" style="border-radius: 50%;"/>
			<% } %>

			<form action="/upload_photo" method="post" enctype="multipart/form-data" >
				<input type="file" name="pic"/><br /><br />
				<input type="submit" name="btn" class="btn btn-primary" value="Upload Photo" />
			</form>
			<br />
			<br />
			<form action="/update_profile" method="post">
				Name: <input type="text" name="name" value="${userprofile[0].name}" /><br />
				Your Id: <input type="text" name="email" value="${userprofile[0].email}" readonly /><br />
				Role: <input type="text" name="role" value="${userprofile[0].role}" readonly /><br />
				<input type="submit" name="btn" class="btn btn-danger"  />
			</form>
		</div>
	</body>
</html>










<%--
	data can be change in phpmyadmin just double click in the browse data
	redirect to page
	if else in profile page 
org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@640be6ba

 String sql = "SELECT photo FROM profile WHERE email = ?";
    byte[] imageData = jdbc.queryForObject(sql, byte[].class,email);
	 model.addAttribute("imageData",imageData);
    model.addAttribute("k",100);
--%>
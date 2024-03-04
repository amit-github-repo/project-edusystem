<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Doubt</title>
		<jsp:include page="studentHeader.jsp" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<style type="text/css">
			.h{ display:none; }
			.d{ display:block; }
		</style>
	</head>
	<body>
		<div style="margin-left: 50px;">
			<form method="post" action="/add_doubt">
				<h3>Add Doubt: </h3>
				<textarea name="doubt" rows="3" cols="100" style="border: 5px solid;" placeholder="Write your Doubt ?"></textarea>
				<br /><br />
				<input type="hidden" name="email" value="<% out.println(session.getAttribute("email")); %>" />
				<input type="submit" value="Add Doubt" class="btn btn-success" />
			</form>
			<br />
			<div>
				<button id="showdoubt" class="btn btn-outline-primary d">Show All Doubt</button>
				<button id="hidedoubt" class="btn btn-outline-primary h">Hide All Doubt</button>
				<table id="table_id" class="table h">
					<thead>
						<tr><th>Stu-Id</th><th>Doubt</th><th>Doubt Date</th><th>Answer</th><th>F-id</th><th>Ans date</th></tr>
					</thead>
					<tbody>
						<c:forEach var="doubt" items="${doubt_data}">
							<tr>
								<td>${doubt.student_id}</td>
								<td>${doubt.doubt}</td>
								<td>${doubt.doubt_date}</td>
								<td>${doubt.doubt_answer}</td>
								<td>${doubt.faculty_id}</td>
								<td>${doubt.answer_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<%--	Java Script code	--%>
		<script type="text/javascript" src="js/jqcdnlink.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#showdoubt").on('click',function(){
					//alert("hello");
					$("#showdoubt").removeClass("d");
					$("#showdoubt").addClass("h");
					$("#hidedoubt").removeClass("h");
					$("#hidedoubt").addClass("d");
					$("#table_id").removeClass("h");
					$("#table_id").addClass("d");
				})
				$("#hidedoubt").on('click',function(){
					$("#showdoubt").removeClass("h");
					$("#showdoubt").addClass("d");
					$("#hidedoubt").removeClass("d");
					$("#hidedoubt").addClass("h");
					$("#table_id").removeClass("d");
					$("#table_id").addClass("h");
				})
			})
		</script>
	</body>
</html>

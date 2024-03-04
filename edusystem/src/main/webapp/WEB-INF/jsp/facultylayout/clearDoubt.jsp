<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Clear Doubt</title>
		<jsp:include page="facultyHeader.jsp" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<style type="text/css">
			.h{ display:none; }
			.d{ display:block; }
		</style>
	</head>
	<body>
		<h1 align="center">All Doubts..</h1>
		<hr />
		<table class="table">
			<tr><th>Sl_no</th><th>Stu-Id</th><th>Doubt</th><th>Doubt Date</th><th>Answer</th><th>F-id</th><th>Ans date</th><th>Action</th></tr>
			<c:forEach var="doubt" items="${doubt_data}">
				<tr>
					<td>
						<label id="lbl_sl_no">${doubt.sl_no}</label>
						<input type="hidden" id="sl_no" value="${doubt.sl_no}" />
					</td>
					<td>${doubt.student_id}</td>
					<td>${doubt.doubt}</td>
					<td>${doubt.doubt_date}</td>
					<td>
						<label id="lbl_answer" class="d"> ${doubt.doubt_answer} </label>
						<textarea class="h" id="answer" rows="1" cols="50" >${doubt.doubt_answer}</textarea>
					</td>
					<td>
						<label id="lbl_email"> ${doubt.faculty_id} </label>
						<input type="hidden" id="email" value="<% out.println(session.getAttribute("email")); %>" />
					</td>
					<td>${doubt.answer_date}</td>
					<td><input type="button" class="btn_addAnswer" value="Add Answer" /></td>
				</tr>
			</c:forEach>
		</table>

		<%--	Java Script code	--%>
		<script type="text/javascript" src="js/jqcdnlink.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(".btn_addAnswer").on('click',function(){
					//alert("call..");
					btn = $(this).val();
					lbl_answer= $(this).parents('tr').find('#lbl_answer');
					txt_answer = $(this).parents('tr').find('#answer');
					txt_email = $(this).parents('tr').find('#email');
					txt_sl_no = $(this).parents('tr').find('#sl_no');
					//alert(lbl_answer);
					if (btn == "Add Answer"){
						$(this).val("Update");
						lbl_answer.removeClass('d')
						lbl_answer.addClass('h')
						txt_answer.removeClass('h')
						txt_answer.addClass('d')
					}else{
						$(this).val("Add Answer");
						lbl_answer.removeClass('h')
						lbl_answer.addClass('d')
						txt_answer.removeClass('d')
						txt_answer.addClass('h')

						$.ajax({
							url:"/update_answer",
							method:"POST",
							data:{faculty_id:txt_email.val() , doubt_answer:txt_answer.val() , sl_no:txt_sl_no.val()},
							success:function(res){
								//alert(res);
								str = JSON.stringify(res);
								obj=JSON.parse(str);
								alert(obj);
								if (str === "Success"){
									//alert("hello");
									location.reload(true);
									//var x = document.getElementById('gfg');
									//alert(x+" "+lbl_answer);
									//$('#lbl_answer').text("label value which you want to set");
									//x.innerHTML = txt_answer.val();
									//lbl_answer.innerHTML = txt_answer.val(); 
								}
							}
						})
					}
				})
			})
		</script>
	</body>
</html>

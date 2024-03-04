
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Users</title>
		<jsp:include page="adminHeader.jsp" />
		<style type="text/css">
			.h{ display:none; }
			.d{ display:block; }
		</style>
	</head>
	<body>
		<h1 align="center">All Users.</h1>
		<hr />
		<table class="table">
			<tr><th>Name</th><th>Email</th><th>Role</th><th>Action</th></tr>
			<c:forEach var="user" items="${usermaster}">
				<tr>
					<td>
						<label id="lbl_name" class="d"> ${user.name} </label>
						<input type="text" class="h" id="name" value="${user.name}">
					</td>
					<td>
						<label id="lbl_email" class="d"> ${user.email} </label>
						<input type="hidden" id="email" value="${user.email}">
					</td>
					<td>
						<label id="lbl_role" class="d"> ${user.role} </label>
						<input type="text" class="h" id="role" value="${user.role}">
					</td>
					<td>
						<label id="lbl_status" class="d"> ${user.status} </label>
						<input type="text" class="h" id="status" value="${user.status}">
					</td>
					<td>
						<input type="button" class="btn_del" value="Delete" />
						<input type="button" class="btn_edit" value="Edit" />
					</td>
				</tr>
			</c:forEach>
		</table>

		<%--	Java Script code	--%>
		<script type="text/javascript" src="js/jqcdnlink.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(".btn_edit").on('click',function(){
					//alert("call..");
					btn = $(this).val();
					//alert(btn);
					lbl_name = $(this).parents('tr').find('#lbl_name');
					//alert(lbl_name);
					lbl_email = $(this).parents('tr').find('#lbl_email');
					lbl_role = $(this).parents('tr').find('#lbl_role');
					lbl_status = $(this).parents('tr').find('#lbl_status');

					txt_name = $(this).parents('tr').find('#name');
					//alert(txt_name.val());
					txt_email = $(this).parents('tr').find('#email');
					txt_role = $(this).parents('tr').find('#role');
					txt_status = $(this).parents('tr').find('#status');

					if (btn == "Edit") {
						$(this).val("Update");
						lbl_name.removeClass('d')
						lbl_role.removeClass('d')
						lbl_status.removeClass('d')
						lbl_name.addClass('h')
						lbl_role.addClass('h')
						lbl_status.addClass('h')

						txt_name.removeClass('h')
						txt_role.removeClass('h')
						txt_status.removeClass('h')
						txt_name.addClass('d')
						txt_role.addClass('d')
						txt_status.addClass('d')
					}else{
						$(this).val("Edit");
						lbl_name.removeClass('h')
						lbl_role.removeClass('h')
						lbl_status.removeClass('h')
						lbl_name.addClass('d')
						lbl_role.addClass('d')
						lbl_status.addClass('d')

						txt_name.removeClass('d')
						txt_role.removeClass('d')
						txt_status.removeClass('d')
						txt_name.addClass('h')
						txt_role.addClass('h')
						txt_status.addClass('h')

						$.ajax({
							url:"/update_user",
							method:"POST",
							data:{email:txt_email.val() , name:txt_name.val() , role:txt_role.val() , status:txt_status.val()},
							success:function(res){
								//alert(res);
								location.reload(true);
							}
						})
					}
				})

				$(".btn_del").on('click',function(){
					txt_email = $(this).parents('tr').find('#email');
					//alert(txt_email.val());
					$.ajax({
							url:"/delete_user",
							method:"POST",
							data:{email:txt_email.val()},
							success:function(res){
								//alert(res);
								location.reload(true);
							}
						})
				})
			})
		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Question</title>
		<jsp:include page="facultyHeader.jsp" />
		<style type="text/css">
			.h{ display:none; }
			.d{ display:block; }
		</style>
	</head>
	<body>
		<h1 align="center">All Question</h1>
		<hr />
		<table class="table">
			<tr><th>Sl.no</th><th>Question</th><th>Option1</th><th>Option2</th><th>Option3</th><th>Option4</th><th>Answer</th><th>Action</th></tr>
			<c:forEach var="qn" items="${addquestion}">
				<tr>
					<td>
						<label id="lbl_sl_no"> ${qn.sl_no} </label>
						<input type="hidden" id="sl_no" value="${qn.sl_no}">
					</td>
					<td>
						<label id="lbl_question" class="d"> ${qn.question} </label>
						<textarea class="h" id="question" rows="1" cols="50" >${qn.question}</textarea>
					</td>
					<td>
						<label id="lbl_option1" class="d"> ${qn.option1} </label>
						<input type="text" class="h" id="option1" value="${qn.option1}">
					</td>
					<td>
						<label id="lbl_option2" class="d"> ${qn.option2} </label>
						<input type="text" class="h" id="option2" value="${qn.option2}">
					</td>
					<td>
						<label id="lbl_option3" class="d"> ${qn.option3} </label>
						<input type="text" class="h" id="option3" value="${qn.option3}">
					</td>
					<td>
						<label id="lbl_option4" class="d"> ${qn.option4} </label>
						<input type="text" class="h" id="option4" value="${qn.option4}">
					</td>
					<td>
						<label id="lbl_answer" class="d"> ${qn.answer} </label>
						<input type="text" class="h" id="answer" value="${qn.answer}">
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
					lbl_question = $(this).parents('tr').find('#lbl_question');
					//alert(lbl_name);
					lbl_option1 = $(this).parents('tr').find('#lbl_option1');
					lbl_option2 = $(this).parents('tr').find('#lbl_option2');
					lbl_option3 = $(this).parents('tr').find('#lbl_option3');
					lbl_option4 = $(this).parents('tr').find('#lbl_option4');
					lbl_answer = $(this).parents('tr').find('#lbl_answer');
					lbl_sl_no = $(this).parents('tr').find('#lbl_sl_no');


					txt_question = $(this).parents('tr').find('#question');
					//alert(txt_name.val());
					txt_option1 = $(this).parents('tr').find('#option1');
					txt_option2 = $(this).parents('tr').find('#option2');
					txt_option3 = $(this).parents('tr').find('#option3');
					txt_option4 = $(this).parents('tr').find('#option4');
					txt_answer = $(this).parents('tr').find('#answer');
					txt_sl_no = $(this).parents('tr').find('#sl_no');

					if (btn == "Edit") {
						$(this).val("Update");
						lbl_question.removeClass('d')
						lbl_option1.removeClass('d')
						lbl_option2.removeClass('d')
						lbl_option3.removeClass('d')
						lbl_option4.removeClass('d')
						lbl_answer.removeClass('d')

						lbl_question.addClass('h')
						lbl_option1.addClass('h')
						lbl_option2.addClass('h')
						lbl_option3.addClass('h')
						lbl_option4.addClass('h')
						lbl_answer.addClass('h')


						txt_question.removeClass('h')
						txt_option1.removeClass('h')
						txt_option2.removeClass('h')
						txt_option3.removeClass('h')
						txt_option4.removeClass('h')
						txt_answer.removeClass('h')

						txt_question.addClass('d')
						txt_option1.addClass('d')
						txt_option2.addClass('d')
						txt_option3.addClass('d')
						txt_option4.addClass('d')
						txt_answer.addClass('d')
					}else{
						$(this).val("Edit");
						lbl_option1.removeClass('h')
						lbl_option2.removeClass('h')
						lbl_option3.removeClass('h')
						lbl_option4.removeClass('h')
						lbl_answer.removeClass('h')

						lbl_question.addClass('d')
						lbl_option1.addClass('d')
						lbl_option2.addClass('d')
						lbl_option3.addClass('d')
						lbl_option4.addClass('d')
						lbl_answer.addClass('d')


						txt_question.removeClass('d')
						txt_option1.removeClass('d')
						txt_option2.removeClass('d')
						txt_option3.removeClass('d')
						txt_option4.removeClass('d')
						txt_answer.removeClass('d')

						txt_question.addClass('h')
						txt_option1.addClass('h')
						txt_option2.addClass('h')
						txt_option3.addClass('h')
						txt_option4.addClass('h')
						txt_answer.addClass('h')

						$.ajax({
							url:"/update_qn",
							method:"POST",
							data:{question:txt_question.val() , option1:txt_option1.val() , option2:txt_option2.val() , option3:txt_option3.val() , option4:txt_option4.val() , answer:txt_answer.val() , sl_no:txt_sl_no.val()},
							success:function(res){
								//alert(res);
								location.reload(true);
							}
						})
					}
				})
				$(".btn_del").on('click',function(){
					txt_sl_no = $(this).parents('tr').find('#sl_no');
					//alert(txt_sl_no.val());
					$.ajax({
						url:"/delete_qn",
						method:"POST",
						data:{sl_no:txt_sl_no.val()},
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
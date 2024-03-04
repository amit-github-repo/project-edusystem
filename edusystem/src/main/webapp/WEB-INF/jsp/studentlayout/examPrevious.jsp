<%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-left: 50px;">
	<h2 align="center">Previous Exam Question</h2>
	<hr />
	<h3>${stu_ans}.["q1"]</h3>
	<c:forEach var="question" items="${all_question}">
		<div>
			<label>Qn ${question.sl_no} :- ${question.question}</label><br />
			<input type="radio" name="q${question.sl_no}" />${question.option1}<br />
			<input type="radio" name="q${question.sl_no}" />${question.option2}<br />
			<input type="radio" name="q${question.sl_no}" />${question.option3}<br />
			<input type="radio" name="q${question.sl_no}" />${question.option4}<br />

			<h5>Correct Answer is :- Option ${question.answer}</h5>
			<br /><br />
		</div>
	</c:forEach>
	<h3><a href="/examPage">Go Back to Exam DashBoard</a></h3>
</div>

<script type="text/javascript" src="js/jqcdnlink.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var stu_ans = ${stu_ans};
		//alert(${stu_ans}.q2);
		//alert(stu_ans.q2);
	})
</script>


--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<div style="margin-left: 50px;">
	<h2 align="center">Previous Exam Question</h2>
	<hr />
	<button type="button" id="show_ans" class="btn btn-info">Show My Answer</button><br />
	<c:forEach var="question" items="${all_question}">
		<div>
			<label>Qn ${question.sl_no} :- ${question.question}</label><br />
			<input type="radio" id="q${question.sl_no}1" name="q${question.sl_no}" class="form-check-input" disabled /> ${question.option1}<br />
			<input type="radio" id="q${question.sl_no}2" name="q${question.sl_no}" class="form-check-input" disabled /> ${question.option2}<br />
			<input type="radio" id="q${question.sl_no}3" name="q${question.sl_no}" class="form-check-input" disabled /> ${question.option3}<br />
			<input type="radio" id="q${question.sl_no}4" name="q${question.sl_no}" class="form-check-input" disabled /> ${question.option4}<br />

			<h5>Correct Answer is :- Option ${question.answer}</h5>
			<br /><br />
		</div>
	</c:forEach>
	<h3><a href="/examPage">Go Back to Exam DashBoard</a></h3>
</div>

	Java Script code
<script type="text/javascript" src="js/jqcdnlink.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#show_ans").on('click',function(){
			var stu_ans = ${stu_ans};
			for (var key in stu_ans){
				var rId = key+""+stu_ans[key];
				document.getElementById(rId+"").checked = true ;		
			}
		})
	})
</script>


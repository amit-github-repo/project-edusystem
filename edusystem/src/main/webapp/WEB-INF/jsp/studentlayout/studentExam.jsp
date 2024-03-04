<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<div style="margin-left: 50px;">
		<h2 align="center">Exam Question</h2>

		<form method="post" action="/saveStudentAnswer">
			<c:forEach var="question" items="${all_question}">
				<div>
					<label>Qn :- ${question.question}</label><br />
					<input type="radio" name="q${question.sl_no}" value="1" >${question.option1}<br />
					<input type="radio" name="q${question.sl_no}" value="2" >${question.option2}<br />
					<input type="radio" name="q${question.sl_no}" value="3" >${question.option3}<br />
					<input type="radio" name="q${question.sl_no}" value="4" >${question.option4}<br />
					<br /><br />
				</div>
			</c:forEach>
			<input type="submit" value="Submit Answer" />
		</form>
	</div>
</body>

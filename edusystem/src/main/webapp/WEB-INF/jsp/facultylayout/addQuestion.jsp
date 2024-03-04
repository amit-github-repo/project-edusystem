<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add Question</title>
		<jsp:include page="facultyHeader.jsp" />
	</head>
	<body>
		<h2 align="center">Add Question</h2>
		<hr/>
		<form action="/addQuestion" method="post">
			Queston: <textarea name="qn" rows="5" cols="50" placeholder="Write your Question"></textarea><br />
			Option 1: <input type="text" name="op1" /><br />
			Option 2: <input type="text" name="op2" /><br />
			Option 3: <input type="text" name="op3" /><br />
			Option 4: <input type="text" name="op4" /><br />
			Answer: <input type="text" name="ans" /><br />
			<input type="submit" value="Save" />
			<h3>${sms}</h3>
		</form>	
	</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <jsp:include page="studentHeader.jsp" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
 </head>
<div align="center">
	<h3><a href="/studentExam">CURRENT ON GOING EXAM</a></h3>
</div>
<div>
	<h2>All Exam that you attend.</h2>
	<table class="table">
		<c:set value="0" var="i"/>
		<tr><th>Sl No.</th><th>Exam Date</th><th>Mark obtain</th></tr>
		<c:forEach var="exam_data" items="${user_exam_data}">
			<tr>
				<td><c:out value="${i=i+1}"/></td>
				<td><a href="/examPrevious?edate=${exam_data.exam_date}&eid=${exam_data.sl_no}">${exam_data.exam_date}</a></td>
				<td>${exam_data.mark}</td>
			</tr>
		</c:forEach>
	</table>
	
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>修正</h1>

	<c:forEach var="todo" items="${ list }">
		<c:if test="${ sessionScope.id == todo.id }">
			<c:out value="${ todo.id }" />
			<form action="edit" method="post">
				タスク：<input type="text" name="task" value="${ todo.task }" />
				期日：<input type="text" name="deadline" value="${ todo.deadline }" />
				担当：<input type="text" name="member" value="${ todo.member }" />
				<input type="submit" value="修正" />
			</form>
		</c:if>
	</c:forEach>

</body>
</html>
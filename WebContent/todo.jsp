<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDoリスト</title>
</head>
<body>
	<h1>ToDoリスト</h1>

	<form action="ToDo" method="post">
		タスク：<input type="text" name="task" />
		期日：<input type="text" name="deadline" />
		担当：<input type="text" name="member" />
		<input type="submit" value="送信" />
	</form>

	<table>
	<c:forEach items="${ list }" var="todo">
		<tr>
			<td>[<c:out value="${ todo.id }" />]</td>
			<td><c:out value="${ todo.task }" /></td>
			<td><fmt:formatDate value="${ todo.deadline }" /></td>
			<td><c:out value="${ todo.member }" /></td>
			<td><a href="edit?id=${ todo.id }">[編集]</a></td>
		</tr>
	</c:forEach>
	</table>


</body>
</html>
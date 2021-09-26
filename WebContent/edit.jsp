<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDo編集</title>
</head>
<body>
	<h1>編集</h1>

		<form action="edit" method="post">
			[<c:out value="${ todo.id }" />]
			<%-- valueの中にEL式を入れることでフォームの中に表示される --%>
			タスク：<input type="text" name="task" value="${ todo.task }" />
			<%-- input valueの中にそのままJSTLを入れてもいいっぽい --%>
			期日：<input type="text" name="deadline" value="<fmt:formatDate value="${ todo.deadline }" />" />
			担当：<input type="text" name="member" value="${ todo.member }" />
			<input type="submit" value="編集" />
		</form>
</body>
</html>
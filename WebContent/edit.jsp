<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDo編集</title>
<link rel="stylesheet" href="css/common.css" type="text/css" />
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
</head>
<body>
	<header>
		<div class="link">
			<span class="dummy"><i class="fas fa-cog"></i>ユーザ設定</span>
			<a href="/ToDoServlet/todo.jsp"><i class="far fa-hand-point-right">ToDoリストへ</i></a>
		</div>
	</header>
	<div class="band"><h1>編集</h1></div>

	<div class="content">
		<form action="edit" method="post">
			<input type="hidden" name="id" value="${todo.id}" />
			<%-- valueの中にEL式を入れることでフォームの中に表示される --%>
			タスク：<input type="text" name="task" value="${ todo.task }" class="form" required />
			期日：<input type="date" name="deadline" value="${ todo.deadline }" class="form" required />
			担当：<%-- <input type="text" name="member" value="${ todo.member }" /> --%>
			<select name="member" class="select">
				<option value="N" <c:if test="${ todo.member == 'N' }">selected</c:if>>N</option>
				<option value="Y" <c:if test="${ todo.member == 'Y' }">selected</c:if>>Y</option>
			</select>
			<input type="submit" value="編集" class="submit-button" />
		</form>
	</div>

	<footer></footer>
</body>
</html>
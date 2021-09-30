<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>完了リスト</title>
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
	<div class="band"><h1>完了リスト</h1></div>

	<div class="content">
		<form action="finished" method="post">
			<table>
			<!-- 未完了に戻すボタン -->
			<c:if test="${ list != null }">
				<th class="left"><input type="submit" value="未完了に戻す" class="back-button" /></th>
			</c:if>
			<!-- 完了リスト表示 -->
			<c:forEach items="${ list }" var="todo">
				<c:if test="${ todo.finished == '1'}">
					<tr>
						<td class="start"><input type="checkbox" name="finished" value="${ todo.id }"></td>
						<td>[<c:out value="${ todo.id }" />]</td>
						<td class="task" width="40%"><c:out value="${ todo.task }" /></td>
						<td class="task" width="20%"><c:out value="${ todo.deadline }" />までに</td>
						<td class="task" width="20%"><c:out value="${ todo.member }" />がやったよ！！</td>
					</tr>
				</c:if>
			</c:forEach>
			</table>
		</form>
	</div>

	<footer></footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>完了リスト</title>
</head>
<body>
	<h1>完了リスト</h1>
	<!-- 未完了に戻すボタン -->
	<form action="finished" method="post">
		<input type="submit" value="未完了に戻す" />
		<!-- 完了リスト表示 -->
		<table>
		<c:forEach items="${ list }" var="todo">
			<c:if test="${ todo.finished == '1'}">
				<tr>
					<td><input type="checkbox" name="finished" value="${ todo.id }"></td>
					<td>[<c:out value="${ todo.id }" />]</td>
					<td><c:out value="${ todo.task }" /></td>
					<td><fmt:formatDate value="${ todo.deadline }" /></td>
					<td><c:out value="${ todo.member }" /></td>
				</tr>
			</c:if>
		</c:forEach>
		</table>
	</form>
	<!-- トップに戻るボタン -->
	<button onclick="location.href='./todo.jsp'">トップ</button>
</body>
</html>
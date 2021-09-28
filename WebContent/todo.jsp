<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDoリスト</title>
<link rel="stylesheet" href="css/common.css" type="text/css" />
</head>
<body>
	<header></header>
	<div class="band"><h1>ToDoリスト</h1></div>

	<div class="content">
		<!-- ToDo入力 -->
		<form action="ToDo" method="post">
			タスク：<input type="text" name="task" required/>
			<!-- type="date"にするとカレンダ浴に入力になる。valueは"yyyy-mm-dd" -->
			期日：<input type="date" name="deadline" required/>
			担当：<%-- <input type="text" name="member" required/> --%>
			<select name="member">
				<option value="N">N</option>
				<option value="Y">Y</option>
			</select>
			<input type="submit" value="登録" class="submit-button" />
		</form>

		<!-- 完了ボタン -->
		<form action="finished" method="post">
			<p><input type="submit" value="完了" class="finish-button" /></p>

			<!-- ToDoリスト表示 -->
			<table>
			<c:forEach items="${ list }" var="todo">
				<c:if test="${ todo.finished == '0'}">
				<tr>
					<td class="start"><input type="checkbox" name="finished" value="${ todo.id }"></td>
					<td>[<c:out value="${ todo.id }" />]</td>
					<td width="40%"><c:out value="${ todo.task }" /></td>
					<td width="20%"><c:out value="${ todo.deadline }" />までに！</td>
					<td width="20%"><c:out value="${ todo.member }" />がやる！</td>
					<td class="end">
						<a href="edit?id=${ todo.id }">[編集]</a>
						<a href="delete?id=${ todo.id }">[削除]</a>
					</td>
				</tr>
				</c:if>
			</c:forEach>
			</table>
		</form>
	</div>

	<footer></footer>
</body>
</html>
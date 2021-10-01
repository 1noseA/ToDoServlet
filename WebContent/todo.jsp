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
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
</head>
<body>
	<header>
		<div class="link">
			<span class="dummy"><i class="fas fa-cog"></i>ユーザ設定</span>
			<a href="/ToDoServlet/finished.jsp"><i class="far fa-hand-point-right">完了リストへ</i></a>
		</div>
	</header>
	<div class="band"><h1>ToDoリスト</h1></div>

	<div class="content">
		<!-- ToDo入力 -->
		<form action="ToDo" method="post">
			タスク：<input type="text" name="task" class="form" required />
			<!-- type="date"にするとカレンダ浴に入力になる。valueは"yyyy-mm-dd" -->
			期日：<input type="date" name="deadline" class="form" required />
			担当：
			<select name="member" class="select" required>
				<option disabled selected value>選択してね</option>
				<option value="N">N</option>
				<option value="Y">Y</option>
			</select>
			<input type="submit" value="登録" class="submit-button" />
		</form>

		<!-- 完了ボタン -->
		<form action="finished" method="post">
			<table>
			<%-- リスト消した場合では完了ボタン残ってしまう --%>
			<c:if test="${ list != null }">
				<th class="left"><input type="submit" value="完了" class="finish-button" /></th>
			</c:if>

			<!-- ToDoリスト表示 -->

			<c:forEach items="${ list }" var="todo">
				<c:if test="${ todo.finished == '0'}">
				<tr>
					<td class="start"><input type="checkbox" name="finished" value="${ todo.id }"></td>
					<td>[<c:out value="${ todo.id }" />]</td>
					<td class="task" width="40%"><c:out value="${ todo.task }" /></td>
					<td class="task" width="20%"><c:out value="${ todo.deadline }" />までに！</td>
					<td class="task" width="20%"><c:out value="${ todo.member }" />がやる！</td>
					<td><a href="edit?id=${ todo.id }"><i class="fas fa-pencil-alt"></i></a></td>
					<td class="end"><a href="delete?id=${ todo.id }"><i class="fas fa-trash-alt"></i></a></td>
				</tr>
				</c:if>
			</c:forEach>
			</table>
		</form>
	</div>

	<footer></footer>
</body>
</html>
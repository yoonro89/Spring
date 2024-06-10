<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<table border="1" align="center">
			<caption>::회원목록::</caption>
			
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
			</tr>
			
			<c:forEach var="vo" items="${ulist}">
			<tr>
				<td>${ vo.userno }</td>
				<td>${ vo.name }</td>
				<td>${ vo.age }</td>
			</tr>
			</c:forEach>
		</table>
	</body>
</html>
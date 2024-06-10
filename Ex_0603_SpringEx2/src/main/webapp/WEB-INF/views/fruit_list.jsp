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
		<p>과일목록</p>
		"${ list.size() }"
		<ul>
			<c:forEach var="f" items="${list}">
				<li>${ f }</li>
			</c:forEach>
		</ul>
	</body>
</html>
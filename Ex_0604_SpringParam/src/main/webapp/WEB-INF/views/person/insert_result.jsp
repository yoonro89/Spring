<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : ${ vo.name }<br>
	나이 : ${ vo.age }<br>
	비번 : ${ vo.pwd }<br>
	
	<input type="button" value="돌아가기" onclick="location.href='insert_form.do'">
</body>
</html>
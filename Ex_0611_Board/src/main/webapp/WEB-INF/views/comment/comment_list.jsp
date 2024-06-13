<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			.dix{width:700px;
				 margin:0 auto;
				 text-align:left;
				 background-color:rgb(212, 244, 250);}
			a{text-decoration:none;}
			span{padding:8px;}
			.content{padding:20px;}
			.my_hr{	border:0;
					width:700; 
					height:10; 
					background:white;}
			.content_span{padding:0;}
		</style>
	</head>
	
	<body>
		<c:forEach var="vo" items="${list}">
			<form>
			<input type="hidden" name="c_idx" value="${ vo.c_idx }">
			<input type="hidden" name="pwd" value="${ vo.pwd }">
			
			<div class="dix">
			<hr class="my_hr">
			<span>작성자( ${ vo.name } )</span> / <span>작성일( ${ vo.regdate } )</span> / 
			
			<span align="right"><input type="password" name="c_pwd" placeholder="input_password">
			<input type="button" value="삭제" onclick="del_comment(this.form);"></span><br>
			
			<span>┕</span>
			<span class="content_span">${ vo.content }</span><br>
			<hr class="my_hr">
			</div>
			</form>
		</c:forEach>
		
		<div align="center">${ pageMenu }</div>
		
	</body>
</html>
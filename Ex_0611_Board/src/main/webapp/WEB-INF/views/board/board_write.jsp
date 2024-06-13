<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			table{border-collapse:collapse;
				  width:700px;
				  border-radius:10px;
				  width:700px;
				  margin:auto;
				  border-radius:10px;}
			caption{font-weight:bold;
					font-size:25px;
					padding:8px;}
				  
			th{	background-color:rgb(212, 244, 250);
				padding:8px;
				border: 3px solid white;}
				
			td{ background-color:rgb(255, 248, 228);
				border:1 solid lightgray;
				border: 3px solid white;}
			
			input{background-color:rgb(255, 248, 228);
				  border:1px solid lightgray;
				  border-radius:3px;
				  outline:none;}
			textarea{background-color:rgb(255, 248, 228);
				 	 border:1px solid lightgray;
				 	 border-radius:3px;}
		</style>
		<script>
			function send(f){
				//유효성 생략
				
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form name="f" method="post" action="insert.do">
		
		<table border="1" width="650" align="center">
			<caption>
				<marquee direction="down" scrollamount="2">
					::: 새 글 작 성 :::
				</marquee>
			</caption>
			<tr>
				<th colspan="2"></th>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="subject" size="50"></td>
			</tr>
		
			<tr>
				<th>작성자</th>
				<td><input name="name" size="50"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
				<textarea rows="10" cols="80" style="resize:none" name="content"></textarea>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
				<input type="password" name="pwd">
				</td>
			</tr>
			
			<tr>
				<th colspan="2" align="center">
					<input type="button" value="등록" onclick="send(this.form);">
					<input type="button" value="취소" onclick="history.go(-1);">
				</th>
			</tr>
			
		</table>
		
		</form>
	</body>
</html>
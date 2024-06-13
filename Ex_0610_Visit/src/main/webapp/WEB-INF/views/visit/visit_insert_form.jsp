<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				let name = f.name.value;
				let pwd = f.pwd.value;
				
				if(name == ''){
					alert("이름을 기입하세요");
					return;
				}
				if(pwd == ''){
					alert("비밀번호를 기입하세요");
					return;
				}
				
				f.action = "insert.do";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form method="post" enctype="multipart/form-data">
			<table border="1" align="center">
				<caption>::: 새 글 등록 :::</caption>
				
				<tr>
					<th>작성자</th>
					<td><input name="name"></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="5" cols="50" style="resize:non;"
									wrap="on" name="content"></textarea>
					</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="photo"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="확인" onclick="send(this.form);">
						<input type="button" value="취소" onclick="history.go(-1);">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
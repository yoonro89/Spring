<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				let deptno = f.deptno.value;
				let dname = f.dname.value;
				let loc = f.loc.vlaue;
				
				//유효성체크
				let num_pattern = /^[0-9]*$/;
				if( deptno == '' || !num_pattern.test(deptno) ){
					alert("부서번호는 정수로 입력하세요");
					return;
				}
				
				if( dname == '' ){
					alert("부서이름을 입력하세요");
					return;
				}
				
				if( loc == '' ){
					alert("부서위치를 입력하세요");
					return;
				}
				
				f.action = "insert.do";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form>
			<table border="1" align="center">
				<caption>:::부서 추가:::</caption>
				<tr>
					<th>부서번호</th>
					<td>
						<input name="deptno">
					</td>
				</tr>
				
				<tr>
					<th>부서이름</th>
					<td>
						<input name="dname">
					</td>
				</tr>
				
				<tr>
					<th>부서위치</th>
					<td>
						<input name="loc">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="새 부서 추가" onclick="send(this.form)">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
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
		</style>
		
		<script>
			function add(f){
				let sabun = f.sabun.value;
				let deptno = f.deptno.value;
				
				//check
				let patterncheck = /^[0-9]*$/;
				if(sabun == ''){
					alert("사번은 필수 입력 사항입니다.")
					return;
				}else if(!patterncheck.test(sabun)){
					alert("사번은 정수로 입력하세요")
					return;
				}
				
				if(deptno == ''){
					alert("부서번호는 필수 입력 사항입니다");
					return;
				}else if(!patterncheck.test(deptno)){
					alert("부서번호는 정수로 입력하세요");
					return;
				}
				
				f.action = "insert.do";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form>
			<table>
				<caption>:::사원 추가:::</caption>
				<tr>
					<th>사번</th>
					<td>
						<input name="sabun">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input name="saname">
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input name="sagen">
					</td>
				</tr>
				<tr>
					<th>부서No</th>
					<td>
						<input name="deptno">
					</td>
				</tr>
				<tr>
					<th>직책</th>
					<td>
						<input name="sajob">
					</td>
				</tr>
				<tr>
					<th>입사일</th>
					<td>
						<input name="sahire">
					</td>
				</tr>
				<tr>
					<th>상사No</th>
					<td>
						<input name="samgr">
					</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>
						<input name="sapay">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="추가" onclick="add(this.fomr);">
				</tr>
			</table>
		</form>
	</body>
</html>
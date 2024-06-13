<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			table{border-collapse:collapse;
				  border:2px solid black;
				  text-align:center;}
			
		</style>
		
		<script src="/db/resources/js/httpRequest.js"></script>
		
		<script>
			function modify(f){
				
				let url = "modify.do";
				let param = "sabun="+f.sabun.value+"&m_sabun="+f.m_sabun.value+
							"&saname="+f.saname.value+"&sagen="+f.sagen.value+
							"&deptno="+f.deptno.value+"&sajob="+f.sajob.value+
							"&sahire="+f.sahire.value+"&samgr="+f.samgr.value+
							"&sapay="+f.sapay.value;
				
				sendRequest(url, param, resultFn, "post");
			}
			
			function resultFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					let data = xhr.responseText;
					
					if( data == 'no' ){
						alert("수정실패");
						return;
					}else{
						alert("수정완료");
						location.href="list.do";
					}
					
				}
			}
		</script>
		
	</head>
	
	<body>
		<form>
			
			<input type="hidden" name="sabun" value="${vo.sabun}">
			
			<table>
				<caption>:::사원 정보 수정:::</caption>
				<tr>
					<th>사번</th>
					<td>
						<input name="m_sabun" value="${vo.sabun}">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input name="saname" value="${vo.saname}">
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input name="sagen" value="${vo.sagen}">
					</td>
				</tr>
				<tr>
					<th>부서No</th>
					<td>
						<input name="deptno" value="${vo.deptno}">
					</td>
				</tr>
				<tr>
					<th>직책</th>
					<td>
						<input name="sajob" value="${vo.sajob}">
					</td>
				</tr>
				<tr>
					<th>입사일</th>
					<td>
						<input name="sahire" value="${vo.sahire}">
					</td>
				</tr>
				<tr>
					<th>상사No</th>
					<td>
						<input name="samgr" value="${vo.samgr}">
					</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>
						<input name="sapay" value="${vo.sapay}">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="완료" onclick="modify(this.fomr);">
				</tr>
			</table>
		</form>
	</body>
</html>
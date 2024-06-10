<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- Ajax사용을 위한 httpRequest.js가져오기 -->
		<script src="/db/resources/js/httpRequest.js"></script>
				<!--  └─패키지의 맨 마지막 이름을 가져와서 resources폴더로 바로 접근함. -->
		
		<script>
			function modify(f){
				
				let url = "modify.do";
				let param = "deptno="+f.deptno.value+"&c_deptno="+f.c_deptno.value+
							"&dname="+f.dname.value+"&loc="+f.loc.value;
				
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
			
			<input type="hidden" name="deptno" value="${vo.deptno}">
			
			<table border="1" align="center">
				<caption>:::부서 정보 수정:::</caption>
				<tr>
					<th>부서번호</th>
					<td>
						<input name="c_deptno" value="${vo.deptno}">
					</td>
				</tr>
				
				<tr>
					<th>부서이름</th>
					<td>
						<input name="dname" value="${vo.dname}">
					</td>
				</tr>
				
				<tr>
					<th>부서위치</th>
					<td>
						<input name="loc" value="${vo.loc}">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="modify(this.form)">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
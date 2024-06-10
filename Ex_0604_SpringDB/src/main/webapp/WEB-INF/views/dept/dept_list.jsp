<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function del(no){
				if( !confirm("정말 삭제합니까?")){
					return;
				}
				
				location.href="del_dept.do?deptno="+no;
				
			}
		</script>
		
	</head>
	
	<body>
		<table border="1" align="center">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>위치</th>
				<th colspan="2">비고</th>
			</tr>
			
			<c:forEach var="vo" items="${list}">
			<tr>
				<td>${ vo.deptno }</td>
				<td>${ vo.dname }</td>
				<td>${ vo.loc }</td>
				
				<td><!-- ※jsp에서 jsp로 바로 이동할 수 없다.(controller를 거쳐야만 한다.) -->
					<input type="button" value="수정" 
						onclick="location.href='modify_form.do?deptno=${vo.deptno}'">
				</td>
				
				<td>
					<input type="button" value="삭제" 
						onclick="del('${vo.deptno}')">
				</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5" align="right">
					<input type="button" value="추가" 
						onclick="location.href='insert_form.do'">
				</td>
			</tr>
			
		</table>
	</body>
</html>
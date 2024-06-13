<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			table{border-collapse:collapse;
				  background-color:rgb(212, 244, 250);
				  border-radius:10px;
				  text-align:center;
				  width:700px;
				  margin:auto;
				  }
			caption{font-weight:bold;
					font-size:25px;
					padding:8px;}
			th{background:rgb(178, 204, 255);
			   border-radius:10px;}
			input{background-color:rgb(255, 248, 228);
				  border:1px solid lightgray;
				  border-radius:3px;
				  outline:none;}
			.evenoddC:nth-child(even){background-color:rgb(242, 244, 250);}
		</style>
		
		<script>
			function del(num){
				if( !confrim("정말 삭제합니까?") ){
					return;
				}
				location.href="del_sawon.do?sabun="+num;
			}
		</script>
		
	</head>
	
	<body>
		<table>
			<caption>::사원 목록::</caption>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>성별</th>
				<th>부서No</th>
				<th>직책</th>
				<th>입사일</th>
				<th>상사No</th>
				<th>급여</th>
				<th colspan="2">
					<input type="button" value="추가"
						onclick="location.href='insert_form.do'">
				</th>
			</tr>
			
			<c:forEach var="vo" items="${list}">
			<tr class="evenoddC">
				<td>${ vo.sabun }</td>
				<td>${ vo.saname }</td>
				<td>${ vo.sagen }</td>
				<td>${ vo.deptno }</td>
				<td>${ vo.sajob }</td>
				<td>${ vo.sahire }</td>
				<td>${ vo.samgr }</td>
				<td>${ vo.sapay }</td>
				
				<td>
					<input type="button" value="수정"
						onclick="location.href='modify_form.do?sabun=${vo.sabun}'">
				</td>
				
				<td>
					<input type="button" value="삭제"
						onclick="del('${vo.sabun}')">
				</td>
			</tr>
			</c:forEach>
		</table>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			table{border-collapse:collapse;
				  background-color:rgb(212, 244, 250);
				  border-radius:10px;
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
			
			select{background-color:rgb(255, 248, 228);
				  border:1px solid lightgray;
				  border-radius:3px;
				  outline:none;}
			.evenoddC:nth-child(even){background-color:rgb(242, 244, 250);}
			a{text-decoration:none;}
		</style>
		
		<script>
			window.onload=function(){
				let search = document.getElementById("search");
				let search_array = ['all', 'subject', 'name', 'content', 'name_subject_content'];
				
				for( let i = 0; i < search_array.length; i++ ){
					if('${param.search}' == search_array[i]){
						search[i].selected = true;
						
						let search_text = document.getElementById("search_text");
						search_text.value = '${param.search_text}';
					}
				}
			}
			
			function search(){
				//조회 카테고리
				let search = document.getElementById("search").value;
				
				//검색어
				let search_text = document.getElementById("search_text").value;
				
				if( search != 'all' && search_text == '' ){
					alert("검색할 내용을 입력하세요");
					return;
				}
				
				location.href="list.do?search="+search+
						"&search_text="+encodeURIComponent(search_text)+
						"&page=1";
				
			}
		</script>
		
	</head>
	
	<body>
		<div>
		<table>
			<caption>ﾟ･:✧ *:･ﾟ✧ *:･ﾟ✧ 게시판 연습중 ✧ﾟ･:* ✧ﾟ･:* ✧:･ﾟ</caption>
			
			<!-- 꾸미기 -->
			<tr>
				<td colspan="5"><marquee scrollamount="15" scrolldelay="3">ﾟ･:✧ *:･ﾟ✧ *:･ﾟ✧ 이건 움직이는 녀석 ✧ﾟ･:* ✧ﾟ･:* ✧:･ﾟ</marquee></td>
			</tr>
			<tr>
				<th align="center" width="7%">번호</th>
				<th align="center">제목</th>
				<th align="center" width="20%">작성자</th>
				<th align="center" width="20%">작성일</th>
				<th align="center" width="10%">조회수</th>
			</tr>
			
			<c:forEach var="vo" items="${list}">
			<tr class="evenoddC">
				<c:if test="${ vo.del_info ne -1 }">
					<td align="center">${vo.idx}</td>
				</c:if>
				
				<c:if test="${ vo.del_info eq -1 }">
					<td align="center">x</td>
				</c:if>
				
				<td>
					<c:forEach begin="1" end="${vo.depth}">&nbsp;</c:forEach>
					
					<!-- 댓글기호(ㄴ) 표시 -->
					<c:if test="${vo.depth ne 0 }">└</c:if>
					
					<c:if test="${vo.del_info ne -1 }">
						<a href="view.do?idx=${vo.idx}&page=${param.page}&search=${param.search}&search_text=${param.search_text}">
						${vo.subject}
						</a>
					</c:if>
					
					<c:if test="${vo.del_info eq -1 }">
						<font color="gray">삭제된 게시글 입니다</font>
					</c:if>
					
				</td>
				
				<c:if test="${vo.del_info ne -1 }">
					<td align="center">${vo.name}</td>
				</c:if>
				
				<c:if test="${vo.del_info eq -1 }">
					<td align="center">unknown</td>
				</c:if>
				
				<td align="center">
				${fn:split(vo.regdate, ' ')[0]}
				</td><!-- 함수 라이브러리를 이용하여 날짜만 사용
						 ('공백'을 기준으로 나누는 함수를 이용하여 0번째 인덱스(맨 앞)만을 사용) -->
				
				<td align="center">${vo.readhit}</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5" align="center">
					${ pageMenu }
				</td>
			</tr>
			
			<tr>
				<td colspan="4" align="center">
					
					<select id="search">
						<option value="all">전체보기</option>
						<option value="subject">제목</option>
						<option value="name">이름</option>
						<option value="content">내용</option>
						<option value="name_subject_content">이름+제목+내용</option>
					</select>
					
					<input id="search_text">
					<input type="button" value="검색" onclick="search();">
					
					<td colspan="5" align="right">
					<img src="/bbs/resources/img/btn_reg.gif" style="cursor:pointer" onclick="location.href='board_write.do'">
				</td>
				
			</tr>
		</table>
		</div>
	</body>
</html>
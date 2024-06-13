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
			
			
			
			.home_btn_cus{background-color:rgb(212, 244, 250);}
				 
			.index{	vertical-align: top;
					height:25px;
					border-radius:3px; }
			input{background-color:rgb(255, 248, 228);
				  border:1px solid lightgray;
				  border-radius:3px;
				  outline:none;}
			textarea{background-color:rgb(255, 248, 228);
				 	 border:1px solid lightgray;
				 	 border-radius:3px;}
			
			.comment_disp{background-color:white;
						  width:700px;
						  margin:0 auto;}
			a{text-decoration:none;}
		</style>
		<!-- stylestylestylestylestylestylestylestylestylestylestylestylestylestylestylestylestylestylestylestylestylestylestyle -->
		
		<!-- Ajax사용을 위한 js파일 -->
		<script src="/bbs/resources/js/httpRequest.js"></script>

		<script>
			//현재 보고 있는 댓글의 페이지 번호를 저장할 변수
			let comm_page = 1;
		
			//페이지가 실행되면 존재하는 comment를 보여준다
			window.onload = function(){
				comment_list(1);
			}
			
			//댓글 삭제를 위한 메서드
			function del_comment(f){
				let c_pwd = f.c_pwd.value;//입력받은 비번
				let pwd = f.pwd.value;//원본 비번
				let c_idx = f.c_idx.value;//삭제할 코멘트 번호
				
				if( c_pwd == '' ){
					alert("비밀번호는 필수 입력 사항입니다!");
					return;
				}
				if( c_pwd != pwd ){
					alert("비밀번호 불일치!");
					return;
				}
				
				//삭제를 위해 Ajax요청
				let url = "comment_del.do";
				let param = "c_idx="+c_idx;
				sendRequest(url, param, comm_delFn, "post");
			}
			
			function comm_delFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					let data = xhr.responseText;
					
					let json = (new Function('return '+data))();
					
					if(json[0].result == 'yes'){
						comment_list(comm_page);
					}else{
						alert("삭제 실패");
					}
				}
			}
			
			//글 삭제를 위한 메서드
			function del(){
				if( !confirm("삭제 하겠습니까?") ){
					return;
				}
				
				let c_pwd = document.getElementById("c_pwd").value;
				
				if( c_pwd != '${vo.pwd}' ){
					alert("비밀번호 불일치");
					return;
				}
				
				let url = "del.do";
				let param = "idx=${vo.idx}";
				sendRequest(url, param, resultFn, "post");
				
			}//del()
			
			function resultFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					//"[{'rsult':'yes'}]"
					let data = xhr.responseText;
					let json = (new Function('return '+data))();
					
					if( json[0].result == 'yes' ){
						alert("삭제 성공");
						location.href="list.do?page=${param.page}";
					}else{
						alert("삭제 실패");
					}
				}
			}
		
			function reply(){
				location.href="reply_form.do?idx=${vo.idx}&page=${param.page}";
			}
			
			/* comment등록 메서드 */
			function send(f){
				//유효성 생략
				
				let url = "comment_insert.do";
				let param = "idx=${vo.idx}&name="+f.name.value+"&content="+f.content.value+"&pwd="+f.pwd.value;
				
				sendRequest(url, param, commentFn, "post");
				
				//form태그에 포함되어있는 모든 입력상자의 값을 초기화
				f.reset();
			}
			
			function commentFn(){
				if(xhr.readyState == 4 && xhr.status == 200){
					
					let data = xhr.responseText;
					let json = (new Function('return ' + data))();
					
					if(json[0].result == 'yes'){
						comment_list(comm_page);
					}else{
						alert("등록실패");
					}
					
					
				}
			}
			
			/* 코멘트 작성 완료 후, 해당 게시글에 대한 코멘트만 추려내서 가져온 결과 */
			function comm_list_fn(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					document.getElementById("comment_disp").innerHTML = data;
				}
			}
			
			function comment_list(comm_page){
				
				let url = "comment_list.do";
				let param = "idx=${vo.idx}&page="+comm_page;
				sendRequest(url, param, comm_list_fn, "post");
			}
		</script>
		
	</head>
	
	<body>
		<form name="f" method="post">
			<table align="center">
				<caption>ﾟ･:✧ *:･ﾟ✧ *:･ﾟ✧ 상세보기 ✧ﾟ･:* ✧ﾟ･:* ✧:･ﾟ</caption>
				<tr>
					<th colspan="2"></th>
				</tr>
				
				<tr>
					<th>제목</th>
					<td>${vo.subject}</td>
				</tr>

				<tr>
					<th>작성자</th>
					<td>${vo.name}</td>
				</tr>

				<tr>
					<th>작성일</th>
					<td>${vo.regdate}</td>
				</tr>

				<tr>
					<th>IP</th>
					<td>${vo.ip}</td>
				</tr>

				<tr>
					<th>내용</th>
					<td><pre>${vo.content}</pre></td>	<!-- pre : 엔터값을 포함한 모든 내용 가져오는 태그 -->
				</tr>
				
				<tr>
					<th>비번</th>
					<td>
						<input type="password" id="c_pwd">
					</td>
				</tr>
				
				<tr align="center">
					<td class="home_btn_cus" colspan="2">
						<!-- 목록으로 -->
						<input type="button" value="홈으로" class="index" 
							onclick="location.href='list.do?page=${param.page}&search=${param.search}&search_text=${param.search_text}'">
						
						<c:if test="${ vo.depth lt 1 }">
						<!-- 댓글 -->
						<img src="/bbs/resources/img/btn_reply.gif" onclick="reply();" style="cursor:pointer;">
						</c:if>

						<!-- 수정 -->
						<img src="/bbs/resources/img/btn_modify.gif" onclick="modify();" style="cursor:pointer;">
						
						<!-- 삭제 -->
						<img src="/bbs/resources/img/btn_delete.gif" onclick="del();" style="cursor:pointer;">
						
					</td>
				</tr>
			</table>
		</form>
		<hr width="700" color="navy">
		<div>
		<form>
			<table align="center">
				<tr>
					<th colspan="2"></th>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td><input name="name"></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea rows="5" cols="87" style="resize:none" name="content"></textarea></td>
				</tr>
				
				<tr>
					<th>비번</th>
					<td>
						<input type="password" name="pwd">
						<input type="button" value="등록" onclick="send(this.form);">
					</td>
				</tr>
				
				<tr>
					<th colspan="2"></th>
				</tr>	
			</table>
		</form>
		</div>
		<hr width="700" color="navy">
		<div id="comment_disp" class="comment_disp" align="center">
			여기가 comment가 들어갈 자리
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#board_content{
		width: 800px;
		margin: 0 auto;
/* 		border: 1px solid black; */
	}
	#board_tb{
		width: 100%;
		border-collapse: collapse;
		text-align: center;
	}
	#board_tb td{
		height : 80px;
		border: 1px solid black;
/* 		overflow: hidden; */
	}
	.board_img{
 		position: absolute; 
		top: 50%;
  		left: 50%;
		transform: translate(-50%, -50%);
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script>
	$(function(){
		$("#board_comm_write").on("click", function(){
			if (${not empty user_id}){
				location="board_comm_write";
			}else{
				if(confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하시겠습니까?")){
					location="login";
				}
			}
		});
	});
</script>
</head>
<body>
<c:import url="/nav">
		<c:param name="user_id" value="${user_id}"/>
</c:import>
	<div id="board_content">
		<table id="board_tb">
		<caption><h1>커뮤니티 게시판</h1></caption>
			<tr>
				<td width="7%">글번호</td>
				<td width="70%">제목</td>
				<td width="10%">작성자</td>
				<td width="13%">날짜</td>
			</tr>
				<c:forEach items="${list}" var="list" varStatus="status">
					<tr>
						<td>
							${list.comm_key}
						</td>
						<td>
						<a href="board_comm_content?comm_key=${list.comm_key}">
							${list.comm_title}
						</a>
						</td>
						<td>
							${list.user_id}
						</td>
						<td>
							${list.comm_date}
						</td>
					</tr>
				</c:forEach>
		</table>
		<table id="board_tb">
			<tr>
				<td colspan="4" style="height: 50px; text-align: right; background-color:rgba(0,0,0,0); border: 0;">
					<input type="text" id="search_input">
					<input type="button" id="search_btn" value="검색">
					<input type="button" id="board_comm_write" value="글쓰기">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
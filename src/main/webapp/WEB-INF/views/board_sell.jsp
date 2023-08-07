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
		$("#board_sell_write").on("click", function(){
			if (${not empty user_id}){
				location="board_sell_write";
			}else{
				if(confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하시겠습니까?")){
					location="login";
				}
			}
		});
		
		for(var i = 1; i<=10; i++){
			var img = $("#board_img_"+i);
			if(img.length > 0){
				img.css("object-fit","cover");
				img.css("width","100%");
				img.css("height","100%");
			}
		}
	});
</script>
</head>
<body>
<c:import url="/nav">
		<c:param name="user_id" value="${user_id}"/>
</c:import>
	<div id="board_content">
		<table id="board_tb">
		<caption><h1>거래 게시판</h1></caption>
			<tr>
				<td width="7%">글번호</td>
				<td width="10%">썸네일</td>
				<td width="40%">상품명</td>
				<td width="14%">가격</td>
				<td width="14%">작성자</td>
				<td width="15%">날짜</td>
			</tr>
<%-- 			<c:if test="${list}!=null"> --%>
				<c:forEach items="${list}" var="list" varStatus="status">
					<tr>
						<td>${list.board_key}</td>
						<td>
<!-- 							다수 이미지일 때 첫번째 이미지를 썸네일로 -->
							<c:set var="img" value="${list.board_img}"/>
							<c:set var="commaIndex" value="${fn:indexOf(img, ',')}"/>
							<c:set var="imgPath" value="${fn:substring(img, 0, commaIndex)}"/>
							<div style="margin: auto; width: 79px; height:79px; overflow: hidden; position: relative;">
								<img class="board_img" id="board_img_${status.count}" src="/image/${imgPath}" >
							</div>
						</td>
						<td>
							<a href="board_sell_content?board_key=${list.board_key}">
								${list.board_title}
							</a>
						</td>
						<td>${list.board_price}</td>
						<td>${list.user_id}</td>
						<td>${list.board_date}</td>
					</tr>
				</c:forEach>
<%-- 			</c:if> --%>
			<tr>
				<td colspan="4">
					<input type="text" id="search_input">
					<input type="button" id="search_btn" value="검색">
				</td>
				<td colspan="2">
					<input type="button" id="board_sell_write" value="글쓰기">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
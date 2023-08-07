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
		margin: 0 auto;
 		border: 1px solid black;
 		min-width: 800px;
		width: 90%;
		min-height: 300px;
	}
	#board_tb{
/* 		border: 1px solid black; */
		width: 100%;
		border-collapse: collapse;
		text-align: center;
	}
	#board_tb td{
		padding: 20px;
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
		$("#board_rcp_write").on("click", function(){
			if (${not empty user_id}){
				location="board_rcp_write";
			}else{
				if(confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하시겠습니까?")){
					location="login";
				}
			}
		});
		
		for(var i = 1; i<=10; i++){
			var img = $("#rcp_img_"+i);
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
	<h1 style="text-align: center;">레시피 게시판</h1>
	<div id="board_content">
		<table id="board_tb">
			<tr>
				<c:forEach items="${list}" var="list" varStatus="status">
					<td>
<%-- 						${list.rcp_key}<br> --%>
<!-- 							다수 이미지일 때 첫번째 이미지를 썸네일로 -->
							<c:set var="img" value="${list.rcp_img}"/>
							<c:set var="commaIndex" value="${fn:indexOf(img, ',')}"/>
							<c:set var="imgPath" value="${fn:substring(img, 0, commaIndex)}"/>
							<div style="margin: auto; width: 200px; height:200px; overflow: hidden; position: relative;">
								<img class="rcp_img" id="rcp_img_${status.count}" src="/image/${imgPath}" >
							</div>
						<br>
							<a href="board_rcp_content?rcp_key=${list.rcp_key}">
								${list.rcp_title}
							</a>
						<br>
						<div style="overflow: hidden;">
							<c:set var="tag" value="${list.rcp_tag}"/>
							<c:set var="tags" value="${fn:replace(tag, '|', '&nbsp;')}"/>
							${tags}
						</div>
						<br>
						user : <b>${list.user_id}</b>
				</td>
				<c:if test="${status.count % 3 == 0}">
					</tr><tr>
				</c:if>
				</c:forEach>
				</tr>
			</table>
		</div>
		<table style="min-width: 800px; width: 90%; margin: auto; text-align: right;">
			<tr>
				<td>
					<input type="text" id="search_input">
					<input type="button" id="search_btn" value="검색">
					<input type="button" id="board_rcp_write" value="글쓰기">
				</td>
			</tr>
		</table>
</body>
</html>
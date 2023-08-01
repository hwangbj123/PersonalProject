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
	#board_content{
		width: 800px;
		margin: 0 auto;
		border: 1px solid black;
	}
	#board_tb{
		width: 100%;
		border-collapse: collapse;
		text-align: center;
	}
	#board_tb td{
		height : 80px;
		border: 1px solid black;
	}
	#board_tb td img{
		display: inline-block;
	}
	textarea{
		width: 90%;
		height: 100px;
		margin: 10px auto;
		resize: none;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script>
	$(function(){
		$("#td_img").height("400px");
		var td_img = 0;
		$("#big").on("click", function(){
			if (td_img==0){
				$("#td_img").css("height","auto");
				td_img = 1;
			}else{
				$("#td_img").css("height","400px");
				td_img = 0;
			}
		})
	});
</script>
</head>
<body>
	<div id="board_content">
		<form method="post" action="#">
			<table id="board_tb">
				<tr>
					<td width="20%">작성자</td>
					<td>
						${content.user_id}
<!-- 						<input type="text" name="user_id"> -->
					</td> 
				</tr>
				<tr>
					<td width="20%">제목</td>
					<td>
						${content.comm_title}
					</td> 
				</tr>
				<tr>
					<td><span id="big">이미지</span></td>
					<td id="td_img">
						<div style="height: 100%; overflow: auto;">
						<c:set var="imgs" value="${fn:split(content.comm_img,',')}"/>
						<c:forEach var="img" items="${imgs}">
							<img src="/image/${fn:trim(img)}" style="width: 90%;">
						</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						${content.comm_content }
					</td> 
				</tr>
				<tr>
					<td colspan="2">
					<c:if test="${content.user_id eq user_id}">
						<input type="button" onclick="location='board_comm_modify'" value="수정하기">
					</c:if>
						<input type="button" onclick="location='board_comm'"value="목록">
					</td>
				</tr>
				<c:if test="${not empty content.user_id}">
				<tr>
					<td colspan="2">
						<input type="hidden" name="reply_id" value="${user_id}">
						<textarea name="reply_content"></textarea><br>
						<input type="button" name="reply_btn" value="댓글달기">
					</td>
				</tr>
				</c:if>
			</table>
		</form>
	</div>
</body>
</html>
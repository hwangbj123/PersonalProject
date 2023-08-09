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
		});
		
		$("#reply_btn").on("click", function(){
			if (${not empty user_id}){
				 if($("textarea[name='reply_content']").val().length ==0){
						alert("댓글 내용을 입력해주세요");
				}else{
					var replyData = $("#reply_frm").serialize();
					$.ajax({
						type: "post",
						url: "board_reply_write",
						data: replyData,
						success: function(){
							alert("댓글을 작성하였습니다");
							location.reload();
						},
						error: function(){
							alert("오류발생");
						}
					});
				}
		}else{
			if(confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하시겠습니까?")){
				location="login";
			}
		}
	});
});
	function comm_delete(comm_key){
		if(confirm("정말 삭제하시겠습니까?")){
			alert("게시글이 삭제되었습니다");
			location="board_comm_delete?comm_key="+comm_key;	
		}
	}
</script>
</head>
<body>
<c:import url="/nav">
		<c:param name="user_id" value="${user_id}"/>
</c:import>
	<div id="board_content">
			<table id="board_tb">
			<caption><h1>${content.comm_title}</h1></caption>
				<tr>
					<td width="20%">작성자</td>
					<td>
						${content.user_id}
<!-- 						<input type="text" name="user_id"> -->
					</td> 
				</tr>
<!-- 				<tr> -->
<!-- 					<td width="20%">제목</td> -->
<!-- 					<td> -->
<%-- 						${content.comm_title} --%>
<!-- 					</td>  -->
<!-- 				</tr> -->
				<tr>
					<td rowspan="2">내용</td>
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
					<td>
						${content.comm_content }
					</td> 
				</tr>
				<tr>
					<td colspan="2">
					<c:if test="${content.user_id eq user_id}">
						<input type="button" onclick="location='board_comm_modify?comm_key=${content.comm_key}'" value="수정하기">
						<input type="button" onclick="comm_delete(${content.comm_key})" value="삭제하기">
					</c:if>
						<input type="button" onclick="location='board_comm'"value="목록">
					</td>
				</tr>
				<c:forEach items="${reply}" var="reply">
					<tr>
						<td>
							<c:if test="${rereply_key eq reply.reply_key}">
								[대댓글]<br>
							</c:if>
							${reply.reply_id}<br>
							${reply.reply_date}
						</td>
						<td style="text-align: left; padding: 10px;">
							${reply.reply_content}<br>
						</td>
					</tr>
					<c:set var="rereply_key" value="${reply.reply_key}"/>
				</c:forEach>
				<c:if test="${not empty content.user_id}">
				<tr>
					<td colspan="2">
						<form method="post" id="reply_frm" action="board_reply_write">
								<input type="hidden" name="comm_key" value="${content.comm_key}">
								<input type="hidden" name="reply_id" value="${user_id}">
								<textarea name="reply_content"></textarea><br>
								<button type="button" id="reply_btn">댓글달기</button>
						</form>
					</td>
				</tr>
				</c:if>
			</table>
	</div>
</body>
</html>
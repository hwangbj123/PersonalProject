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
						${content.board_title}
					</td> 
				</tr>
				<tr>
					<td><span id="big">상품</span></td>
					<td id="td_img">
						<div style="height: 100%; overflow: auto;">
						<c:set var="imgs" value="${fn:split(content.board_img,',')}"/>
						<c:forEach var="img" items="${imgs}">
							<img src="/image/${fn:trim(img)}" style="width: 90%;">
						</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						${content.board_content }
					</td> 
				</tr>
				<tr>
					<td>가격</td>
					<td>
						${content.board_price}
					</td>
				</tr>
				<tr>
					<td>
						거래상태
					</td>
					<td>
						<c:if test="${content.board_res == '0'}">
							<c:out value="판매 중"/>
						</c:if>
						<c:if test="${content.board_res == '1'}">
							<c:out value="판매 완료"/>
						</c:if>
					</td>
				</tr>
				<tr id="tr_modify">
					<td colspan="2">
						<input type="submit" value="수정하기">
						<input type="button" onclick="location='board_sell'"value="목록">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
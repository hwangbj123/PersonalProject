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
		$("#modify_btn").on("click",function(){
			alert("수정되었습니다");
			$("#modify_frm").submit();
		});
	});
</script>
</head>
<body>
<c:import url="/nav">
		<c:param name="user_id" value="${user_id}"/>
</c:import>
	<div id="board_content">
		<form method="post" id="modify_frm" action="board_sell_modify_method" enctype="multipart/form-data">
			<table id="board_tb">
				<tr>
					<td width="20%">작성자</td>
					<td>
						${content.user_id}
					</td> 
				</tr>
				<tr>
					<td width="20%">제목</td>
					<td>
						<input type="text" name="board_title" value="${content.board_title}">
						<input type="hidden" name="board_key" value="${content.board_key}">
					</td> 
				</tr>
				<tr>
					<td  id="big">상품</td>
					<td>
						<input type="file" id="upload_btn" name="board_img" multiple="multiple" value="상품 등록">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<input type="text" name="board_content" value="${content.board_content}">
					</td> 
				</tr>
				<tr>
					<td>가격</td>
					<td>
						<input type="text" name="board_price" value="${content.board_price}">
					</td>
				</tr>
				<tr>
					<td>
						거래상태
					</td>
					<td>
						<c:if test="${content.board_res == '0'}">
							<c:out value="판매 중"/>
							<c:if test="${content.user_id eq user_id}">
								<br><input type="button" id="sellout_btn" value="판매완료하기">
							</c:if>
						</c:if>
						<c:if test="${content.board_res == '1'}">
							<c:out value="판매 완료"/>
						</c:if>
					</td>
				</tr>
				<tr id="tr_modify">
					<td colspan="2">
						<c:if test="${content.user_id eq user_id}">
							<input type="button" id="modify_btn" value="수정하기">
						</c:if>
						<input type="button" onclick="location='board_sell'"value="목록">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	});
</script>
</head>
<body>
<c:import url="/nav">
		<c:param name="user_id" value="${user_id}"/>
</c:import>
	<div id="board_content">
		<form method="post" action="board_comm_upload" enctype="multipart/form-data">
			<table id="board_tb">
				<caption><h1>커뮤니티 작성</h1></caption>
				<tr>
					<td width="20%">제목</td>
					<td>
						<input type="text" name="comm_title">
						<input type="hidden" name="user_id" value="${user_id}">
					</td> 
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="comm_content"></textarea>
					</td> 
				</tr>
				<tr>
					<td>이미지</td>
					<td>
						<input type="file" id="upload_btn" name="comm_img" multiple="multiple" value="이미지 첨부">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="글쓰기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
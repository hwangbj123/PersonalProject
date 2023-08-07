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
		<form method="post" id="modify_frm" action="board_comm_modify_method" enctype="multipart/form-data">
			<table id="board_tb">
				<tr>
					<td width="20%">작성자</td>
					<td>
						${content.user_id}
						<input type="hidden" name="comm_key" value="${content.comm_key}">
					</td> 
				</tr>
				<tr>
					<td width="20%">제목</td>
					<td>
						<input type="text" name="comm_title" value="${content.comm_title}">
					</td> 
				</tr>
				<tr>
					<td><span id="big">이미지</span></td>
					<td>
						<input type="file" id="upload_btn" name="comm_img" multiple="multiple" value="이미지 첨부">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="comm_content" >${content.comm_content}</textarea>
					</td> 
				</tr>
				<tr id="tr_modify">
					<td colspan="2">
					
						<input type="button" id="modify_btn" value="수정하기">
						<input type="button" onclick="location='board_comm'"value="목록">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
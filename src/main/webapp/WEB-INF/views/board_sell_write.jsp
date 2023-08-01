<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script>
	$(function(){
	});
</script>
</head>
<body>
	<div id="board_content">
		<form method="post" action="write_res" enctype="multipart/form-data">
			<table id="board_tb">
				<caption><h1>거래 작성</h1></caption>
<!-- 				<tr> -->
<!-- 					<td width="20%">아이디(임시)</td> -->
<!-- 					<td> -->
<!-- 						<input type="text" name="user_id"> -->
<!-- 					</td>  -->
<!-- 				</tr> -->
				<tr>
					<td width="20%">제목</td>
					<td>
						<input type="text" name="board_title">
						<input type="hidden" name="user_id" value="${user_id}">
					</td> 
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="board_content"></textarea>
					</td> 
				</tr>
				<tr>
					<td>상품</td>
					<td>
						<input type="file" id="upload_btn" name="board_img" multiple="multiple" value="상품 등록">
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						<input type="number" name="board_price">
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
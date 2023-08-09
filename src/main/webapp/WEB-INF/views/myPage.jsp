<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<style>
	#main_tb{
		border-collapse: collapse;
		border: 1px solid black;
		width: 700px; height: 700px;
		margin: 200px auto;
		text-align: center;
	}
	#main_tb td{
/* 		border: 1px solid black; */
		background-color: rgba(250,250,250,0.9);
	}
	#main_tb td a{
		font-size: 2em;
	}
	#main_tb td:hover{
 		background-color: #fff;
	}
	
</style>
</head>
<body>
<c:import url="/nav">
		<c:param name="user_id" value="${user_id}"/>
</c:import>
<!-- <div class="container"></div> -->
<table id="main_tb">
	<tr>
		<td colspan="2"><a href="board_rcp">${info.user_id} 님 환영합니다</a></td>
	</tr>
	<tr>
		<td style="width: 50%;"><a href="#">작성한 커뮤니티</a></td>
		<td style="width: 50%;"><a href="#">관심 레시피 목록</a></td>
	</tr>
</table>
</body>
</html>
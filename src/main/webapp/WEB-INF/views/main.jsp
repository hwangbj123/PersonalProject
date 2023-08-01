<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script>
	$(function(){
		
		if(${not empty user_id}){
			$("#login").val("로그아웃");
			$("#login").attr("onclick", "location='logout'");
			
			$("#signup").hide();
		}
	});
</script>
<style>
	nav{
		width: 100%;
		margin: 0;
		display: inline-block;
		background-color: lightgreen;
	}
	#main_img{
		background-color: lightblue;
		width: 100%;
		height: 300px;
	}
	ul{
		display: flex;
		list-style: none;
	}
	ul li{
		margin: 0 20px auto;
	}
</style>
</head>
<body>
	<nav>
	<div style="width: 50%; float: left">
		<ul id="nav_menu">
			<li>페이지 소개</li>
			<li><a href="board_sell">거래</a></li>
			<li><a href="board_comm">커뮤니티</a></li>
			<li>고객센터</li>
		</ul>
	</div>
	<div style="width: 50%; float: right">
		<ul id="nav_login" >
			<li>검색</li>
<!-- 			<li><a id="login" href="login">로그인</a></li> -->
			<li><input type="button" id="login" onclick="location='login'" value="로그인"></li>
			<li><input type="button" id="signup" onclick="location='signup'" value="회원가입"></li>
		</ul>
	</div>
	</nav>
	<div id="main_img">
		img_path
	</div>
</body>
</html>
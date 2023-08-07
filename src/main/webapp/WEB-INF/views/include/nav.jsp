<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	nav{
		width: 100%;
		margin: 0;
		display: inline-block;
		background-color: #eee;
	}
	ul{
		display: flex;
		list-style: none;
	}
	ul li{
		margin: 0 20px auto;
	}
	a{
		text-decoration: none;
		color: black;
		font-size: 17px;
	}
</style>
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
</head>
<body>
<nav>
	<div style="width: 50%; float: left">
		<ul id="nav_menu">
			<li><a href="main">메인</a></li>
			<li><a href="board_rcp">거래</a></li>
			<li><a href="board_comm">커뮤니티</a></li>
			<li><a href="myPage">마이페이지</a></li>
		</ul>
	</div>
	<div style="width: 50%; float: right">
		<ul id="nav_login" >
			<li>
				<input type="text" id="search_input">&nbsp;
				<input type="button" id="search" value="검색">
			</li>
			<li><input type="button" id="login" onclick="location='login'" value="로그인"></li>
			<li><input type="button" id="signup" onclick="location='signup'" value="회원가입"></li>
		</ul>
	</div>
</nav>
</body>
</html>
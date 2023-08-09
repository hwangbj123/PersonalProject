<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin: 50px 0px;
	}
	.container{
		background-image: url("/images/Worldwide-Food.jpg");
		width: 100%;
		height: 100%;
 		opacity: 0.7;
 		position: fixed;
 		background-repeat: no-repeat;
 		background-size: cover;
        background-attachment: fixed;
 		z-index: -1;
	}
	nav{
		position: fixed;
		top: 0px;
		width: 100%;
		display: inline-block;
		background-color: #ffeede;
		z-index: 99;
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
	td{
		background-color: rgba(255,255,255,0.9);
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
		$("#myPage_btn").on("click", function(){
			if(${not empty user_id}){
				location="myPage";
			}else{
				if(confirm("로그인이 필요한 서비스입니다\n로그인창으로 이동하시겠습니까?")){
					location="login";
				}
			}
		});
		$("#search").on("click", function(){
			if($("#search_input").val().length!=0){
				location="board_rcp_search?search_input="+$("#search_input").val();
			}
		});
	});
</script>
</head>
<body>
<nav>
	<div style="width: 50%; float: left">
		<ul id="nav_menu">
			<li><a href="main">메인</a></li>
			<li><a href="board_rcp">레시피</a></li>
			<li><a href="board_comm">커뮤니티</a></li>
			<li><a href="#" id="myPage_btn">마이페이지</a></li>
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
<div class="container"></div>
</body>
</html>
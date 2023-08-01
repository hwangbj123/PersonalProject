<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		table {
			width: 600px;
			border-collapse: collapse;
		}
		th,td{
			border: 1px solid #cccccc;
			padding: 3px;
		}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#login_btn").on("click",function(){
			if ($.trim($("#user_id").val()) == "") { // $.trim : 스페이스바 공백 제거
				alert("아이디를 입력해 주세요");
				$("#user_id").focus();
				return false;
			}
			if ($.trim($("#user_pwd").val()) == "") { // $.trim : 스페이스바 공백 제거
				alert("비밀번호를 입력해 주세요");
				$("#user_pwd").focus();
				return false;
			}
			user_pwd = $("#user_pwd").val();
			var formData = $("#frm").serialize();
			$.ajax({ // form-action 대신 ajax 사용
				 type: "post"
				,data: formData
				,url: "login_check"
// 				,dataType: "text"
				,success: function(data){
					if(data==1){
						alert("로그인 성공");
						$("#frm").submit();
					}else{
						alert("아이디 혹은 비밀번호가 맞지 않습니다");
					}
				}
				,error: function(){
					alert("오류발생");
				}
			});
		});
	});
	</script>
</head>
<body>
	<form id="frm" action="login_ok">
		<table>
			<caption><h1>로그인</h1></caption>
			<tr>
				<th width="20%">아이디</th>
				<td width="80%"><input type="text" id="user_id" name="user_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="user_pwd" name="user_pwd"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<button type="button" id="login_btn">로그인</button>
					<button type="button" onclick="location='signup'">회원가입</button>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<button type="button" onclick="location='find_id'">아이디 찾기</button>
					<button type="button" onclick="location='find_pwd'">비밀번호 찾기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
















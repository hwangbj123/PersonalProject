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
		function fn_submit() {
// 			if ($("#title").val() == "") {
			if ($.trim($("#user_id").val()) == "") { // $.trim : 스페이스바 공백 제거
				alert("아이디 입력해 주세요!");
				$("#user_id").focus();
				return false;
			}
// 			if ($("#pass").val() == "") {
			if ($.trim($("#user_pwd").val()) == "") { // $.trim : 스페이스바 공백 제거
				alert("비밀번호를 입력해 주세요!");
				$("#user_pwd").focus();
				return false;
			}
			var formData = $("#frm").serialize();
			$.ajax({ // form-action 대신 ajax 사용
				 type: "post"
				,data: formData
				,url: "register"
// 				,dataType: "text"
				,success: function(){
					alert("저장완료");
				}
				,error: function(){
					alert("오류발생");
				}
			});
		}
	</script>
</head>
<body>
	<form id="frm">
		<table>
			<caption>회원가입</caption>
			<tr>
				<th width="20%">아이디</th>
				<td width="80%"><input type="text" id="user_id" name="user_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="user_pwd" name="user_pwd"></td>
			</tr>
			<tr>
				<th><label for="pass"></label>비밀번호 확인</th>
				<td><input type="password" id="user_pwd_c" name="user_pwd_c"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="user_name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="user_email"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="user_tel"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="user_addr"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<button type="submit" onclick="fn_submit(); return false;">가입</button>
					<input type="button" onclick="location='login'" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
















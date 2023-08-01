<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>123</td>
	</tr>
	<c:forEach var="param" items="${list}">
	<tr><td>${param}</td></tr>
	<tr><td>${param.save_ImgPath}</td></tr>
	</c:forEach>
</table>
</body>
</html>
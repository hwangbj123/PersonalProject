<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		height : 50px;
		border: 1px solid black;
	}
	#board_tb td img{
		display: inline-block;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script>
	$(function(){
		$("#td_img").height("auto");
		var td_img = 0;
		$("#big").on("click", function(){
			if (td_img==0){
				$("#td_img").css("height","auto");
				td_img = 1;
			}else{
				$("#td_img").css("height","400px");
				td_img = 0;
			}
		})
	});
	function rcp_delete(rcp_key){
		if(confirm("정말 삭제하시겠습니까?")){
			alert("게시글이 삭제되었습니다");
			location="board_rcp_delete?rcp_key="+rcp_key;	
		}
	}
</script>
</head>
<body>
<c:import url="/nav">
		<c:param name="user_id" value="${user_id}"/>
</c:import>
	<div id="board_content">
		<form method="post" action="#">
			<table id="board_tb">
				<tr>
					<td colspan="4" id="td_img">
						<div style="height: 100%; overflow: auto;">
						<c:set var="imgs" value="${fn:split(content.rcp_img,',')}"/>
						<c:forEach var="img" items="${imgs}">
							<img src="/image/${fn:trim(img)}" style="width: 90%;">
						</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td style="width: 55%;">
						${content.rcp_title}
					</td> 
					<td style="width: 10%;">작성자</td>
					<td style="width: 25%;">
						${content.user_id}
					</td> 
				</tr>
				<tr>
					<td>재료</td>
					<td colspan="3">
						<c:set var="ingText" value="${content.rcp_ing}"/>
						<c:set var="ingTextReplace" value="${fn:split(ingText, '|')}"/>
						<c:forEach items="${ingTextReplace}" var="ing">
							<div style="display: inline-block; padding: 10px; border: 1px solid black; border-radius: 5px;">
								<c:out value="${ing}"/>
							</div>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<c:set var="contentText" value="${content.rcp_content}"/>
						<c:set var="contentTextReplace" value="${fn:split(contentText, '|')}"/>
						<c:forEach items="${contentTextReplace}" var="content">
							<div style="width: 80%; margin: 20px auto; padding: 10px; border: 1px solid black; border-radius: 5px;">
								<c:out value="${content}"/>
							</div>
						</c:forEach>
					</td> 
				</tr>
				<tr>
					<td>태그</td>
					<td colspan="3">
						<c:set var="tagText" value="${content.rcp_tag}"/>
						<c:set var="tagTextReplace" value="${fn:split(tagText, '|')}"/>
						<c:forEach items="${tagTextReplace}" var="tag">
							<div style="display: inline-block; padding: 10px; border: 1px solid black; border-radius: 5px;">
								<c:out value="${tag}"/>
							</div>
						</c:forEach>
					</td>
				</tr>
				<tr id="tr_modify">
					<td colspan="4">
						<c:if test="${content.user_id eq user_id}">
						<input type="button" onclick="location='board_rcp_modify?rcp_key=${content.rcp_key}'" value="수정하기">
						<input type="button" onclick="rcp_delete(${content.rcp_key})" value="삭제하기">
					</c:if>
						<input type="button" onclick="location='board_rcp'"value="목록">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
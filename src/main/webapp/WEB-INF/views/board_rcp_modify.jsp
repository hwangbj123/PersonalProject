<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    let rcpIndex = 1; // 재료(input) 추가 시 사용할 인덱스 변수
    $("#rcp_ing_btn").on("click", function(){
        while ($("#rcp_ing_" + rcpIndex).length > 0) {
            rcpIndex++;
//             console.log("rcpIndex : " + rcpIndex);
        }

        let rcping = $("#rcp_ing_" + (rcpIndex - 1));
        let newInputId = "rcp_ing_" + rcpIndex;
        let newInput = $("<input>").attr({
            type: "text",
            id: newInputId,
            style: "margin-left: 5px; width: 75px; height: 30px;"
        });
        rcping.after(newInput);
    });

    let contentIndex = 1;
    $("#rcp_content_btn").on("click", function(){
        while ($("#rcp_content_" + contentIndex).length > 0) {
            contentIndex++;
//             console.log("contentIndex : " + contentIndex);
        }

        let rcpcontent = $("#rcp_content_" + (contentIndex - 1));
        let newInputId = "rcp_content_" + contentIndex;
        let newInput = $("<textarea>").attr({
            id: newInputId,
        });
        rcpcontent.after(newInput);
    });

    let tagIndex = 1;
    $("#rcp_tag_btn").on("click", function(){
        while ($("#rcp_tag_" + tagIndex).length > 0) {
        	tagIndex++;
//             console.log("rcpIndex : " + rcpIndex);
        }

        let rcptag = $("#rcp_tag_" + (tagIndex - 1));
        let newInputId = "rcp_tag_" + tagIndex;
        let newInput = $("<input>").attr({
            type: "text",
            id: newInputId,
            style: "margin-left: 5px; width: 75px; height: 30px;",
            value: "#"
        });
        rcptag.after(newInput);
    });

    $("#rcp_modify_btn").on("click", function(){
        let ings = "" + $("#rcp_ing_1").val();
        let rcpIndex = 2;
        while ($("#rcp_ing_" + rcpIndex).length > 0) {
            ings += "|" + $("#rcp_ing_" + rcpIndex).val();
            rcpIndex++;
        }
        console.log("ings : " + ings);
        $("input[name='rcp_ing']").val(ings);
        
        let cons = "" + $("#rcp_content_1").val();
        let contentIndex = 2;
        while ($("#rcp_content_" + contentIndex).length > 0) {
            cons += "|" + $("#rcp_content_" + contentIndex).val();
            contentIndex++;
        }
        console.log("cons : " + cons);
        $("input[name='rcp_content']").val(cons);
        
        let tags = "" + $("#rcp_tag_1").val();
        let tagIndex = 2;
        while ($("#rcp_tag_" + tagIndex).length > 0) {
            tags += "|" + $("#rcp_tag_" + tagIndex).val();
            tagIndex++;
        }
        console.log("tags : " + tags);
        $("input[name='rcp_tag']").val(tags);
        
		alert("레시피가 수정됩니다");
		$("#modify_frm").submit();
    });
    $("#modify_btn").on("click",function(){
	});
});
</script>
</head>
<body>
<c:import url="/nav">
		<c:param name="user_id" value="${user_id}"/>
</c:import>
	<div id="board_content">
		<form method="post" id="modify_frm" action="board_rcp_modify_method" enctype="multipart/form-data">
			<table id="board_tb">
				<caption><h1>레시피 수정</h1></caption>
				<tr>
					<td width="20%">제목</td>
					<td>
						<input type="text" name="rcp_title" value="${content.rcp_title}">
						<input type="hidden" name="user_id" value="${user_id}">
						<input type="hidden" name="rcp_key" value="${content.rcp_key}">
					</td> 
				</tr>
				<tr>
					<td>재료</td>
					<td>
						<c:set var="ingText" value="${content.rcp_ing}"/>
						<c:set var="ingTextReplace" value="${fn:split(ingText, '|')}"/>
						<c:forEach items="${ingTextReplace}" var="ing" varStatus="status">
							<input type="text" id="rcp_ing_${status.count}"  style="width: 75px; height: 30px;" value="${ing}">
						</c:forEach>
						<input type="button" id="rcp_ing_btn" style="width: 75px; height: 36px;" value="+">
						<input type="button" id="rcp_ing_btn2" style="width: 75px; height: 36px;" value="test">
						<br><input type="hidden" name="rcp_ing">
					</td>
				</tr>
				<tr>
					<td>조리순서</td>
					<td>
						<c:set var="contentText" value="${content.rcp_content}"/>
						<c:set var="contentTextReplace" value="${fn:split(contentText, '|')}"/>
						<c:forEach items="${contentTextReplace}" var="content" varStatus="status">
							<div>
								<textarea id="rcp_content_${status.count}" >${content}</textarea>
							</div>
						</c:forEach>
						<input type="button" id="rcp_content_btn" style="width: 75px; height: 36px;" value="+">
						<input type="button" id="rcp_content_btn2" style="width: 75px; height: 36px;" value="test">
						<br><input type="hidden" name="rcp_content">
					</td> 
				</tr>
				<tr>
					<td>이미지</td>
					<td>
						<input type="file" id="upload_btn" name="rcp_img" multiple="multiple" value="상품 등록">
					</td>
				</tr>
				<tr>
					<td>태그</td>
					<td>
						<c:set var="tagText" value="${content.rcp_tag}"/>
						<c:set var="tagTextReplace" value="${fn:split(tagText, '|')}"/>
						<c:forEach items="${tagTextReplace}" var="tag" varStatus="status">
									<input type="text" id="rcp_tag_${status.count}"  style="width: 75px; height: 30px;" value="${tag}">
						</c:forEach>
						<input type="button" id="rcp_tag_btn" style="width: 75px; height: 36px;" value="+">
						<input type="button" id="rcp_tag_btn2" style="width: 75px; height: 36px;" value="test">
						<br><input type="hidden" name="rcp_tag">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" id="rcp_modify_btn" value="수정">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
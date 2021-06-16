<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.net.*"%>
<%
	//파일 기본경로
	String defaultPath = request.getSession().getServletContext().getRealPath("/");
	//파일 기본경로, 상세경로
	String filePath = defaultPath + "ckEimg" + File.separator;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이야(IYA)</title>

<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/default.css">

<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script>
    window.onload = function(){
       ck = CKEDITOR.replace("boardContent");
    };
</script>

<script type="text/javascript">  
function chkAdd(){
	if(document.writeInfo.cate1.value==0){
        alert("지역 카테고리를 선택해주세요.");
        document.writeInfo.cate1.focus();
        return false;
    }else if(document.writeInfo.cate2.value==0){
        alert("세부 카테고리를 선택해주세요.");
        document.writeInfo.cate2.focus();
        return false;
    }else if(!document.writeInfo.boardTitle.value){
        alert("제목을 입력해주세요.");
        document.writeInfo.boardTitle.focus();
        return false;
    }else if(!CKEDITOR.instances.boardContent.getData()){
        alert("내용을 입력해주세요.");
        document.writeInfo.boardContent.focus();
        return false;
    }
}
</script>
<%
String strReferer = request.getHeader("referer");

if(strReferer == null){
%>
<script language="javascript">
	alert("URL 주소창에 주소를 직접 입력해서 접근하셨습니다.\n\n정상적인 경로를 통해 다시 접근해 주십시오.");
	document.location.href="board";
</script>
<%
 return;
}
%>
</head>

<body>

<jsp:include page="layout/header.jsp" />

<div class="content-wrap">
   	<h2 class="content-title">글쓰기</h2>
   	
	<!-- 제목 -->
	<form action="add" id="frm" name="writeInfo" method="post" enctype="multipart/form-data" onsubmit="return chkAdd()">
		<input type="hidden" id="boardNum" name="boardNum" value="${boardNum }">
		<input type="hidden" id="userId" name="userId" value="${sessionScope.user_info.getUserId()}">
		<input type="hidden" id="writeType" name="writeType" value="${param.writeType}">
		
		<div class="write-title">
			<select class="medium" id="cate1" name="cate1">
				<option value="0">지역 카테고리</option>
				<option value="1" <c:if test="${param.writeType==2 && boardDTO.getCate1()==1}" >selected</c:if>>서울</option>
				<option value="2" <c:if test="${param.writeType==2 && boardDTO.getCate1()==2}" >selected</c:if>>인천</option>
				<option value="3" <c:if test="${param.writeType==2 && boardDTO.getCate1()==3}" >selected</c:if>>경기</option>
			</select>
			<select class="medium" id="cate2" name="cate2">
				<option value="0">세부 카테고리</option>
				<option value="1" <c:if test="${param.writeType==2 && boardDTO.getCate2()==1}" >selected</c:if>>맛집</option>
				<option value="2" <c:if test="${param.writeType==2 && boardDTO.getCate2()==2}" >selected</c:if>>관광지</option>
				<option value="3" <c:if test="${param.writeType==2 && boardDTO.getCate2()==3}" >selected</c:if>>교육</option>
				<option value="4" <c:if test="${param.writeType==2 && boardDTO.getCate2()==4}" >selected</c:if>>미용</option>
				<option value="5" <c:if test="${param.writeType==2 && boardDTO.getCate2()==5}" >selected</c:if>>자유게시판</option>
				<option value="6" <c:if test="${param.writeType==2 && boardDTO.getCate2()==6}" >selected</c:if>>질문과답변</option>
			</select>
			<p>제목 </p>
			<input type="text" class="write-title-text" id="boardTitle" name="boardTitle" <c:if test="${param.writeType==2}">value="${boardDTO.getBoardtitle() }"</c:if> >
		</div>
	
		<!-- 내용 -->
		<textarea class="form-control" id="boardContent" name="boardContent">${boardDTO.getBoardcontent()  }</textarea>

		
		<!-- 작성완료 버튼 -->
		<div class="write-button">
			<input class="medium" type="submit" value="작성완료">
		</div>
	</form>
</div>


<jsp:include page="layout/footer.jsp" />

</body>
</html>
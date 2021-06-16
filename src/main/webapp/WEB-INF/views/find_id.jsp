<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이야(IYA)</title>

<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/default.css">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<%
String strReferer = request.getHeader("referer");

if(strReferer == null){
%>
<script language="javascript">
	alert("URL 주소창에 주소를 직접 입력해서 접근하셨습니다.\n\n정상적인 경로를 통해 다시 접근해 주십시오.");
	document.location.href="find?find=1";
</script>
<%
 return;
}
%>
<script>
	// 로그인 확인 ( 아이디, 비밀번호 )
	// if("${ userLogin }"!=""){
    // 	alert("${ userLogin }");
	// }
</script>
</head>
<body>

<jsp:include page="layout/header.jsp" />

<!-- 아이디 찾기 결과 [s] -->
<div class="content-wrap">
    <h2 class="content-title">아이디 찾기</h2>
    <div class="find-id-form">
    	<c:choose>
    		<c:when test="${ userInfo != null }">
        		<p>회원님의 아이디는 "<span>${userInfo.getUserId() } </span>" 입니다.</p>
        	</c:when>
        	<c:otherwise>
        		등록된 아이디가 없습니다.</p>
        	</c:otherwise>
        </c:choose>
        <p>
            <a href="index">메인</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="login">로그인</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="find_pw">비밀번호 찾기</a>
        </p>
    </div>
</div>
<!-- 아이디 찾기 결과 [e] -->

<jsp:include page="layout/footer.jsp" />

</body>
</html>
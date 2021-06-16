<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이야(IYA)</title>

<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/default.css">
<%
String strReferer = request.getHeader("referer");

if(strReferer == null){
%>
<script language="javascript">
	alert("URL 주소창에 주소를 직접 입력해서 접근하셨습니다.\n\n정상적인 경로를 통해 다시 접근해 주십시오.");
	document.location.href="join";
</script>
<%
 return;
}
%>
</head>
<body>

<jsp:include page="layout/header.jsp" />

<!-- 회원가입 [s] -->
<div class="content-wrap">
    <h2 class="content-title">회원가입</h2>
        
    <div class="join_wrap">
        <ul class="join_img">
            <li>
                <p>01</p>
                <p>약관동의</p>
            </li> 
            <li>
                <p>02</p>
                <p>정보입력</p>
            </li> 
            <li class="active">
                <p>03</p>
                <p>가입완료</p>
            </li> 
        </ul>

        <div class="join_fin">
            <p>회원가입이 완료되었습니다!</p>
            <div class="join_btn center">
                <a href="index.html" class="btn small">메인</a> &nbsp;&nbsp;
                <a href="login.html" class="btn small">로그인</a>
            </div>
        </div>
    </div>
</div>
<!-- 회원가입 [e] -->

<jsp:include page="layout/footer.jsp" />

</body>
</html>
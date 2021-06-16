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

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
// 	로그인 확인 ( 아이디, 비밀번호 )
if("${ loginText }"!=""){
   	alert("${ loginText }");
}
	
function chkInfo(){
	if(!document.userinfo.id.value){
        alert("아이디를 입력하세요.");
        document.userinfo.id.focus();
        return false;
    }else if(!document.userinfo.pw.value){
        alert("비밀번호를 입력하세요.");
        document.userinfo.pw.focus();
        return false;
    }

	// 아이디 공백 제거
	if (document.userinfo.id.value.indexOf(" ") >= 0) {
	    alert("아이디에 공백을 사용할 수 없습니다.")
	    document.userinfo.id.focus();
	    return false;
	}
    // 아이디 길이 체크 (4~12자)
    if (document.userinfo.id.value.length<4 || document.userinfo.id.value.length>20) {
        alert("아이디를 4~20자까지 입력해주세요.")
        document.userinfo.id.focus()
        return false;
    }
}
</script>
</head>
<body>

<jsp:include page="layout/header.jsp" />

<!-- 로그인 [s] -->
<div class="content-wrap">
    <h2 class="content-title">로그인</h2>
    <div class="login-form">
        <form action="user_login" name="userinfo" method="post" onsubmit="return chkInfo()">
            <p>
                <span>아이디</span> <input type="text" class="medium" name="id" id="id">
            </p>
            <p>
                <span>비밀번호</span> <input type="password" class="medium" name="pw" id="pw">
            </p>
            <p class="login-btn">
                <input type="submit" class="btn small" value="로그인">
            </p>
            <p class="id-remember">
                <input type="checkbox" id="chkbox" name="autologin" value="chkok">
                <label for="chkbox">자동로그인</label>
            </p>
            <p>
                <a href="join">회원가입</a> &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="find?find=1">아이디 찾기</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                <a href="find?find=2">비밀번호 찾기</a>
            </p>
        </form>
    </div>
</div>
<!-- 로그인 [e] -->

<jsp:include page="layout/footer.jsp" />

</body>
</html>
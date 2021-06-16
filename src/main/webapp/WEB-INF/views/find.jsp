<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 function chkId(){
	 if(!document.getElementById("phone2").value){
         alert("전화번호를 입력하세요.");
         document.getElementById("phone2").focus();
         return false;
     }else if(!document.getElementById("phone3").value){
         alert("전화번호를 입력하세요.");
         document.getElementById("phone3").focus();
         return false;
     }
	// 핸드폰 번호2 공백 제거
     if (document.userinfo.phone2.value.indexOf(" ") >= 0) {
         alert("번호에 공백을 사용할 수 없습니다.")
         document.userinfo.phone2.focus();
         return false;
     }
     // 핸드폰 번호3 공백 제거
     if (document.userinfo.phone3.value.indexOf(" ") >= 0) {
         alert("번호에 공백을 사용할 수 없습니다.")
         document.userinfo.phone3.focus();
         return false;
     }
     // 핸드폰 번호2 유효성 검사 (숫자만 허용)
     for (i = 0; i < document.userinfo.phone2.value.length; i++) {
         ch = document.userinfo.phone2.value.charAt(i)
         if (!(ch >= '0' && ch <= '9')) {
             alert("번호는 숫자만 입력가능합니다.")
             document.userinfo.phone2.focus()
             return false;
         }
     }
     // 핸드폰 번호3 유효성 검사 (숫자만 허용)
     for (i = 0; i < document.userinfo.phone3.value.length; i++) {
         ch = document.userinfo.phone3.value.charAt(i)
         if (!(ch >= '0' && ch <= '9')) {
             alert("번호는 숫자만 입력가능합니다.")
             document.userinfo.phone3.focus()
             return false;
         }
     }
     // 핸드폰 번호2 길이 체크(4자 까지 허용)
     if (document.userinfo.phone2.value.length>4) {
         alert("번호를 4자까지 입력해주세요.")
         document.userinfo.phone2.focus()
         return false;
     }
     // 핸드폰 번호3 길이 체크(4자 까지 허용)
     if (document.userinfo.phone3.value.length>4) {
         alert("번호를 4자까지 입력해주세요.")
         document.userinfo.phone3.focus()
         return false;
     }
 } 
 
 function chkPw() {
	 if(!document.getElementById("id").value){
         alert("아이디를 입력하세요.");
         document.getElementById("id").focus();
         return false;
     }else if(!document.getElementById("phone2").value){
         alert("전화번호를 입력하세요.");
         document.getElementById("phone2").focus();
         return false;
     }else if(!document.getElementById("phone3").value){
         alert("전화번호를 입력하세요.");
         document.getElementById("phone3").focus();
         return false;
     }
	 // 아이디 공백 제거
     if (document.userinfo.id.value.indexOf(" ") >= 0) {
         alert("아이디에 공백을 사용할 수 없습니다.")
         document.userinfo.id.focus();
         return false;
     }
	 
	// 핸드폰 번호2 공백 제거
     if (document.userinfo.phone2.value.indexOf(" ") >= 0) {
         alert("번호에 공백을 사용할 수 없습니다.")
         document.userinfo.phone2.focus();
         return false;
     }
     // 핸드폰 번호3 공백 제거
     if (document.userinfo.phone3.value.indexOf(" ") >= 0) {
         alert("번호에 공백을 사용할 수 없습니다.")
         document.userinfo.phone3.focus();
         return false;
     }
     // 핸드폰 번호2 유효성 검사 (숫자만 허용)
     for (i = 0; i < document.userinfo.phone2.value.length; i++) {
         ch = document.userinfo.phone2.value.charAt(i)
         if (!(ch >= '0' && ch <= '9')) {
             alert("번호는 숫자만 입력가능합니다.")
             document.userinfo.phone2.focus()
             return false;
         }
     }
     // 핸드폰 번호3 유효성 검사 (숫자만 허용)
     for (i = 0; i < document.userinfo.phone3.value.length; i++) {
         ch = document.userinfo.phone3.value.charAt(i)
         if (!(ch >= '0' && ch <= '9')) {
             alert("번호는 숫자만 입력가능합니다.")
             document.userinfo.phone3.focus()
             return false;
         }
     }
     // 아이디 길이 체크 (4~12자)
     if (document.userinfo.id.value.length<4 || document.userinfo.id.value.length>20) {
         alert("아이디를 4~20자까지 입력해주세요.")
         document.userinfo.id.focus()
         return false;
     }
     // 핸드폰 번호2 길이 체크(4자 까지 허용)
     if (document.userinfo.phone2.value.length>4) {
         alert("번호를 4자까지 입력해주세요.")
         document.userinfo.phone2.focus()
         return false;
     }
     // 핸드폰 번호3 길이 체크(4자 까지 허용)
     if (document.userinfo.phone3.value.length>4) {
         alert("번호를 4자까지 입력해주세요.")
         document.userinfo.phone3.focus()
         return false;
     }
 }
	
</script>
</head>
<body>

<jsp:include page="layout/header.jsp" />

<!-- 아이디/비밀번호 찾기 [s] -->
<div class="content-wrap">

<c:choose>
	<c:when test="${param.find == 1}">
    <!-- 아이디 찾기 [s] -->
    <h2 class="content-title">아이디 찾기</h2>
    <div class="find-form">
        <form action="find_id"  name="userinfo" method="post" onsubmit="return chkId()">
            <p>
                <span>핸드폰 번호</span>
                <select class="small" id="phone1" name="phone1">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="019">019</option>
                </select> - 
                <input class="small" type="text" id="phone2" name="phone2"> - 
                <input class="small" type="text" id="phone3" name="phone3">
            </p>
            <p class="find-btn">
                <input type="submit" class="btn medium" type="text" value="아이디 찾기" />
            </p>
            <p>
                <a href="join">회원가입</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="find?find=2">비밀번호 찾기</a>
            </p>
        </form>
    </div>
    <!-- 아이디 찾기 [e] -->
</c:when>
<c:when test="${param.find == 2}">
    <!-- 비밀번호 찾기 [s] -->
    <h2 class="content-title">비밀번호 찾기</h2>
    <div class="find-form">
        <form action="find_pw"  name="userinfo" method="post" onsubmit="return chkPw()">
            <p>
                <span>아이디</span> <input type="text" class="medium" name="id" id="id">
            </p>
            <p>
                <span>핸드폰 번호</span>
                <select class="small" id="phone1" name="phone1">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="019">019</option>
                </select> - 
                <input class="small" type="text" id="phone2" name="phone2"> - 
                <input class="small" type="text" id="phone3" name="phone3">
            </p>
            <p class="find-btn">
                <input type="submit" class="btn medium" type="text" value="비밀번호 찾기" />
            </p>
            <p>
                <a href="join">회원가입</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="find?find=1">아이디 찾기</a>
            </p>
        </form>
    </div>
    <!-- 비밀번호 찾기 [e] -->
    </c:when>
    <c:otherwise>
    	없는 페이지입니다.
    </c:otherwise>
    </c:choose>
</div>
<!-- 아이디/비밀번호 찾기 [e] -->

<jsp:include page="layout/footer.jsp" />

</body>
</html>
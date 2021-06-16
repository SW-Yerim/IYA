<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
	document.location.href="find?find=2";
</script>
<%
 return;
}
%>
<script>
	function chkNewPw(){
		if(!document.getElementById("pw").value){
            alert("비밀번호를 입력하세요.");
            document.getElementById("pw").focus();
            return false;
        }
		  // 비밀번호 공백 제거
        if (document.getElementById("pw").value.indexOf(" ") >= 0) {
            alert("비밀번호에 공백을 사용할 수 없습니다.")
            document.userinfo.pw.focus();
            return false;
        }
        // 비밀번호 길이 체크(8~20자 까지 허용)
        if (document.getElementById("pw").value.length<8 || document.getElementById("pw").value.length>20) {
            alert("비밀번호를 8~20자까지 입력해주세요.")
            document.userinfo.pw.focus()
            return false;
        }
	}

</script>
</head>
<body>

<jsp:include page="layout/header.jsp" />

<!-- 비밀번호 찾기 결과 [s] -->
<div class="content-wrap">
    <h2 class="content-title">비밀번호 찾기</h2>
    <div class="find-pwd-form">
    	<c:choose>
    		<c:when test="${userInfo!=null }">
     			<form action="newPw" name="userinfo" method="post" onsubmit="return chkNewPw()">
     			<input type="hidden" name="id" value="${userInfo.getUserId() }"  >
     				<p>
    			        <span>새 비밀번호</span> <input type="text" class="medium" name="pw" id="pw">
     				</p>
    			    <p class="find-pwd-btn">
           				<input type="submit" class="btn medium" type="text" value="비밀번호 변경" />
					</p>
        		</form>
        	</c:when>
        	<c:otherwise>
       			<p style="margin-bottom: 40px;">
       				잘못 입력하셨습니다.<br><br>
       				아이디와 핸드폰 번호를 다시 확인해 주세요.
   				</p>
       			<a href="#" class="btn small" onclick="history.back()">이전 페이지</a>
        	</c:otherwise>
        </c:choose>
    </div>
</div>
<!-- 비밀번호 찾기 결과 [e] -->

<jsp:include page="layout/footer.jsp" />

</body>
</html>
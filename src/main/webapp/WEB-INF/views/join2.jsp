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
<script type="text/javascript">
    
	// 데이터 유효성 검사
	function checkValue(){
		// 중복된 아이디 
		if(document.getElementById("idcheck").innerText=='중복된 아이디'){
			 alert("중복된 아이디입니다.");
	            document.getElementById("id").focus();
	            return false;
		}
		// 미입력 확인
		if(!document.getElementById("id").value){
            alert("아이디를 입력하세요.");
            document.getElementById("id").focus();
            return false;
        }else if(!document.getElementById("pw").value){
            alert("비밀번호를 입력하세요.");
            document.getElementById("pw").focus();
            return false;
        }else if(document.getElementById("pw").value != document.getElementById("pwChk").value){
            alert("비밀번호를 동일하게 입력하세요.");
            document.getElementById("pw").focus();
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
        if (document.join_info.id.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.")
            document.join_info.id.focus();
            return false;
        }
  
        // 비밀번호 공백 제거
        if (document.join_info.pw.value.indexOf(" ") >= 0) {
            alert("비밀번호에 공백을 사용할 수 없습니다.")
            document.join_info.pw.focus();
            return false;
        }

        // 핸드폰 번호2 공백 제거
        if (document.join_info.phone2.value.indexOf(" ") >= 0) {
            alert("번호에 공백을 사용할 수 없습니다.")
            document.join_info.phone2.focus();
            return false;
        }
        // 핸드폰 번호3 공백 제거
        if (document.join_info.phone3.value.indexOf(" ") >= 0) {
            alert("번호에 공백을 사용할 수 없습니다.")
            document.join_info.phone3.focus();
            return false;
        }
        // 아이디 길이 체크 (4~12자)
        if (document.join_info.id.value.length<4 || document.join_info.id.value.length>20) {
            alert("아이디를 4~20자까지 입력해주세요.")
            document.join_info.id.focus()
            return false;
        }
        
        // 비밀번호 길이 체크(8~20자 까지 허용)
        if (document.join_info.pw.value.length<8 || document.join_info.pw.value.length>20) {
            alert("비밀번호를 8~20자까지 입력해주세요.")
            document.join_info.pw.focus()
            return false;
        }
        
        // 핸드폰 번호2 유효성 검사 (숫자만 허용)
        for (i = 0; i < document.join_info.phone2.value.length; i++) {
            ch = document.join_info.phone2.value.charAt(i)
            if (!(ch >= '0' && ch <= '9')) {
                alert("번호는 숫자만 입력가능합니다.")
                document.join_info.phone2.focus()
                return false;
            }
        }
        // 핸드폰 번호3 유효성 검사 (숫자만 허용)
        for (i = 0; i < document.join_info.phone3.value.length; i++) {
            ch = document.join_info.phone3.value.charAt(i)
            if (!(ch >= '0' && ch <= '9')) {
                alert("번호는 숫자만 입력가능합니다.")
                document.join_info.phone3.focus()
                return false;
            }
        }
        // 핸드폰 번호2 길이 체크(4자 까지 허용)
        if (document.join_info.phone2.value.length>4) {
            alert("번호를 4자까지 입력해주세요.")
            document.join_info.phone2.focus()
            return false;
        }
        // 핸드폰 번호3 길이 체크(4자 까지 허용)
        if (document.join_info.phone3.value.length>4) {
            alert("번호를 4자까지 입력해주세요.")
            document.join_info.phone3.focus()
            return false;
        }
	}
	
	// 아이디 중복 확인(ajax)
	function idchkF(){
	var userId= document.getElementById("id").value;
		$.ajax({
			url:"idchk",
			type:"GET",
			data:{ userId },
			dataType : 'json',
			success:function(data){
				if(data==0){
					document.getElementById('idcheck').innerHTML = '';
					document.getElementById('idcheck').style.color = "green";
					document.getElementById('idcheck').innerHTML = '사용 가능한 아이디';
				}else if(data==1){
					document.getElementById('idcheck').innerHTML = '';
					document.getElementById('idcheck').style.color = "red";
					document.getElementById('idcheck').innerHTML = '중복된 아이디';
				}else {
					document.getElementById('idcheck').innerHTML = '';
					document.getElementById('idcheck').style.color = "red";
					document.getElementById('idcheck').innerHTML = '오류';
				}
			},
			error:function(){
				alert("오류가 발생하였습니다!!");
			}
		})
	}
</script>
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
            <li class="active">
                <p>02</p>
                <p>정보입력</p>
            </li> 
            <li>
                <p>03</p>
                <p>가입완료</p>
            </li> 
        </ul>

        <!--  데이터 입력 칸 출력 ( 아이디, 비밀번호, 비밀번호 확인, 핸드폰번호)  -->
        <form action="join3" name="join_info" method="post" onsubmit="return checkValue()">
            <div class="join_input_con">
                <p>
                    <span>아이디</span>
                    <input type="text" class="medium" name="id" id="id" onchange="idchkF()"><label id="idcheck"></label>
                </p>
                <p>
                    <span>비밀번호</span> 
                    <input type="password" class="medium" id="pw" name="pw">
                </p>
                <p>
                    <span>비밀번호 확인</span> 
                    <input type="password" class="medium" id="pwChk" name="pwChk">
                </p>
 
                <p>
                    <span>핸드폰</span>
                    <select class="small" id="phone1" name="phone1">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="019">019</option>
                    </select> - 
                    <input class="small" type="text" id="phone2" name="phone2"> - 
                    <input class="small" type="text" id="phone3" name="phone3">
                </p>    
            </div>
            <div class="join_btn center">
                <input type="submit" class="btn small" value="다음단계" >
            </div>
        </form>
    </div>
</div>
<!-- 회원가입 [e] -->

<jsp:include page="layout/footer.jsp" />

</body>
</html>
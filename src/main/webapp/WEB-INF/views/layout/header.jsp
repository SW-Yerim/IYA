<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="resources/css/header.css">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
    $( document ).ready( function() {
        $(".my-info-modify").click(function(){
            $(".my-info-wrap").addClass('open');
        });
        $(".my-info-close").click(function(){
            $(".my-info-wrap").removeClass('open');
        });
    });
</script>
</head>
<body>
<!-- 헤더 [s] -->
<div class="main-banner">
    <h1>
    	<a href="index"><img src="resources/images/logo2.png" alt="IYA 로고 뜻"></a>
    </h1>
    <div class="header-search">
    <form action="board">
    	<input type="hidden" id="cate1" name="cate1" value="1">
    	<input type="hidden" id="search1" name="search1" value="4">
        <input type="text" id="search2" name="search2" ><button><img src="resources/images/search.png" alt="검색 아이콘"></button>
    </form>
    </div>
</div>
<header>

    <%-- 로그인 시 --%>
    <c:choose>
    	<c:when test="${sessionScope.user_info != null}">
		    <div class="header-user-info">
				<p class="user-name"><span>${sessionScope.user_info.getUserId()}</span> 님</p>
		        <div class="user-login">
		            <a href="logout">로그아웃</a>
		            <a href="#" class="my-info-modify">내 정보 수정</a><br>
		            <a href="board?myboard=1&search1=3&search2=${sessionScope.user_info.getUserId() }">내가 쓴 글</a>
		        </div>
		    </div>
    	</c:when>
    <%-- 미로그인 시 --%>
    	<c:otherwise>
		    <div class="header-user-info">
		        <div class="user-inputbox">
		            <a href="login" class="btn full">로그인</a>
		        </div>
		        <div class="user-login">
		            <a href="join">회원가입</a>
		            <a href="find?find=1">아이디 찾기</a><br>
		            <a href="find?find=2">비밀번호 찾기</a>
		        </div>
		    </div>
    	</c:otherwise>
    </c:choose>
    <div class="header-con">
        <ul class="list-wrap">
<!--             <li> -->
<!--                 <p>지역</p> -->
<!--                 <ul> -->
<!--                     <li><a href="notice">공지사항</a></li> -->
<!--                     <li><a href="event">이벤트</a></li> -->
<!--                     <li><a href="#">인사말</a></li> -->
<!--                     <li><a href="#">화제의 게시글</a></li> -->
<!--                     <li><a href="best_member">화제의 회원</a></li> -->
<!--                 </ul> -->
<!--             </li> -->
            <li>
                <p><a href="board">전체 게시글</a></p>
            </li>
            <li>
                <p>지역</p>
                <ul class="sub-list-wrap">
                    <li><a href="board?cate1=1">서울</a></li>
                    <li><a href="board?cate1=2">인천</a></li>
                    <li><a href="board?cate1=3">경기</a></li>
                </ul>
            </li>
        </ul>
    </div>
</header>
<div class="my-info-wrap">
    <div class="my-info">
        <form action="user_modify" method="post" onsubmit="retrun modifyChk">
	        <p class="my-info-title">
	            [ <span>${sessionScope.user_info.getUserId() }</span> 님 정보 수정 ]
	            <span class="my-info-close">Ｘ</span>
	        </p>
	        <input type="hidden" id="user_info_id" name="user_info_id" value="${sessionScope.user_info.getUserId() }">
	        <ul class="my-info-list">
	            <li>
	                <span>비밀번호</span> 
	                <input type="password" class="large" id="user_info_pw" name="user_info_pw">
	            </li>
	            <li>
	                <span>비밀번호 확인</span> 
	                <input type="password" class="large" id="user_info_pwChk" name="user_info_pwChk">
	            </li>
	            <li>
	                <span>핸드폰</span>
	                <select class="small" id="user_info_phone1" name="user_info_phone1">
	                    <option value="010">010</option>
	                    <option value="011">011</option>
	                    <option value="016">016</option>
	                    <option value="019">019</option>
	                </select> - 
	                <input class="small" type="text" id="user_info_phone2" name="user_info_phone2"> - 
	                <input class="small" type="text" id="user_info_phone3" name="user_info_phone3">
	            </li>
	        </ul>
	        <button type="submit" class="btn medium">수정하기</button>
        </form>
    </div>
</div>
<!-- 헤더 [e] -->
</body>
</html>
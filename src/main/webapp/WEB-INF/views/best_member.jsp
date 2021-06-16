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
    $( document ).ready( function() {
        $(".rank-open-btn").click(function(){
            $(".member-rank-wrap").addClass('open');
        });
        $(".member-rank-chk").click(function(){
            $(".member-rank-wrap").addClass('open');
        });
        $(".rank-close-btn").click(function(){
            $(".member-rank-wrap").removeClass('open');
        });
    });
</script>
</head>
<body>

<jsp:include page="layout/header.jsp" />

<!-- 화제의 회원 [s] -->
<div class="content-wrap">
    <h2 class="content-title">화제의 회원 <span class="member-rank-chk">회원 등급 확인하기</span></h2>
    <div class="member-form">
        <!-- 오늘의 화제 회원 [s] -->
        <p class="member-title">[ 오늘의 화제 회원 ]</p>
        <ul>
            <li>
                <p>1.</p>
                <img src="/images/rank_icon/rank_icon1.png" alt="등급이미지">
                <p class="member-name">hong길동</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>2.</p>
                <img src="/images/rank_icon/rank_icon2.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>3.</p>
                <img src="/images/rank_icon/rank_icon3.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>4.</p>
                <img src="/images/rank_icon/rank_icon4.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>5.</p>
                <img src="/images/rank_icon/rank_icon5.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>6.</p>
                <img src="/images/rank_icon/rank_icon6.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>7.</p>
                <img src="/images/rank_icon/rank_icon7.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>8.</p>
                <img src="/images/rank_icon/rank_icon8.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>9.</p>
                <img src="/images/rank_icon/rank_icon9.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>10.</p>
                <img src="/images/rank_icon/rank_icon10.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
        </ul>
        <!-- 오늘의 화제 회원 [e] -->

        <!-- 이번주 화제 회원 [s] -->
        <p class="member-title">[ 이번주 화제 회원 ]</p>
        <ul>
            <li>
                <p>1.</p>
                <img src="/images/rank_icon/rank_icon1.png" alt="등급이미지">
                <p class="member-name">hong길동</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>2.</p>
                <img src="/images/rank_icon/rank_icon2.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>3.</p>
                <img src="/images/rank_icon/rank_icon3.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>4.</p>
                <img src="/images/rank_icon/rank_icon4.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>5.</p>
                <img src="/images/rank_icon/rank_icon5.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>6.</p>
                <img src="/images/rank_icon/rank_icon6.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>7.</p>
                <img src="/images/rank_icon/rank_icon7.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>8.</p>
                <img src="/images/rank_icon/rank_icon8.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>9.</p>
                <img src="/images/rank_icon/rank_icon9.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
            <li>
                <p>10.</p>
                <img src="/images/rank_icon/rank_icon10.png" alt="등급이미지">
                <p class="member-name">홍길동이홍길동이</p>
                <p>오늘 받은 추천수 : <span>1000</span> 개</p>
            </li>
        </ul>
        <!-- 이번주 화제 회원 [e] -->
    </div>
</div>
<!-- 화제의 회원 [e] -->

<jsp:include page="layout/footer.jsp" />

</body>
</html>
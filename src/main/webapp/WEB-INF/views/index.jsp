<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이야(IYA)</title>

<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/default.css">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<jsp:include page="layout/header.jsp" />

<!-- 메인 [s] -->
<div class="main-wrap">

	<!-- 월간 베스트 [s] -->
    <div class="main-content">
        <div class="title">
            <p>월간 베스트 </p>
        </div>
        <ul>
        	<c:choose>
        		<c:when test="${indexUp.size() >0 }">
					<c:forEach var="i" begin="0" end="${indexUp.size()-1}">
			            <li><a href="detail?boardNum=${indexUp[i].getBoardnum() }"><span>${indexUp[i].getBoardtitle() }</span><span>[${indexUpCommentCount[i] }]</span></a></li>
					</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<li class="none">해당 게시글이 없습니다</li>
        		</c:otherwise>
        	</c:choose>
        </ul>
    </div>
    <!-- 월간 베스트 [e] -->

	<!-- 월간 조회순위 [s] -->
    <div class="main-content">
        <div class="title">
            <p>월간 조회순위</p>
        </div>
        <ul>
			<c:choose>
        		<c:when test="${indexView.size() >0 }">
					<c:forEach var="i" begin="0" end="${indexView.size()-1}">
			            <li><a href="detail?boardNum=${indexView[i].getBoardnum() }"><span>${indexView[i].getBoardtitle() }</span><span>[${indexViewCommentCount[i] }]</span></a></li>
					</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<li class="none">해당 게시글이 없습니다</li>
        		</c:otherwise>
        	</c:choose>
        </ul>
    </div>
    <!-- 월간 조회순위 [e] -->

    <!-- 서울게시판 [s] -->
    <div class="main-content">
        <div class="title">
            <a href="board?cate1=1"><p>서울게시판 <span>▶</span></p></a>
        </div>
        <ul>
			<c:choose>
        		<c:when test="${indexCate11.size() >0 }">
					<c:forEach var="i" begin="0" end="${indexCate11.size()-1}">
			            <li><a href="detail?boardNum=${indexCate11[i].getBoardnum() }"><span>${indexCate11[i].getBoardtitle() }</span><span>[${indexCate11CommentCount[i] }]</span></a></li>
					</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<li class="none">해당 게시글이 없습니다</li>
        		</c:otherwise>
        	</c:choose>        
        </ul>
    </div>
    <!-- 서울게시판 [e] -->

    <!-- 광고 [s] -->
    <div class="main-content">
        <img src="resources/images/exadv.png" alt="메인 광고">
    </div>
    <!-- 광고 [e] -->
    
    <!-- 인천게시판 [s] -->
    <div class="main-content">
        <div class="title">
            <a href="board?cate1=2"><p>인천게시판<span>▶</span></p></a>
        </div>
        <ul>
			<c:choose>
        		<c:when test="${indexCate12.size() >0 }">
		           	<c:forEach var="i" begin="0" end="${indexCate12.size()-1}">
			            <li><a href="detail?boardNum=${indexCate12[i].getBoardnum() }"><span>${indexCate12[i].getBoardtitle() }</span><span>[${indexCate12CommentCount[i] }]</span></a></li>
					</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<li class="none">해당 게시글이 없습니다</li>
        		</c:otherwise>
        	</c:choose>        
        </ul>
    </div>
    <!-- 인천게시판 [e] -->
    
    <!-- 경기게시판 [s] -->
    <div class="main-content">
        <div class="title">
            <a href="board?cate1=3"><p>경기게시판<span>▶</span></p></a>
        </div>
        <ul>
			<c:choose>
        		<c:when test="${indexCate13.size() >0 }">
					<c:forEach var="i" begin="0" end="${indexCate13.size()-1}">
			            <li><a href="detail?boardNum=${indexCate13[i].getBoardnum() }"><span>${indexCate13[i].getBoardtitle() }</span><span>[${indexCate13CommentCount[i] }]</span></a></li>
					</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<li class="none">해당 게시글이 없습니다</li>
        		</c:otherwise>
        	</c:choose>        
        </ul>
    </div>
    <!-- 경기게시판 [e] -->
</div>
<!-- 메인 [e] -->

<jsp:include page="layout/footer.jsp" />

</body>
</html>
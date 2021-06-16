<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이야(IYA)</title>

<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/default.css" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
// 댓글 유효성검사
function commentChk(){
	// 로그인 확인
	if('${sessionScope.user_info}' == '') {
        alert("로그인이 필요합니다.");
      location.href="login";
      return false;
	}else {
		// 미입력 확인
		if(!document.commentContent.cContent.value){
	        alert("글을 입력해주세요.");
	        document.commentContent.cContent.focus();
	        return false;
	    }
		// 길이체크
	    if (document.commentContent.cContent.value.length>500) {
	        alert("글을 500자 이내로 입력해주세요.")
	        document.commentContent.cContent.focus()
	        return false;
	    }
	}
}

// 대댓글 유효성검사
function replyChk(){
	// 미입력 확인
	if(!document.replyContent.cContent.value){
        alert("글을 입력해주세요.");
        document.replyContent.cContent.focus();
        return false;
    }
	// 길이체크
    if (document.replyContent.cContent.value.length>500) {
        alert("글을 500자 이내로 입력해주세요.")
        document.replyContent.cContent.focus()
        return false;
    }
}

// 추천 / 비추천 확인
function upChkFn(){
   	if(${upChk==1 || downChk==1}) {
       	alert("이미 누른 게시글 입니다.");
	}
   	if('${sessionScope.user_info}' == '') {
       	alert("로그인이 필요합니다.");
       	location.href="login";
	}
}

$(document).ready(function(){
	$(".comment-answer-button").click(function(){
	    if('${sessionScope.user_info}' == '') {
	        alert("로그인이 필요합니다.");
	        location.href="login";
	    } else {
	    	$(".reply-add").remove();
	    	var str='';
	    	str+='<div class="reply-add active">';
	    	str+=	'<textarea name="cContent" rows="5" cols="99"></textarea>'
	    	str+=	'<button type="submit">등록</button>'
		    str+='</div>'
	        $(this).parent().append(str);
	    }
	});
	   
	$(".reply-add-button").click(function(){
	    if(!$(this).prev().val()) {
	        alert("글을 500자 이내로 입력해주세요.");
	        $(this).prev().focus();
	        return false;
	    }
	});
});

</script>
</head>
<body>

<jsp:include page="layout/header.jsp" />

<div class="content-wrap"> 
   	<h2 class="content-title">게시글</h2>  
   	
	<%-- 타이틀 --%>
   	<div class="board-address">
		<!--게시물 주소 복사-->
		<span class="board-copy">글 주소 : ${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}/board/detail?boardNum=${param.boardNum}</span>
		<input id="url_field" type="hidden" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}/board/detail?boardNum=${param.boardNum}" readonly="readonly">
		<a href="#" id="copy_btn">[복사]</a>
		<script>
			var copyBtn = document.querySelector('#copy_btn');
			copyBtn.addEventListener('click', function () {
				var urlField = document.querySelector('#url_field');
				urlField.select();
				document.execCommand('copy'); // or 'cut'
				alert('주소가 복사되었습니다.');
			}, false);
		</script>
		<!--게시물 주소 복사 끝-->
	</div>
   	<div class="board-detail-title">
   		<p>${boardDTO.getBoardtitle() }</p>
   		<ul>
   			<li><span>${boardDTO.getUserId()}</span></li>
   			<li><span>${boardDTO.getBoardtime()}</span></li>
   			<li>추천 : <span>${boardDTO.getPostup()}</span></li>
   			<li>조회수 : <span>${boardDTO.getViewnum()}</span></li>
   		</ul>
   	</div>
   	
	<%-- 본문 --%>
   	<div class="board-detail-main">
   		<p>${boardDTO.getBoardcontent()}</p>
   	</div>
   	
	<%-- 추천,비추천,신고 --%>
   	<div class="board-detail-button">
   		<c:choose>
   			<c:when test="${upChk==1 || sessionScope.user_info==null }">
   				<a href="#" class="good" onclick="upChkFn()">추천 : <span>${upCount}</span></a>
   			</c:when>
   			<c:otherwise>
   				<a href="updown?boardNum=${param.boardNum}&updown=1&userId=${sessionScope.user_info.getUserId()}" class="good">추천 : <span>${upCount }</span></a>
   			</c:otherwise>
   		</c:choose>
  		 <c:choose>
   			<c:when test="${downChk==1 || sessionScope.user_info==null }">
   				<a href="#" class="bad" onclick="upChkFn()">비추천 : <span>${downCount}</span></a>
   			</c:when>
   			<c:otherwise>
   				<a href="updown?boardNum=${param.boardNum}&updown=2&userId=${sessionScope.user_info.getUserId()}" class="bad">비추천 : <span>${downCount}</span></a>
   			</c:otherwise>
   		</c:choose>

   		<form action="write" style="display: inline">
   			<input type="hidden" id="boardNum" name="boardNum" value="${boardDTO.getBoardnum() }">
   			<input type="hidden" id="writeType" name="writeType" value="2">
   			<c:if test="${boardDTO.getUserId()==sessionScope.user_info.getUserId() }">
   				<button class="report" type="submit">수정하기</button>
   				<a href="delete?boardNum=${ boardDTO.getBoardnum()}">삭제하기</a>
   			</c:if>
   		</form>
   	</div>
   	
	<%-- 댓글 --%>
	<div class="board-detail-comment">
		<p class="detail-title">댓글 (<span>${commentList.size() }</span>)</p>
		<c:forEach var="commentList" items="${commentList }">
			<c:choose>
				<c:when test="${commentList.getSortNum()!=0 }">
					<img alt="" src="resources/images/commend.png" class="commend-answer-arrow">
					<div class="comment-answer">
		                <div class="comment-detail-answer">
							<span>${commentList.getUserId() }</span> (<span>${commentList.getcDate()}</span>)
							<div class="comment-button">
								<c:if test="${sessionScope.user_info.getUserId()==commentList.getUserId()}">
									<a href="commentDelete?boardNum=${param.boardNum }&groupNum=${commentList.getGroupNum()}&sortNum=${commentList.getSortNum()}">삭제</a>
								</c:if>
								
							</div>
						</div>
						<div class="comment-text">
							<p>${commentList.getcContent()}</p>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="comment-detail">
						<span>${commentList.getUserId() }</span> ( <span>${commentList.getcDate() }</span> )
						<div class="comment-button">
							<c:if test="${sessionScope.user_info.getUserId()==commentList.getUserId()}">
								<a href="commentDelete?boardNum=${param.boardNum }&groupNum=${commentList.getGroupNum()}&sortNum=${commentList.getSortNum()}">삭제</a>
							</c:if>
						</div>
					</div>
					<div class="comment-text">
						<p>${commentList.getcContent() }</p>
					</div>
			      	<form action="reply" name="replyContent" onsubmit="return replyChk()">
						<input type="hidden" name="groupNum" value="${commentList.getGroupNum()}">
			      		<input type="hidden" name="boardNum" value="${param.boardNum }">
			      		<input type="hidden" name="userId" value="${sessionScope.user_info.getUserId()}">
						<p class="comment-answer-button">답글달기</p>
		    		</form>
				</c:otherwise>
			</c:choose>
		</c:forEach>
      	<form action="reply" name="commentContent" onsubmit="return commentChk()"> 
			<input type="hidden" id="groupNum" name="groupNum" value="-1" >
      		<input type="hidden" name="boardNum" value="${param.boardNum }">
      		<input type="hidden" name="userId" value="${sessionScope.user_info.getUserId()}">
	      	<div class="comment-add">
	      		<textarea id="cContent" name="cContent" rows="5" cols="99"></textarea>
	      		<button>등록</button>
	      	</div>
	    </form>
	</div>
</div>

<jsp:include page="layout/footer.jsp" />

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이야(IYA)</title>

<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/default.css">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function cate2URL(cate2){
   var url = "board";
   
   if(${ cate1==1 }){
      url+="?cate1=1";
   }else if(${cate1==2}){
      url+="?cate1=2";
   }else if(${cate1==3}){
      url+="?cate1=3";
   }else {
      url+="?cate1=0";
   }

   for(var i=1;i<7;i++){
      if(cate2==i){
         url+="&cate2="+i;
         break;
      }
   }
   
   if(${param.myboard==1}) {
	   url+="&myboard=1&search1=${param.search1}&search2=${param.search2}"
   }
   
   location.href=url;
}
</script>
</head>
<body>

<jsp:include page="layout/header.jsp" />

<!-- 컨텐츠 [s] -->
<div class="content-wrap">
   <h2 class="content-title" id="boardTitle">
      <c:choose>
         <c:when test="${param.myboard==1 }">내가 쓴 글</c:when>
         <c:when test="${cate1==1 }">서울게시판</c:when>
         <c:when test="${cate1==2 }">인천게시판</c:when>
         <c:when test="${cate1==3 }">경기게시판</c:when>
         <c:when test="${cate1==null || cate1==0  }">전체게시판</c:when>
      </c:choose>
   </h2>

   <!-- 탭 메뉴 -->
   <div class="board-tab-menu">
      <ul>
         <li class='<c:if test="${cate2==null }">active</c:if>' onclick="cate2URL()">전체</li>
         <li class='<c:if test="${cate2==1 }">active</c:if>' onclick="cate2URL(1)">맛집</li>
         <li class='<c:if test="${cate2==2 }">active</c:if>' onclick="cate2URL(2)">관광지</li>
         <li class='<c:if test="${cate2==3 }">active</c:if>' onclick="cate2URL(3)">교육</li>
         <li class='<c:if test="${cate2==4 }">active</c:if>' onclick="cate2URL(4)">미용</li>
         <li class='<c:if test="${cate2==5 }">active</c:if>' onclick="cate2URL(5)">자유게시판</li>
         <li class='<c:if test="${cate2==6 }">active</c:if>' onclick="cate2URL(6)">질문과답변</li>
      </ul>
   </div>
   
    <!-- 테이블 -->
    <div class="board-list">
        <div class="board-title">
        	전체  ( <span>${boardCount}개</span> )
        	<c:choose>
        		<c:when test="${sessionScope.user_info != null }">
         			<a href="write?writeType=1">글쓰기</a>
        		</c:when>
        		<c:otherwise>
        			<a href="login">글쓰기</a>
        		</c:otherwise>
        	</c:choose>
      </div>   
      <table>
         <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>등록일</th>
            <th>조회</th>
            <th>추천수</th>
         </tr>
         <c:choose>
            <c:when test="${boardList.size() > 0 }">
               <c:forEach var="i" begin="0" end="${boardList.size()-1 }"> 
                     <tr>
                        <td>${ boardList[i].getBoardnum() }</td>
                        <td><a href="detail?boardNum=${boardList[i].getBoardnum() }">${ boardList[i].getBoardtitle() } &nbsp;<span>[${commentCount[i] }]</span></a></td>
                        <td>${ boardList[i].getUserId() }</td>
                        <td>${ boardList[i].getBoardtime()  }</td>
                        <td>${ boardList[i].getViewnum() }</td>
                        <td>${ boardList[i].getPostup()  }</td>
                     </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="6">해당 게시글이 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </table>
      
      <!-- 페이징 -->
      <form action="board" method="post">
         <div class="page-wrap">
         <c:if test="${paging==null }">
	         <c:set var="paging" value="1"></c:set>
         </c:if>
         <fmt:parseNumber var="pag" value="${paging%5==0?paging/5-1:paging/5 }" integerOnly="true" />
         	<c:if test="${paging>5 && boardCount/5 > 5 }">
         		<span><a href="board?cate1=${param.cate1 }&cate2=${param.cate2 }&search1=${search1 }&search2=${search2 }&paging=${(pag-1)*5+1 }"><</a></span>&nbsp;
         	</c:if>
         	<c:forEach var="i" begin="${paging%5==0?(pag)*5+1:pag*5+1 }" end="${pag*5+5<= boardCount/5?pag*5+5:boardCount%5==0?boardCount/5:boardCount/5+1 }">
                <a href="board?cate1=${param.cate1 }&cate2=${param.cate2 }&search1=${search1 }&search2=${search2 }&paging=${i }" class="<c:if test="${paging==i }">active</c:if>">${i }</a>&nbsp; 
            </c:forEach>
         	<c:if test="${pag*5+5< boardCount/5 }">
               <span><a href="board?cate1=${param.cate1 }&cate2=${param.cate2 }&search1=${search1 }&search2=${search2 }&paging=${(pag+1)*5+1  }" >></a></span> &nbsp;
            </c:if>
         </div>
      </form>
      <!-- 검색 -->
      <form action="board" method="post">
      	<c:if test="${param.myboard!=null }">
         	<input type="hidden" id="mayboard" name="myboard" value="${param.myboard }" >
      	</c:if>
         <input type="hidden" id="cate1" name="cate1" value="${param.cate1 }" >
         <input type="hidden" id="cate2" name="cate2" value="${param.cate2 }" >
         <div class="board-search ">
            <select class="small" id="search1" name="search1">
               <option >검색</option>
               <option value="1" <c:if test="${param.search1 == '1'}">selected</c:if>>제목</option>
               <option value="2" <c:if test="${param.search1 == '2'}">selected</c:if>>내용</option>
               <option value="3" <c:if test="${param.search1 == '3'}">selected</c:if>>글쓴이</option> 
               <option value="4" <c:if test="${param.search1 == '4'}">selected</c:if>>제목+내용</option>
            </select>
            <input class="medium" type="text" id="search2" name="search2" value="${param.search2 }" placeholder="검색 단어">
            <button type="submit"><img src="resources/images/search.png" alt="검색 아이콘"></button>
         </div>
      </form>

   </div>
</div>
<!-- 컨텐츠 [e] -->

<jsp:include page="layout/footer.jsp" />

</body>
</html>
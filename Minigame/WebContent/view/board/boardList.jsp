<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
</head>
<body>
<div class="w3-main" style="margin-left:250px">
 <div class="w3-container w3-padding-large " >  
    <h4 id="contact"><b>문의사항</b></h4>
  
    <hr class="w3-opacity">
    <c:if test="${sessionScope.email!=null }">
	 	<div class = "w3-right-align"><a href="BoardRegistView.do" id="regBtn" class="w3-btn w3-white w3-border w3-border-blue w3-round-xlarge">글 쓰기</a></div>   
	</c:if>
    <table class="w3-table w3-bordered w3-striped w3-border test w3-hoverable">
		<tr class="w3-grey">
		  <th>번호</th>
		  <th>이름</th>
		  <th>제목</th>
		  <th>조회수</th>
		  <th>등록일</th>
		</tr>
		<tbody>
			 <c:forEach var="result" items="${boardList}">
				<tr>
				  <td>${result.rowNumber}</td>
				  <td>${result.nicName}</td>
				  <td>
				  	<c:choose>
				    	<c:when test="${sessionScope.email!=null }">
							<a href="BoardDetailView.do?boardNo=${result.boardNo}">${result.inqTitle}</a>
				 	 	</c:when>
				 	 	<c:otherwise>
				 	 		${result.inqTitle}
				 	 	</c:otherwise>
			 	 	</c:choose>
				  </td>
				  <td>${result.viewCnt}</td>
				  <td>${result.inqRegDt}</td>
				</tr>
			</c:forEach>			
		</tbody>
	</table>
	<center>
         <ul class="pagination pagination-centered">
            <li><a href="board.do?page=1">&laquo;</a></li>
            <fmt:parseNumber var="num" value="${curpage/10}" integerOnly="true" />
            <c:set var="num" value="${num<=0?1:num*10}" />
            <c:forEach var="i" begin="${num}" end="${num==1?num+8:num+9}">
               <c:choose>
                  <c:when test="${i > totalpage-1 }"></c:when>
                  <c:when test="${i==curpage}">
                     <li class="active"><a href="board.do?page=${i}">${i}</a></li>
                  </c:when>
                  <c:when test="${i <= totalpage}">
                     <li><a href="board.do?page=${i}">${i}</a></li>
                  </c:when>
               </c:choose>
            </c:forEach>
            <li>
               <a href="board.do?page=${totalpage-1}">&raquo;</a>
            </li>
         </ul>
      </center>
  </div>
 </div>
</body>
<script type="text/javascript">

$( document ).ready(function() {

});
</script>
</html>




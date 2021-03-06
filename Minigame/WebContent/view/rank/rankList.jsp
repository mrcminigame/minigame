<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <!-- Pricing Tables -->
 <div class="w3-main" style="margin-left: 250px">
 	<h4 class="text-center" style="font-size: 30px; font-weight: bold;">게임 별 Rank5</h4>
    <div class="w3-row-padding" style="margin:0 -16px">
      <c:forEach var="result" items="${resultList}" varStatus="i">
	      <div class="w3-third w3-margin-bottom">
	        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
	          <li class="w3-black w3-xlarge w3-padding-32">${result.gameName}</li>
	          <c:forEach var="list" items="${result.rankList}" varStatus="i">
	         	<c:choose>
	         		<c:when test = "${list.highScore eq null}" >
	         			<li class="w3-padding-16">당신의 자리에 도전하세요!</li>
	         		</c:when>
	         		<c:otherwise>
	         			<strong>${i.count} 위</strong><img src="./view/main/images/insignia.png"/>
			         	 <li class="w3-padding-16">
			         	 	이름: ${list.nicName} 
			         	 	<P>최고점수: ${list.highScore}
			         	 </li>
	         		</c:otherwise>
	         	</c:choose>
			  </c:forEach>
	          <li class="w3-padding-16">
	            <h2>최고 점수 :${result.highScore}</h2>
	          </li>
	        </ul>
	      </div>
      </c:forEach>
    </div>
</div>
  
</body>
</html>
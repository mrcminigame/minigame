<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
</head>
<body>
    <!-- Pricing Tables -->
 <div class="w3-main" style="margin-left: 250px">
 	 <h4>게임 별 Rank5</h4>
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-black w3-xlarge w3-padding-32">${gameName}</li>
          <c:forEach var="list" items="${firstList}" varStatus="i">
         	${i.count}위
         	 <li class="w3-padding-16">이름: ${list.nicName} 
         	 	<P>최고점수: ${list.highScore}
         	 	<p>승률 : (${list.winRate}%)</li>
		  </c:forEach>
          <li class="w3-padding-16">
            <h2>최고 점수 :${highScore}</h2>
          </li>
         
        </ul>
      </div>
      
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-teal w3-xlarge w3-padding-32">카드뒤집기</li>
			<c:forEach var="list" items="${secondList}" end="5">
		         			<li class="w3-padding-16">${list.nicName} : ${list.highScore}(${list.winRate}%)</li>
<%-- 				<c:choose>
					<c:when test="${list.nicName eq null}">
							<li class="w3-padding-16">명예의 자리에 도전해보세요!</li>
					</c:when>
					<c:otherwise>
		         			<li class="w3-padding-16">${list.nicName} : ${list.highScore}</li>
					</c:otherwise>
				</c:choose> --%>
		  	</c:forEach>
          	<li class="w3-padding-16">
            <h2>최고 점수 :580</h2>
          </li>
         <!--  <li class="w3-light-grey w3-padding-24">
            <button class="w3-button w3-teal w3-padding-large w3-hover-black">Sign Up</button>
          </li> -->
        </ul>
      </div>
     <!--  
      <div class="w3-third">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-black w3-xlarge w3-padding-32">Premium</li>
          <li class="w3-padding-16">Web Design</li>
          <li class="w3-padding-16">Photography</li>
          <li class="w3-padding-16">Unlimited Storage</li>
          <li class="w3-padding-16">Endless Support</li>
          <li class="w3-padding-16">
            <h2>$ 25</h2>
            <span class="w3-opacity">per month</span>
          </li>
          <li class="w3-light-grey w3-padding-24">
            <button class="w3-button w3-teal w3-padding-large w3-hover-black">Sign Up</button>
          </li>
        </ul>
      </div> -->
    </div>
</div>
  
</body>
</html>
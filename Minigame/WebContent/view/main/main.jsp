<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" >
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>

</head>
<body class="w3-light-grey w3-content" style="max-width:1600px">
<!-- Side Navigation bar -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:200px;" id="mySidebar"><br>
  <div class="w3-container">
   <!--   <img src="images/avatar.jpg" style="width:45%;" class="w3-round"><br><br> -->
   <c:if test="${sessionScope.email!=null }">
    <h4><b>${sessionScope.email }</b></h4>
    <p class="w3-text-grey">${sessionScope.nic_Name }</p>
    </c:if>
    <c:if test="${sessionScope.email==null }">
        <h4><b>환영합니다.</b></h4>
    <p class="w3-text-grey">방문자님</p>
    </c:if>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-th-large fa-fw w3-margin-right"></i>Main</a> 
    <a href="rank.do" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>Rank</a>
    <a href="board.do" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>Q/A</a>
    <a href="memberJoin.do" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>Sign Up</a>
    <c:if test="${sessionScope.email==null }">
    <a href="login.do" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>Login</a>
    </c:if>
    <c:if test="${sessionScope.email!=null }">
    <a href="logout.do" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>Logout</a>
    </c:if>
  </div>
</nav>
	
<jsp:include page="${main_jsp }"></jsp:include>
  <!-- Footer -->
  <footer class="w3-container w3-padding-32 w3-dark-grey" style="margin-left: 250px">
	  <div class="w3-row-padding">
	   <!--  <div class="w3-third">
	      <h3>FOOTER</h3>
	      <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
	      <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
	    </div>
	  
	    <div class="w3-third">
	      <h3>BLOG POSTS</h3>
	      <ul class="w3-ul w3-hoverable">
	        <li class="w3-padding-16">
	          <img src="/w3images/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">
	          <span class="w3-large">Lorem</span><br>
	          <span>Sed mattis nunc</span>
	        </li>
	        <li class="w3-padding-16">
	          <img src="/w3images/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">
	          <span class="w3-large">Ipsum</span><br>
	          <span>Praes tinci sed</span>
	        </li> 
	      </ul>
	    </div> -->
	
	    <div class="w3-third" >
	      <h3>POPULAR TAGS</h3>
	      <p>
	        <span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">London</span>
	        <span class="w3-tag w3-grey w3-small w3-margin-bottom">IKEA</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">NORWAY</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">DIY</span>
	        <span class="w3-tag w3-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Baby</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Family</span>
	        <span class="w3-tag w3-grey w3-small w3-margin-bottom">News</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Clothing</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Shopping</span>
	        <span class="w3-tag w3-grey w3-small w3-margin-bottom">Sports</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Games</span>
	      </p>
	    </div>
	  </div>
  </footer>
  
  <div class="w3-black w3-center w3-padding-24"  style="margin-left: 250px">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>
</body>
</html>
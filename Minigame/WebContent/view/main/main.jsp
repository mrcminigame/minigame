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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="view/main/css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


</head>
<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<!-- Side Navigation bar -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style="z-index:3;width:200px;" id="mySidebar"> <br>
	<div class="w3-container">
	<img alt="mrc" src="view/main/images/minigames-logo.png"style="width:100%">
	<div style="height:30px"></div>
		<!--   <img src="images/avatar.jpg" style="width:45%;" class="w3-round"><br><br> -->
		<c:if test="${sessionScope.email!=null }">
			
			<p class="w3-text-grey">${sessionScope.nic_Name }님 환영합니다</p>
		</c:if>
		
	</div>
	<div class="w3-bar-block">
		<a href="main.do" class="w3-bar-item w3-button w3-padding"><i
			class="fa fa-home fa-fw w3-margin-right"></i>Main</a>
	    <a href="rank.do" class="w3-bar-item w3-button w3-padding"><i
			class="fa fa fa-bars fa-fw w3-margin-right"></i>Rank</a> 
		<a href="board.do"	class="w3-bar-item w3-button w3-padding"><i
			class="fa fa-envelope fa-fw w3-margin-right"></i>Q/A</a>

		<c:if test="${sessionScope.email==null }">
			<a href="memberJoin.do" class="w3-bar-item w3-button w3-padding"><i
				class="fa fa fa-male fa-fw w3-margin-right"></i>Sign Up</a>
			<a href="login.do" class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-user fa-fw w3-margin-right"></i>Login</a>
		</c:if>
		<c:if test="${sessionScope.email!=null && sessionScope.mem_Grd_Code eq '002'}">
			<a href="admin.do" class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-envelope fa-fw w3-margin-right"></i>Admin</a>
		</c:if>
		<c:if test="${sessionScope.email!=null }">
			<a href="myPage.do" class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-envelope fa-fw w3-margin-right"></i>MyPage</a>
			<a href="logout.do" class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-user fa-fw w3-margin-right"></i>Logout</a>

		</c:if>

	</div>
	</nav>


	<jsp:include page="${main_jsp }"></jsp:include>
	<!-- Footer -->

	<footer class="w3-black w3-container w3-padding-16 w3-margin-bottom"
		id="footer" style="margin-left: 210px">
	<div class="w3-third w3-container">
		<img alt="mrc" src="view/main/images/Miracom_CI.png"
			style="height: 120px">
	</div>
	<div class="w3-third w3-container">
		COPYRIGHT ⓒ 2018 <br> 서경진 kj.seo@miracom.co.kr<br> 이은비
		eunbi91.lee@miracom.co.kr <br> 오진혁 jinhyeok.oh@miracom.co.kr <br>
		장지해 jihae.jang@miracom.co.kr <br> MIRACOM Inc Co., Ltd ALL RIGHT
		RESERVED.
	</div>
	<div class="w3-third w3-container"></div>

	</footer>


</body>
</html>
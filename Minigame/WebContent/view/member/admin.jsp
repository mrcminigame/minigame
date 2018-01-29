<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
</style>
</head>
<body>
	<c:choose>

	<c:when test="${sessionScope.email == null }">
		<script>
			alert("잘못된 접근입니다.");
			history.back();
		</script>
	</c:when>

	<c:when test="${sessionScope.mem_Grd_Code ne '002'}">
		<script>
			alert("권한이 없습니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${sessionScope.mem_Grd_Code eq '002'}">
		<script>
			alert("관리자입니다.");
		</script>
	</c:when>
</c:choose>
	<div class="w3-main" style="margin-left: 250px">
		<div class="w3-container w3-padding-large ">
			<c:forEach var="list" items="${list }">
				<li>&nbsp;&nbsp; <span>${list.email }</span></li>
				<li>&nbsp;&nbsp; <span>${list.nic_Name }</span></li>
				<li>&nbsp;&nbsp; <span>${list.mem_Grd_Code }</span></li>
			</c:forEach>
		</div>
	</div>
</body>
</html>
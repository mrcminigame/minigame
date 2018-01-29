<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="w3-main" style="margin-left: 250px">

		<div class="w3-container w3-padding-large ">
			<h1>검색결과</h1>
			<a href="admin.do" type="button" class="btn btn-default">뒤로가기</a>
			<hr>
			<br>
			<table class="w3-table">
				<tr>
					<th>Email</th>
					<th>Password</th>
					<th>NickName</th>
					<th>Grade Code</th>
					<th>Phone Number</th>
					<th>Regist Date</th>
					<th>Modify Date</th>
					<th>Current</th>
				</tr>
				<c:forEach var="list" items="${list }">
					<tr>
						<td>${list.email}</td>
						<td>${list.pwd }</td>
						<td>${list.nic_Name }</td>
						<td>${list.mem_Grd_Code }</td>
						<td>${list.phone }</td>
						<td>${list.reg_Dt }</td>
						<td>${list.mod_Dt }</td>
						<td>${list.use_Yn }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="list" items="${list }">
		<li>&nbsp;&nbsp; <span>${list.episodeid }</span></li>
		<li>&nbsp;&nbsp; <span>${list.episodename }</span></li>
		<li>&nbsp;&nbsp; <span>${list.openyear }</span></li>
		
	</c:forEach>
</body>
</html>
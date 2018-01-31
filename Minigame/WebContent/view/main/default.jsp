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

	<div class="w3-main" style="margin-left: 250px">
		<div class="w3-row-padding" style="padding-top: 50px">
			<c:forEach var="list" items="${list}">
				<div class="w3-third w3-container w3-margin-bottom">
				<a href="${list.gameNo }.do">
					<img src="./view/main/images/${list.gameNo }.png" alt="Norway"
						style="width: 100%" class="w3-hover-opacity">
					</a>
					<div class="w3-container w3-white">
						<p>
							<b>${list.gameName }</b>
						</p>
						<p>${list.gameExp }</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
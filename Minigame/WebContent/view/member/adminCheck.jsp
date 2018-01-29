<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<%
			response.sendRedirect("admin.do");
		%>
	</c:when>
</c:choose>
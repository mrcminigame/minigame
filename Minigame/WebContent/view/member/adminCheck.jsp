<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>

	<c:when test="${sessionScope.email == null }">
		<script>
			alert("�߸��� �����Դϴ�.");
			history.back();
		</script>
	</c:when>

	<c:when test="${sessionScope.mem_Grd_Code ne '002'}">
		<script>
			alert("������ �����ϴ�.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${sessionScope.mem_Grd_Code eq '002'}">
		<script>
			alert("�������Դϴ�.");
		</script>
		<%
			response.sendRedirect("admin.do");
		%>
	</c:when>
</c:choose>
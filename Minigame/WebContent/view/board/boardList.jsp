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
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
</head>
<body>
<div class="w3-main" style="margin-left:250px">
 <div class="w3-container w3-padding-large " >  
    <h4 id="contact"><b>문의사항</b></h4>
   <!--  <div class="w3-row-padding w3-center w3-padding-24" style="margin:0 -16px">
      <div class="w3-third w3-dark-grey">
        <p><i class="fa fa-envelope w3-xxlarge w3-text-light-grey"></i></p>
        <p>email@email.com</p>
      </div>
      <div class="w3-third w3-teal">
        <p><i class="fa fa-map-marker w3-xxlarge w3-text-light-grey"></i></p>
        <p>Chicago, US</p>
      </div>
      <div class="w3-third w3-dark-grey">
        <p><i class="fa fa-phone w3-xxlarge w3-text-light-grey"></i></p>
        <p>512312311</p>
      </div>
    </div> -->
 	<span><a href="BoardRegistView.do" id="regBtn" class="w3-btn w3-white w3-border w3-border-green w3-round-xlarge">등록</a></span>   
    <hr class="w3-opacity">
    <table class="w3-table w3-bordered w3-striped w3-border test w3-hoverable">
		<tr class="w3-grey">
		  <th>번호</th>
		  <th>이름</th>
		  <th>제목</th>
		  <th>조회수</th>
		  <th>등록일</th>
		</tr>
		<tbody>
			 <c:forEach var="result" items="${boardList}">
				<tr>
				  <td>${result.rowNum}</td>
				  <td>${result.nicName}</td>
				  <td><a href="">${result.inqTitle}</a></td>
				  <td>${result.viewCnt}</td>
				  <td>${result.inqRegDt}</td>
				</tr>
			</c:forEach>			
		</tbody>
	</table>
  </div>
 </div>
</body>
<script type="text/javascript">

$( document ).ready(function() {

});
</script>
</html>




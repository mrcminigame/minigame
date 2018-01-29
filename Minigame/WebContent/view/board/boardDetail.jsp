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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="css/newmember.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
	body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
</head>
<body>
<hr>
<div class="w3-main" style="margin-left:250px">
 <div class="w3-container w3-teal">
  <h2>문의사항</h2>
</div>
<form class="w3-container w3-card-4" id="delFrm" action="delBoard.do" method="post">
	<input type ="hidden" name="boardNo" value="${param.boardNo}"/>
	<input type ="hidden" name="flag" value=""/>
</form>
<p>
<div class= "w3-right-align">
	<span>작성자 : ${detail.inqMemEmail}( ${detail.nicName}) </span>
	<p>
	<span>등록일: ${detail.inqRegDt}</span>
</div>
<br>
<p>      
	<label class="w3-text-grey">제목</label>
	<input class="w3-input w3-border" type="text" id="inqTitle" name="inqTitle" readonly="readonly" value="${detail.inqTitle}">
	
</p>
<p>      
<!-- <label class="w3-text-grey">Email</label>
<input class="w3-input w3-border" type="text" required> -->
</p>
<p>      
	<label class="w3-text-grey">내용</label>
	<textarea class="w3-input w3-border" style="resize:none" id="inqContent" name="inqContent" readonly="readonly">${detail.inqContent}</textarea>
</p>
<hr>
<form id="ansRegFrm" action="registBoardAns.do" method="post">    
<p> 
	
	<label class="w3-text-grey">답글</label>
	<input type ="hidden" name="boardNum" value="${param.boardNo}"/>
		<c:choose>
			<c:when test="${detail.ansUseYn eq 'Y'}">
				<textarea class="w3-input w3-border" style="resize:none" disabled="disabled">	${detail.ansContent}</textarea>
			</c:when>
			<%-- <c:when test="${detail.ansUseYn eq 'N'}">
				<textarea class="w3-input w3-border" style="resize:none" disabled="disabled">	삭제된 댓글입니다.</textarea>
			</c:when> --%>
			<c:otherwise>
				<textarea class="w3-input w3-border" style="resize:none" id="ansContent" name="ansContent">	</textarea>
			</c:otherwise>
		</c:choose>
		<div class = "w3-right-align">
		 <button type="button" id="regBoardAns" class="w3-btn  w3-small w3-white w3-border w3-border-black w3-text-black w3-round-large w3-padding-small" style="width:120px">댓글 등록 &nbsp;</button>
		 <c:if test="${detail.ansUseYn eq 'Y' && sessionScope.mem_Grd_Code eq '002'}">
		 	<button type="button" id="delBoardAns" class="w3-btn  w3-small w3-white w3-border w3-border-red w3-text-red w3-round-large w3-padding-small" style="width:120px">댓글 삭제 &nbsp;</button>
		 </c:if>
		</div>
</form>

<br>
  <p>
  <button type="button" id="listBtn" class="w3-button w3-teal" style="width:120px" onclick=" location.href='board.do'">목록 &nbsp;</button>
   <c:if test="${sessionScope.mem_Grd_Code eq '002'}">
	 <button type="button" id="delBoardInq" class="w3-button w3-red" style="width:120px">삭제 </button>
   </c:if>
 </div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$( "#delBoardInq" ).click(function() {
			if(valChk()){
				if(confirm('삭제하시겠습니까?')){
					$("#flag").val('inq');
					$("#delFrm").submit();
				}	
			}
			
		});
		$( "#delBoardAns" ).click(function() {
			if(confirm('삭제하시겠습니까?')){
				$("#flag").val('ans');
				$("#delFrm").submit();
			}
		});	
		
		$( "#regBoardAns" ).click(function() {
			if(confirm('등록하시겠습니까?')){
				$("#ansRegFrm").submit();
			}
		});
	});
	function valChk(){
		if($("#ansContent").val() == null || $("#ansContent").val() == '' ){
			alert("댓글을 입력해주세요.");
			return false;
		}
		return true;
	}
</script>
</html>
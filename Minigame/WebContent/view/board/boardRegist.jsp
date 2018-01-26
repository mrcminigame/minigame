<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">\
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
<form class="w3-container w3-card-4" id="regFrm" action="registBoardInq.do" method="post">
<br>
<p>      
	<label class="w3-text-grey">제목</label>
	<input class="w3-input w3-border" type="text" id="inqTitle" name="inqTitle"  >
</p>
<p>      
<!-- <label class="w3-text-grey">Email</label>
<input class="w3-input w3-border" type="text" required> -->
</p>
<p>      
	<label class="w3-text-grey">내용</label>
	<textarea class="w3-input w3-border" style="resize:none" id="inqContent" name="inqContent" ></textarea>
</p>
<br>
  <p><button type="button" id="regBoardBtn" class="w3-btn w3-padding w3-teal" style="width:120px">Send &nbsp; &#10095;</button></p>
</form>
 </div>
</body>

<script type="text/javascript">

$(document).ready(function() {
	$( "#regBoardBtn" ).click(function() {
		/* console.log($('#regFrm').serialize());
				alert("hi");
				$.ajax({
					url : "registBoard.do",
					type : 'POST',
					data : $('#regFrm').serialize(),
					dataType: "json", 
					success : function(res) {
						var count = res.trim();
						 if (count == 0) {
							$("#emailcheckBtn").prop('class',
									'btn btn-success');
							alert('사용가능한 이메일 입니다.');
							$("#emailcheckBtn").text('사용가능');
						} else {
							$("#emailcheckBtn").prop('class',
									'btn btn-warning');
							alert('사용불가능한 이메일 입니다.');
							$("#emailcheckBtn").text('사용불가');

						} 
						alert("성공!!!")
					},
					error : function(error) {
						alert(error)
						alert("!!AJAX FAIL");
					}
				}); */
				$("#regFrm").submit();
			});
	
	
});
</script>
</html>
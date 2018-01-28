<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- 닉네임 체크 -->
<script>
	$(function() {
		$('#checkBtn').click(function() {
			debugger
			var nic_Name = $('#nic_Name').val();
			if (nic_Name.trim() == "") {
				$('#nic_Name').focus();
				return;
			}

			$.ajax({
				url : "nic_NameCheck.do",
				type : 'POST',
				data : {
					"nic_Name" : nic_Name
				},
				success : function(res) {
					alert(res.trim());
					var count = res.trim();
					if (count == 0) {
						$("#checkBtn").prop('class', 'btn btn-success');
						alert('사용가능한 닉네임 입니다.');
						$("#checkBtn").text('사용가능');
					} else {
						$("#checkBtn").prop('class', 'btn btn-warning');
						alert('사용불가능한 닉네임 입니다.');
						$("#checkBtn").text('사용불가');

					}
				},
				error : function(error) {
					alert(error);
					alert("!!AJAX FAIL");
				}
			});

		});

	})
</script>
<script type="text/javascript">
$(function(){
	$('.ya').click(function(){
		$(".ya").prop('class', 'btn btn-success');
	});
	$('#update').click(function(){
		
		var Mpassword=$('#changepwd').val();
		var Hpassword=$('#checkpwd').val();
		if(changepwd.trim()=="")
		{
			alert("비밀번호를 입력하세요");
			$('#changepwd').focus();
			return;
		}else if(changepwd!=checkpwd){
			alert("비밀번호가 일치하지 않습니다!")
			$('#changepwd').focus();
			return;
		}
		else{
			alert("수정이 완료되었습니다.")
			$('#form').submit();
		}  
		
		
	});
});
</script>

</head>
<body>
	<article class="container">
	<div class="page-header">
		<h1 class="text-center">마이페이지</h1>
	</div>
	<div class="col-md-6 col-md-offset-3">


		<form method="post" action="memberUpdate.do" id="form">
			<!-- 이메일 입력 -->
			<div class="email form-group">
				<label for="username">이메일</label>
				<div class="input-group">

					<p>
						<input type="text" class="form-control" name="email"
							id="useremail" value="${sessionScope.email }" readonly />
					</p>
				</div>
			</div>

			<!--  이름 닉네임 입력 부분 -->
			<div class="name form-group">
				<label for="username">이름(닉네임)</label>
				<div class="input-group">

					<input type="text" class="form-control" name="id" id="id"
						value="${sessionScope.nic_Name }"> <span
						class="input-group-btn"> <a href="#" class="btn btn-info"
						onClick="emailCheckfunction();" id="checkBtn">중복확인</a>
					</span>
				</div>
			</div>


			<!-- 비밀번호 입력 -->
			<div class="form-group">
				<label for="password">비밀번호</label> <input type="password" name="pwd"
					class="form-control" id="changepwd"> <input type="hidden"
					id="checkpwd" value="${sessionScope.pwd }">

			</div>


			<!-- 휴대폰 번호 입력  -->
			<div class="form-group">
				<label for="telnumber">휴대폰 번호</label>
				<div class="input-group">

					<input type="tel" class="form-control" name="phone" id="phone"
						value="${sessionScope.phone }">

				</div>
			</div>
			<!-- 회원가입, 취소 버튼 -->
			<div class="form-group text-center">

				<input type="button" class="btn btn-info" id="update" value="수정확인" />

				<a href="main.do" type="submit" class="btn btn-default">수정취소</a>
		</form>
	</div>

	</article>
	</div>
</body>
</html>
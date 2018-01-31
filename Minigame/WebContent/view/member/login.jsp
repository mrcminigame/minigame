<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="css/newmember.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="bodybody">
		<article class="container">
		<div class="page-header">
			<h1 class="text-center" style="font-size: 30px; font-weight: bold;">
				로그인 <small></small>
			</h1>
		</div>
		<div class="col-md-6 col-md-offset-3" style="margin-top: 30px;">


			<form method="post" action="loginOk.do" id="logForm"
				accept-charset="EUC-KR">
				<!-- 이메일 입력 -->
				<div class="email form-group">
					<label for="username">이메일</label>
					<input type="text" class="form-control" name="email" id="email"
							placeholder="ex)hong@gildong.com"> <span
							class="input-group-btn"> </span>
				
				</div>
				<!-- 비밀번호 입력 -->
				<div class="form-group">
					<label for="password">비밀번호</label> <input type="password"
						name="pwd" class="form-control" id="pwd">
				</div>


				<!-- 회원가입, 취소 버튼 -->
				<div class="form-group text-center">

					<input type="submit" class="btn btn-info" id="login" value="로그인" />

					<a href="main.do" type="button" class="btn btn-default">취소</a>
				</div>
			</form>

		</div>

		</article>
	</div>
</body>
</html>
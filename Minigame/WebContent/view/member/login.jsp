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
				�α��� <small></small>
			</h1>
		</div>
		<div class="col-md-6 col-md-offset-3" style="margin-top: 30px;">


			<form method="post" action="loginOk.do" id="logForm"
				accept-charset="EUC-KR">
				<!-- �̸��� �Է� -->
				<div class="email form-group">
					<label for="username">�̸���</label>
					<input type="text" class="form-control" name="email" id="email"
							placeholder="ex)hong@gildong.com"> <span
							class="input-group-btn"> </span>
				
				</div>
				<!-- ��й�ȣ �Է� -->
				<div class="form-group">
					<label for="password">��й�ȣ</label> <input type="password"
						name="pwd" class="form-control" id="pwd">
				</div>


				<!-- ȸ������, ��� ��ư -->
				<div class="form-group text-center">

					<input type="submit" class="btn btn-info" id="login" value="�α���" />

					<a href="main.do" type="button" class="btn btn-default">���</a>
				</div>
			</form>

		</div>

		</article>
	</div>
</body>
</html>
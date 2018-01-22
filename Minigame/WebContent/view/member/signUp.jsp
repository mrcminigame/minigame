<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 이름 닉네임 체크 부분  -->


<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<div>
  <div class="w3-main" style="margin-left: 250px">
	<div class="w3-container">
      <h1>Sign Up</h1>
      <p>Please fill in this form to create an account.</p>
      <hr>
      <form method="post" action="memberJoin.do" id="newform">
      <label><b>Email</b></label>
      <input type="text" class="w3-input" placeholder="Enter Email" name="email" style="width:30%"required>
	  <a href="#" class="w3-btn w3-btn-info" onClick="emailCheckfunction();" id="checkBtn">중복확인</a>
      <label><b>Password</b></label>
      <input type="password" class="w3-input" placeholder="Enter Password" name="psw" style="width:30%"required>

      <label><b>Repeat Password</b></label>
      <input type="password" class="w3-input" placeholder="Repeat Password" name="psw-repeat"style="width:30%" required>
      <input type="text" class="w3-input" placeholder="Enter Name" name="name" style="width:30%"required>
      <input type="text" class="w3-input" placeholder="Enter Nickname" name="nickname" style="width:30%"required>
      <input type="text" class="w3-input" placeholder="Enter Phone" name="phone" style="width:30%"required>
      <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

      <div class="clearfix">
        <button type="button" class="w3-btn w3-blue" class="cancelbtn">Cancel</button>
        <button type="submit" class="w3-btn w3-red">Sign Up</button>
      </div>
      </form>
	</div>
  </div>
</div>
</body>
</html>
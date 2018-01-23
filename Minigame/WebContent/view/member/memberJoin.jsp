<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>GGGL-회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/newmember.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>  


<!-- 이름 닉네임 체크 부분  -->
<script type="text/javascript">
$(function emailCheckfunction(){
	 $('#checkBtn').click(function(){
	 	var nicName=$('#nicName').val();
		if(nicName.trim()=="")
		{
			$('#nicName').focus();
			alert("이름을 입력해주세요");
			return;
		} 
		
	 	$.ajax({
			type:'post',
			url:'checkmember.do',
			data:{"nicName":nicName},
			success:function(res)
			{
				var count=res.trim();
				 if(count==0)
				{
					
					$("#checkBtn").prop('class', 'btn btn-success');
				 	$("#checkBtn").text('사용가능');
				 	alert("사용가능한 아이디 입니다");
				}
				else
				{
					
					$("#checkBtn").prop('class', 'btn btn-warning');
					$("#checkBtn").text('사용불가');
					alert("사용불가능한 아이디 입니다");
					
				}   
			},
			error:function(error) {
				alert(data)
				alert("!!AJAX FAIL"); 
		 	} 
			
			
		}); 
	});
});
</script>
<!-- 이메일 체크 부분  -->
<script type="text/javascript">
$(function(){

	$('#emailcheckBtn').click(function(){
	 	var email=$('#email').val();
	 	 var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

		if(email.trim()=="")
		{
			$('#email').focus();
			return;
		} else if(!regEmail.test(email)) {
            alert('이메일 주소가 유효하지 않습니다');
            $('#email').focus();
            return false;
        }


	 	$.ajax({
			type:'post',
			url:'emailCheck.do',
			data:{"email":email},
		
			success:function(res)
			{
				var count=res.trim();
				 if(count==0)
				{
					$("#emailcheckBtn").prop('class', 'btn btn-success');
					alert('사용가능한 이메일 입니다.');
				 	$("#emailcheckBtn").text('사용가능');
				}
				else
				{
					
					$("#emailcheckBtn").prop('class', 'btn btn-warning');
					alert('사용불가능한 이메일 입니다.');
					$("#emailcheckBtn").text('사용불가');
					
				}   
			},
			error:function(error) {
				alert(data)
				alert("!!AJAX FAIL"); 
		 	} 
		}); 
	});
});
</script>

<!-- 동의 버튼 -->
<script type="text/javascript">
	$(function() {

		$('#join').click(function() {
			var nicName = $('#nicName').val();
			var email = $('#email').val();
			var pwd = $('#pwd').val();
			var phone = $('#phone').val();
			var year = $('#year').val();
			var month = $('#month').val();
			var day = $('#day').val();
			var checkBtn = $('#checkBtn').text();
			var emailcheckBtn = $('#emailcheckBtn').text();
			var leng = $('input[name=favor]:checkbox:checked').length;

			if (email == "") {
				alert("이메일을 입력해 주세요.");
				$('#email').focus();
			} else if (nicName == "") {
				alert("닉네임을 입력해주세요.");
				$('#nicName').focus();
				return false;
			} else if (pwd == "") {
				alert("비밀번호를 입력해주세요");
				$('#pwd').focus();
			} else if (phone == "") {
				alert("핸드폰번호를 입력해주세요");
				$('#phone').focus();
			} else if (checkBtn == "중복확인") {
				alert("아이디를 중복확인 해주세요.")
			} else if (emailcheckBtn == "중복확인") {
				alert("이메일을 중복확인 해주세요")
			} else {
				alert("회원가입이 완료 되었습니다.");
				$('#newform').submit();
			}

		});

	});
</script>


</head>
<body>
<div class="bodybody">
<article class="container">
        <div class="page-header">
          <h1 class="text-center" style="font-size: 30px; font-weight: bold;">회원가입 <small></small></h1> 
        </div>
        <div class="col-md-6 col-md-offset-3" style="margin-top: 30px;">
          
         
          <form method="post" action="memberJoin.do" id="newform">
          
            
            <!-- 이메일 입력 -->
            <div class="email form-group">
              <label for="username">이메일</label>
              <div class="input-group">
             
                <input type="text" class="form-control" name="email" id="email" placeholder="ex)hong@gildong.com">
                <span class="input-group-btn">
                  <a href="#" class="btn btn-info" id="emailcheckBtn">중복확인</a>
                </span>
              </div>
            </div>
            <!--  이름 닉네임 입력 부분 -->
           <div class="name form-group">
              <label for="username">이름(닉네임)</label>
              <div class="input-group"> 
              
                <input type="text" class="form-control" name="nicName" id="nicName" placeholder="이름(닉네임)" >
              
                <span class="input-group-btn">
         
                  <a href="#" class="btn btn-info" onClick="emailCheckfunction();" id="checkBtn">중복확인</a>
                </span>
             </div>
            </div>
            <!-- 비밀번호 입력 -->
            <div class="form-group">
              <label for="password">비밀번호</label>
              
              <input type="password" name="pwd" class="form-control" id="pwd">
      
            </div>
            
            <!-- 휴대폰 번호 입력  -->
            <div class="form-group">
              <label for="phone">휴대폰 번호</label>
              <div class="input-group">
            
                <input type="tel" class="form-control" name="phone" id="phone" placeholder="- 삽입하고 입력해 주세요">
         	
              </div>
            </div>

            <!-- 회원가입, 취소 버튼 -->
            <div class="form-group text-center">
           
              <input type="button" class="btn btn-info" id="join" value="회원가입"/>
            	
              <a href="main.do" type="submit" class="btn btn-default" >가입취소</a>
            
              </form>
        </div>
		
      </article>
      </div>
</body>
</html>
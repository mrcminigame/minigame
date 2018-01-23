<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>GGGL-ȸ������</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/newmember.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>  


<!-- �̸� �г��� üũ �κ�  -->
<script type="text/javascript">
$(function emailCheckfunction(){
	 $('#checkBtn').click(function(){
	 	var nicName=$('#nicName').val();
		if(nicName.trim()=="")
		{
			$('#nicName').focus();
			alert("�̸��� �Է����ּ���");
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
				 	$("#checkBtn").text('��밡��');
				 	alert("��밡���� ���̵� �Դϴ�");
				}
				else
				{
					
					$("#checkBtn").prop('class', 'btn btn-warning');
					$("#checkBtn").text('���Ұ�');
					alert("���Ұ����� ���̵� �Դϴ�");
					
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
<!-- �̸��� üũ �κ�  -->
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
            alert('�̸��� �ּҰ� ��ȿ���� �ʽ��ϴ�');
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
					alert('��밡���� �̸��� �Դϴ�.');
				 	$("#emailcheckBtn").text('��밡��');
				}
				else
				{
					
					$("#emailcheckBtn").prop('class', 'btn btn-warning');
					alert('���Ұ����� �̸��� �Դϴ�.');
					$("#emailcheckBtn").text('���Ұ�');
					
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

<!-- ���� ��ư -->
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
				alert("�̸����� �Է��� �ּ���.");
				$('#email').focus();
			} else if (nicName == "") {
				alert("�г����� �Է����ּ���.");
				$('#nicName').focus();
				return false;
			} else if (pwd == "") {
				alert("��й�ȣ�� �Է����ּ���");
				$('#pwd').focus();
			} else if (phone == "") {
				alert("�ڵ�����ȣ�� �Է����ּ���");
				$('#phone').focus();
			} else if (checkBtn == "�ߺ�Ȯ��") {
				alert("���̵� �ߺ�Ȯ�� ���ּ���.")
			} else if (emailcheckBtn == "�ߺ�Ȯ��") {
				alert("�̸����� �ߺ�Ȯ�� ���ּ���")
			} else {
				alert("ȸ�������� �Ϸ� �Ǿ����ϴ�.");
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
          <h1 class="text-center" style="font-size: 30px; font-weight: bold;">ȸ������ <small></small></h1> 
        </div>
        <div class="col-md-6 col-md-offset-3" style="margin-top: 30px;">
          
         
          <form method="post" action="memberJoin.do" id="newform">
          
            
            <!-- �̸��� �Է� -->
            <div class="email form-group">
              <label for="username">�̸���</label>
              <div class="input-group">
             
                <input type="text" class="form-control" name="email" id="email" placeholder="ex)hong@gildong.com">
                <span class="input-group-btn">
                  <a href="#" class="btn btn-info" id="emailcheckBtn">�ߺ�Ȯ��</a>
                </span>
              </div>
            </div>
            <!--  �̸� �г��� �Է� �κ� -->
           <div class="name form-group">
              <label for="username">�̸�(�г���)</label>
              <div class="input-group"> 
              
                <input type="text" class="form-control" name="nicName" id="nicName" placeholder="�̸�(�г���)" >
              
                <span class="input-group-btn">
         
                  <a href="#" class="btn btn-info" onClick="emailCheckfunction();" id="checkBtn">�ߺ�Ȯ��</a>
                </span>
             </div>
            </div>
            <!-- ��й�ȣ �Է� -->
            <div class="form-group">
              <label for="password">��й�ȣ</label>
              
              <input type="password" name="pwd" class="form-control" id="pwd">
      
            </div>
            
            <!-- �޴��� ��ȣ �Է�  -->
            <div class="form-group">
              <label for="phone">�޴��� ��ȣ</label>
              <div class="input-group">
            
                <input type="tel" class="form-control" name="phone" id="phone" placeholder="- �����ϰ� �Է��� �ּ���">
         	
              </div>
            </div>

            <!-- ȸ������, ��� ��ư -->
            <div class="form-group text-center">
           
              <input type="button" class="btn btn-info" id="join" value="ȸ������"/>
            	
              <a href="main.do" type="submit" class="btn btn-default" >�������</a>
            
              </form>
        </div>
		
      </article>
      </div>
</body>
</html>
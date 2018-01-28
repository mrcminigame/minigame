<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- �г��� üũ -->
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
						alert('��밡���� �г��� �Դϴ�.');
						$("#checkBtn").text('��밡��');
					} else {
						$("#checkBtn").prop('class', 'btn btn-warning');
						alert('���Ұ����� �г��� �Դϴ�.');
						$("#checkBtn").text('���Ұ�');

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
			alert("��й�ȣ�� �Է��ϼ���");
			$('#changepwd').focus();
			return;
		}else if(changepwd!=checkpwd){
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�!")
			$('#changepwd').focus();
			return;
		}
		else{
			alert("������ �Ϸ�Ǿ����ϴ�.")
			$('#form').submit();
		}  
		
		
	});
});
</script>

</head>
<body>
	<article class="container">
	<div class="page-header">
		<h1 class="text-center">����������</h1>
	</div>
	<div class="col-md-6 col-md-offset-3">


		<form method="post" action="memberUpdate.do" id="form">
			<!-- �̸��� �Է� -->
			<div class="email form-group">
				<label for="username">�̸���</label>
				<div class="input-group">

					<p>
						<input type="text" class="form-control" name="email"
							id="useremail" value="${sessionScope.email }" readonly />
					</p>
				</div>
			</div>

			<!--  �̸� �г��� �Է� �κ� -->
			<div class="name form-group">
				<label for="username">�̸�(�г���)</label>
				<div class="input-group">

					<input type="text" class="form-control" name="id" id="id"
						value="${sessionScope.nic_Name }"> <span
						class="input-group-btn"> <a href="#" class="btn btn-info"
						onClick="emailCheckfunction();" id="checkBtn">�ߺ�Ȯ��</a>
					</span>
				</div>
			</div>


			<!-- ��й�ȣ �Է� -->
			<div class="form-group">
				<label for="password">��й�ȣ</label> <input type="password" name="pwd"
					class="form-control" id="changepwd"> <input type="hidden"
					id="checkpwd" value="${sessionScope.pwd }">

			</div>


			<!-- �޴��� ��ȣ �Է�  -->
			<div class="form-group">
				<label for="telnumber">�޴��� ��ȣ</label>
				<div class="input-group">

					<input type="tel" class="form-control" name="phone" id="phone"
						value="${sessionScope.phone }">

				</div>
			</div>
			<!-- ȸ������, ��� ��ư -->
			<div class="form-group text-center">

				<input type="button" class="btn btn-info" id="update" value="����Ȯ��" />

				<a href="main.do" type="submit" class="btn btn-default">�������</a>
		</form>
	</div>

	</article>
	</div>
</body>
</html>
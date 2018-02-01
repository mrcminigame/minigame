<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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

	$(function() {
		$('.ya').click(function() {
			$(".ya").prop('class', 'btn btn-success');
		});
		$('#update').click(function() {

			var changepwd = $('#changepwd').val();
			var checkpwd = $('#checkpwd').val();
			var changepwd2 = $('#changepwd2').val();
			var changepwd3 = $('#changepwd3').val();
			if (changepwd.trim() == "") {
				alert("��й�ȣ�� �Է��ϼ���");
				$('#changepwd').focus();
				return;
			} else if (changepwd != checkpwd) {
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�!")
				$('#changepwd').focus();
				return;
			} else if (changepwd == checkpwd && changepwd2 == changepwd3) {
				alert("������ �Ϸ�Ǿ����ϴ�.")
				$('#form').submit();
			} else if (changepwd == checkpwd && changepwd2 != changepwd3) {
				alert("������ ��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
				$('#changepwd2').focus();
				return;
			} else if (changepwd == checkpwd && changepwd2 == null) {
				alert("������ �Ϸ�Ǿ����ϴ�.")
				$('#form').submit();
			}

		});
		$('#delete').click(function() {
			var useremail = $('#useremail').val();
			var changepwd = $('#changepwd').val();
			var checkpwd = $('#checkpwd').val();
			var result;
			if (changepwd.trim() == "") {
				alert("��й�ȣ�� �Է��ϼ���");
				$('#changepwd').focus();
				return;
			} else if (changepwd != checkpwd) {
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�!")
				$('#changepwd').focus();
				return;
			} else {
				result=confirm("Ż���Ͻðڽ��ϱ�?");
				if(result){
					$.ajax({
						url : "deleteMember.do",
						type : 'POST',
						data : {
							"useremail" : useremail
						},
						async : false,
						success : function(data) {
								alert("Ż���Ͽ����ϴ�.");
								window.location.href="logout.do";
								//"logout.do"
								//window.history.back();
						},error : function(error) {
							alert(error)
							alert("!!AJAX FAIL");
						}

					});
				} else {
					
				}
			}
			
		});
	});
</script>

</head>
<body>
	<div class="container">
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

						<input type="text" class="form-control" name="nic_Name"
							id="nic_Name" value="${sessionScope.nic_Name }"> <span
							class="input-group-btn"> <a href="#" class="btn btn-info"
							id="checkBtn">�ߺ�Ȯ��</a>
						</span>
					</div>
				</div>


				<!-- ��й�ȣ �Է� -->
				<div class="form-group">
					<label for="password">��й�ȣ</label> <input type="password"
						name="changepwd" class="form-control" id="changepwd"> <input
						type="hidden" id="checkpwd" value="${sessionScope.pwd }">
					<label for="changepwd2">������ ��й�ȣ</label> <input type="password"
						name="changepwd2" class="form-control" id="changepwd2"> <label
						for="changepwd3">������ ��й�ȣ Ȯ��</label> <input type="password"
						name="changepwd3" class="form-control" id="changepwd3">
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
					<input type="button" class="w3-btn w3-red" id="delete" value="Ż��"/>
					<a href="main.do" type="submit" class="btn btn-default">�������</a>
				</div>
			</form>
		</div>

	</div>

</body>
</html>
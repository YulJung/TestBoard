<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
</head>
<body>
	<form method="post" align="center" action="doInsert" enctype="multpart/form-data">
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">ID</label> <input type="text"
				class="form-control" name="m_id" placeholder="아이디를 입력해주세요"
				style="width: 300px; height: 50px;">
		</div>
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">PASSWORD</label> <input
				type="password" class="form-control" name="password1"
				placeholder="비밀번호를 입력해주세요" style="width: 300px; height: 50px;">
		</div>
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">PASSWORD</label> <input
				type="password" class="form-control" name="m_password"
				placeholder="비밀번호를 다시 입력해주세요" style="width: 300px; height: 50px;"
				onkeyup="checkpw()"> 
		</div>
	
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">NAME</label> <input type="text"
				class="form-control" name="m_name" placeholder="이름을 입력해주세요"
				style="width: 300px; height: 50px;">
		</div>

		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">EMAIL</label> <input
				type="email" class="form-control" name="m_email"
				placeholder="이메일을 입력해주세요" style="width: 300px; height: 50px;">
		</div>
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">PHONE</label> <input
				type="text" class="form-control" name="m_phone"
				placeholder="전화번호를 입력해주세요" style="width: 300px; height: 50px;">
		</div>
			<div class="form-group" align="center">
			<label for="exampleFormControlInput1">PROFILE</label> <input
				type="file" class="form-control" name="m_profile"
				placeholder="사진을 첨부해주세요" style="width: 300px; height: 50px;">
		</div>
	
		<div>
			<button type="submit" class="btn btn-primary">회원가입</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-danger" onclick="window.close()">취소</button>
		</div>

	</form>

</body>
</html>
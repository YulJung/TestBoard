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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- jquery cdn주소 -->

</head>
<body>
	<form method="post" align="center" action="doInsert"
		enctype="multipart/form-data" onsubmit="return checkform()" name="frm">
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">ID</label> <input type="text"
				class="form-control" name="m_id" placeholder="아이디를 입력해주세요"
				onblur="idDuplicate()" id="m_id" style="width: 300px; height: 50px;"><br>
			<span id="id-dup-check"></span>
		</div>
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">PASSWORD</label> <input
				type="password" class="form-control" id="pw" name="pw"
				placeholder="비밀번호를 입력해주세요" style="width: 300px; height: 50px;">
		</div>
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">PASSWORD</label> <input
				type="password" class="form-control" id="m_password"
				name="m_password" placeholder="비밀번호를 다시 입력해주세요"
				style="width: 300px; height: 50px;" onkeyup="coincidePW()">
		</div>
		<span id="pwCheck"></span>
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
				type="file" class="form-control" name="m_file"
				style="width: 300px; height: 50px;">
		</div>

		<div>
			<button type="submit" class="btn btn-primary">회원가입</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-danger"
				onclick="location.href='../'">취소</button>
		</div>
		
	</form>
<script>
	/* 아이디 입력을 하는 동안에 idDuplicate() 함수를 호출하고 입력된 갑슬 콘솔에 출력*/
		
	function idDuplicate() {
		const id = document.getElementById('m_id').value;
		console.log(id);
		const checkResult = document.getElementById('id-dup-check');
		$.ajax({
			type : 'post', // 전송방식(get, post, delete, put 등)
			url : 'idDuplicate', //요청주소 (컨트롤러로 요청하는 주소 )
			data : {
				'm_id' : id
			}, // 전송할 데이터, 자바스크립트 객체표현법
			dataType : 'text', //요청 후 리턴받을 때의 데이터 형식
			success : function(result) { // 요청이 성공적으로 처리됐을 때 실행할 함수
				console.log('ajax 성공');
				console.log(result);
				if (result == 'ok') {
					checkResult.innerHTML = '사용할수 있는 아이디입니다.';
					checkResult.style.color = 'green';
				} else {

					checkResult.innerHTML = '사용할수 없는 아이디입니다.';
					checkResult.style.color = 'red';
				}

			},
			error : function() { // 요청이 실패했을 때 실행할 함수 
				console.log('오타 찾으세요');

			}
		})
	}

	
	
	

	function coincidePW() {
		if (pw.value == m_password.value) {
			pwCheck.innerHTML = '일치하는 비밀번호입니다.';
			pwCheck.style.color = "green";
			pwCheck.value='ok';
		} else {
			pwCheck.innerHTML = ' 비밀번호를 확인해주세요.';
			pwCheck.style.color = "red";
			pwCheck.value='nok';
		}
	}
	console.log(frm.m_id.value);
	function checkform(){
		if( frm.m_id.value == "" ) { 
			
			alert("아이디를 입력해 주십시오.");
			return false;
		}else if( frm.pw.value == "" ) { 
			
			alert("비밀번호를 입력해 주십시오.");
			return false;
		} else if( frm.m_password.value == "" ) { 
			
			alert("비밀번호 확인을 입력해 주십시오.");
			return false;
		}else if(pwCheck.value=='nok'){
			console.log(pwCheck.value);
			alert('비밀번호를 확인해주세요.');
			return false;
		}

		
	}

</script>
</body>
</html>
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
	<form method="post" align="center" action="save" enctype="multpart/form-data">
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">ID</label> <input type="text"
				class="form-control" name="b_writer" value="${m }"
				style="width: 300px; height: 50px;" readonly="readonly">
		</div>
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">TITLE</label> <input
				type="text" class="form-control" name="b_title"
				placeholder="제목을 입력해주세요" style="width: 300px; height: 50px;">
		</div>
		
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">글내용</label> 
			<textarea rows="30" cols="10" class="form-control" name="b_contents"></textarea>
		</div>
		<div class="form-group" align="center">
			<label for="exampleFormControlInput1">첨부파일</label> <input
				type="file" class="form-control" name="b_file"
				placeholder="첨부파일을 선택해주세요" style="width: 300px; height: 50px;">
		</div>
			
		<div>
			<button type="submit" class="btn btn-primary">글 작성</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-danger" onclick="location.href='./'">취소</button>
		</div>

	</form>
</body>
</html>
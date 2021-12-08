<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="userCheck()">
 
	<input type="hidden" value ="${sessionScope.loginId }" id = "loginId">
	<div id="defult">
	<a href="testBoard/memberInsert" >회원가입</a> <br>
	<a href ="testBoard/login" >로그인</a><br>
	</div>
	<div id="admin">
	  <a href = "testBoard/admin">관리자 페이지로 이동</a>
	<a href="testBoard/findall">게시글 목록으로 이동</a>
	</div>

	<script type="text/javascript">
	 function userCheck() {
		const id = document.getElementById('loginId').value;
		console.log(id);
		if(id=='admin'){
			 console.log('check');
			  document.getElementById("admin").style.display = "block";
			  document.getElementById("defult").style.display = "none";
		}else if(id==''){
			 console.log(id);
			  document.getElementById("defult").style.display = "block";
			  document.getElementById("admin").style.display = "none";

		}else{
			location.href='testBoard/findall';
	
		}
	}
	
	</script>
</body>
</html>
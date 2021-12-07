<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 세션 데이터 출력
 ${sessionScope.loginId }
 <button onclick="logout()">로그아웃</button>
 <script type="text/javascript">
 	function logout() {
		location.href="logout";
	}
 </script>
 <br> 
 <a href="findAll"> 회원목록</a> 
</body>
</html>
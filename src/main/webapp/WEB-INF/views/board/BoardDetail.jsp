<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상세조회 결과</h2>
 작성자 :${board.b_writer } <br>
 제목 :${board.b_title }<br>
 조회수 :${board.b_hits }<br>
 작성 시간 :${board.b_date }<br>
 내용 :${board.b_contents }<br>
 <button onclick="location.href='/board/update?b_number=${board.b_number}'">수정</button> &nbsp; &nbsp;
 <button onclick="location.href='/board/delete?b_number=${board.b_number}'">삭제</button>
</body>
</html>
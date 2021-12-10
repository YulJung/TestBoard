<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find All</title>
<!-- 부트스트랩 --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <!-- 부트스트랩 테이블 --> 
 <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css">

</head>
<body>
<header>
	
	<div>
		${sessionScope.loginId} 님 환영합니다. 
		</div>	
		<div align="right">
		<a href="mypage">마이 페이지</a>
		<a href="logout" >로그아웃</a>
		
		</div>


</header>
<table  class="table table-hover">
<tr> 
	<th>글번호</th>
	<th>작성자</th>
	<th>제목</th>
	<th>조회수</th>
	<th>작성시간</th>>
 </tr>
	<c:forEach items="${bList }" var="b">
			<tr>
				<td>${b.b_number }</td>
				<td>${b.b_writer }</td>
				<td><a href="boardDetail?b_number=${b.b_number }">${b.b_title }</a></td>
				<td>${b.b_hits }</td>
				<td>${b.b_date }</td>				
			</tr>
		






	</c:forEach>
	</table>
	<div align="right">
	<button class="btn btn-outline-primary" onclick="location.href='save?m_id=${sessionScope.loginId}'"> 글쓰기</button>
	<div id="search">
	
	<form action="search" method="get">
	<select name="searchtype">
		<option value="b_title">제목</option>
		<option value="b_writer">작성자</option>
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">
</form>
	</div>
	</div>
<div align="center">
		<c:choose>
			<c:when test="${paging.page<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
			
				<a href="paging?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="paging?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="paging?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
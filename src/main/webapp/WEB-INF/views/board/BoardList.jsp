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
				<td><a href="/board/detail?b_number=${b.b_number }">${b.b_title }</a></td>
				<td>${b.b_hits }</td>
				<td>${b.b_date }</td>				
			</tr>
		






	</c:forEach>
	</table>
<div>
		<c:choose>
			<c:when test="${paging.page<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
			<!-- 현재 페이지에서 1감소한 페이지 요청하는 링크 -->
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
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
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script >
	function detailAjax(m_number) {
		console.log(m_number);
		const view = document.getElementById('detail-view');
		$.ajax({
			type:'post',
			url: "detailAjax",
			data:{'m_number':m_number},
			dataType:'json',
			success: function result() {
				console.log(result);
				console.olg(result.m_number);
				console.log(result.m_id);
				let output = "<table class='table'>";
				output += "<tr><th>number</th> <th>id</th> <th>password</th> <th>name</th>";
				output += "<th>email</th> <th>phone</th> </tr>";
				output += "<tr>";
				output += "<td>"+result.m_number+"</td>";
				output += "<td>"+result.m_id+"</td>";
				output += "<td>"+result.m_password+"</td>";
				output += "<td>"+result.m_name+"</td>";
				output += "<td>"+result.m_email+"</td>";
				output += "<td>"+result.m_phone+"</td>";
				output += "</tr>";
				output += "</table>";
				
				view.innerHTML = output;
			}
		})
	}
</script>
</head>
<body>
<table  class="table table-hover">
<tr> 
	<th>아이디</th>
	<th>비밀번호</th>
	<th>회원번호</th>
	<th>이름</th>
	<th>이메일</th>
	<th>전화번호</th>
	
	<th>삭제</th>
	
 </tr>
	<c:forEach items="${member }" var="m">


		

			<tr>
				
				<td>${m.m_id }</td>
				<td>${m.m_password }</td>
				<td>${m.m_number }</td>
				<td>${m.m_name }</td>
				<td>${m.m_email }</td>
				<td>${m.m_phone }</td>
				
		
		
				<td><a href="delete?m_id=${m.m_id }">삭제</a></td>
		
			</tr>
		






	</c:forEach>
	</table>

</body>
</html>
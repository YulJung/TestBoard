<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

</script>
</head>
<body onload="idCheck()" align="center">

<h2>상세조회 결과</h2>
<div>
 작성자 :${board.b_writer } <br>
 제목 :${board.b_title }<br>
 조회수 :${board.b_hits }<br>
 작성 시간 :${board.b_date }<br>
 내용 :${board.b_contents }<br>
 사진 : <img src="../resources/upload/${board.b_file}">
 ${board.b_file}
 </div>


<!-- 댓글목록 출력 -->
<div id="comment-list">
	<table class="table">
		<tr>
			<th>댓글번호</th>
			<th>작성자</th>
			<th>내용</th>
			<th>작성시간</th>
		</tr>
			<c:forEach items="${commentList}" var="comment">
				<tr>
					<td>${comment.c_number}</td>
					<td>${comment.c_writer}</td>
					<td>${comment.c_contents}</td>
					<td>${comment.c_date}</td>
				</tr>
			</c:forEach>
	</table>
</div>
<div id="comment-writer" >
	<label for="">댓글 작성</label><br>
	작성자: <input type="text" id="c_writer" value="${sessionScope.loginId}" readonly="readonly">
	<input type="text" id="c_contents" placeholder="댓글 내용">
	<button id="comment-write-btn">댓글 등록</button>
</div>
 <input type="hidden" value="${sessionScope.loginId }" id="loginId"/>
 <input type="hidden" value="${board.b_writer }" id="writerId"/>
<div id="button_div" style="display:inline;" align="right">
 <button id="useButton" onclick="location.href='updateBoard?b_number=${board.b_number}'">수정</button> 
 </div>
 <div id="button_div1" style="display:inline;" align="right">
 <button id="useButton" onclick="location.href='deleteBoard?b_number=${board.b_number}'">삭제</button>
  </div>
  
  <script >
 
 	
 	function idCheck() {
 		const myId = document.getElementById('loginId').value;
 	 	const b_Id =  document.getElementById('writerId').value;

 	 	 if(myId=='admin'){
			 document.getElementById("button_div").style.display = "none";
			  document.getElementById("button_div1").style.display = "block";
		
		}else if(myId!=b_Id){ // == 조건문이 왜안되는지 
			 console.log('check');
			  document.getElementById("button_div").style.display = "none";
			  document.getElementById("button_div1").style.display = "none";
				
		}else{
			console.log('none');
			  document.getElementById("button_div").style.display = "block";
			  document.getElementById("button_div1").style.display = "block";
			
		}
	}
	

	$("#comment-write-btn").click(function(){
	console.log('함수 호출(jQuary)');
	const commentWriter = $("#c_writer").val();
  const commentContents = $("#c_contents").val();
  const boardNumber = '${board.b_number}';
  console.log(commentWriter, commentContents, boardNumber);
	// const comment = document.getElementById('comment-list')
	const comment = $("#comment-List");
    
  // jQuery ajax 시작 문법
  $.ajax({
    type: 'post', // 전송방식(get, post, delete, put 등)
    url: 'commentSave', // 요청 주소 (컨트롤러로 요청하는 주소)
    data: {'c_writer': commentWriter, 'c_contents':commentContents, 'b_number': boardNumber}, // 전송할 데이터 {'key': value, 'key': value}
    dataType: 'json', // 요청 후 리턴받을 때의 데이터 형식
    success: function(result) { // 요청 후 성공적으로 처리됐을 때 실행할 함수
			let output = "<table class='table'>";
			output += "<tr><th>댓글번호</th>";
			output += "<th>작성자</th>";
			output += "<th>내용</th>";
			output += "<th>작성시간</th></tr>";
			for(let i in result) {
				output += "<tr>";
				output += "<td>"+result[i].c_number+"</td>";
				output += "<td>"+result[i].c_writer+"</td>";
				output += "<td>"+result[i].c_contents+"</td>";
				output += "<td>"+result[i].c_date+"</td>";
				output += "</tr>";
			}
			// 댓글의 갯수가 여러개인 경우를 대비해 for문 사용
			output += "</table>";
			// id가 comment-list인 div에 출력
			document.getElementById('comment-list').innerHTML = output;
			// 댓글작성 완료시 입력창을 비움.
			
			document.getElementById('c_contents').value='';
     },
     error: function(result) { // 요청이 실패했을 때 실행할 함수
	     console.log('오타 발생')
     }
	})
})

 $(document).ready(function comment(){
	console.log('함수 호출(jQuary)2');
	const commentWriter = $("#c_writer").val();
  const commentContents = $("#c_contents").val();
  const boardNumber = '${board.b_number}';
  console.log(commentWriter, commentContents, boardNumber);
	// const comment = document.getElementById('comment-list')
	const comment = $("#comment-List");
    
  // jQuery ajax 시작 문법
  $.ajax({
    type: 'post', // 전송방식(get, post, delete, put 등)
    url: 'commentload', // 요청 주소 (컨트롤러로 요청하는 주소)
    data: {'b_number': boardNumber}, // 전송할 데이터 {'key': value, 'key': value}
    dataType: 'json', // 요청 후 리턴받을 때의 데이터 형식
    success: function(result) { // 요청 후 성공적으로 처리됐을 때 실행할 함수
			let output = "<table class='table'>";
			output += "<tr><th>댓글번호</th>";
			output += "<th>작성자</th>";
			output += "<th>내용</th>";
			output += "<th>작성시간</th></tr>";
			for(let i in result) {
				output += "<tr>";
				output += "<td>"+result[i].c_number+"</td>";
				output += "<td>"+result[i].c_writer+"</td>";
				output += "<td>"+result[i].c_contents+"</td>";
				output += "<td>"+result[i].c_date+"</td>";
				output += "</tr>";
			}
			// 댓글의 갯수가 여러개인 경우를 대비해 for문 사용
			output += "</table>";
			// id가 comment-list인 div에 출력
			document.getElementById('comment-list').innerHTML = output;
		
     },
     error: function(result) { // 요청이 실패했을 때 실행할 함수
	     console.log('오타 발생')
     }
	})
})
 </script>

</body>
</html>
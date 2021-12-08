<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body onload="idCheck()" align="center">
<h2>상세조회 결과</h2>
 작성자 :${board.b_writer } <br>
 제목 :${board.b_title }<br>
 조회수 :${board.b_hits }<br>
 작성 시간 :${board.b_date }<br>
 내용 :${board.b_contents }<br>
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
 	 	console.log(myId);
 	 	console.log(b_Id);
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
 	
 </script>

</body>
</html>
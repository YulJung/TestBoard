<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
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

</head>
<body>
<h2 align="center">회원정보 수정</h2>
 <div style="margin-left: 50px; margin-right: 50px;">
 <form name="member" action="doUpdateMember" method="post" enctype="multipart/form-data" onsubmit="return checkPW()" >
    
      아이디  <input type="text" class="form-control" id="m_id" name="m_id"  value="${member.m_id}" readonly><br>
      비밀번호 <input type="password" class="form-control" id="pw" onfocus="this.value=''" value="${member.m_password }"><br>
      
      비밀번호 확인  <input type="password" id="m_password"  name="m_password"  class="form-control" onkeyup="coincidePW()" onfocus="this.value=''" value="${member.m_password }"><br>
        <span id="pwCheck"></span><br>
      이름 <input type="text" id="m_name"  name="m_name" value="${member.m_name}" class="form-control"><br>
      이메일  <input type="text" id="m_email"  name="m_email" value="${member.m_email}" class="form-control"><br>
      전화번호  <input type="text" id="m_phone" name="m_phone" value="${member.m_phone}" class="form-control"><br>
      프로필 사진   <input type="file" name="m_file"  class="form-control"><br>
      <img src="/resources/upload/${member.m_profile}">
        <div align="right">
        <input type="submit" value="제출" class="btn btn-primary" >
        <button class="btn btn-danger"  onclick="location.href='../'" >취소</button>
        </div>
        <script>
        const pw = document.getElementById('pw');
        const m_password = document.getElementById('m_password');
        const pwCheck = document.getElementById('pwCheck');
        const password = '${member.m_password}';
        console.log(password);
        console.log(m_password.value);
            function checkPW(){
               
            if(pw.value==''){
            	 alert('비밀번호를 입력해주세요');
                
                 member.pw.focus();
                 return false;
            }
            if(m_password.value==''){
           	 alert('비밀번호 확인을 입력해주세요');      
                member.m_password.focus();
                return false;
           }
            if(pw.value==m_password.value){
                
                return true;
            }else{
                alert('비밀번호를 확인해주세요!!');
                member.m_password.focus();
                return false;
            }
           }
            
            function coincidePW() {
				if(pw.value==m_password.value){
					 pwCheck.innerHTML='일치하는 비밀번호입니다.';
					 pwCheck.style.color="green";
				}else {
					 pwCheck.innerHTML=' 비밀번호를 확인해주세요.';
					 pwCheck.style.color="red";
				}
			}
       
        </script>
    </form>
 
 </div>
 
 
</body>
</html>
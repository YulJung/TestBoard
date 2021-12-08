<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>

</head>
<body>
<h2>상세조회 결과</h2>
 
 <form name="member" action="doUpdateMember" method="post" enctype="multipart/form-data" onsubmit="return checkPW()">
    
        <input type="text" id="m_id" value="${member.m_id}" readonly>
        <input type="password" id="pw" >
        <input type="password" id="m_password" ><br>
        <span id="pwCheck"></span>
        <input type="text" id="m_name" value="${member.m_name}" >
        <input type="text" id="m_email" value="${member.m_email}" >
        <input type="text" id="m_phone" value="${member.m_phone}" >
        <input type="file" id="m_profile" value="${member.m_profile}">
        
        <input type="submit" value="제출" >
        <button class="btn btn-danger"  onclick="location.href='../'" >취소</button>
        <script>
            function checkPW(){
                const pw = document.getElementById('pw').value;
                const m_password = document.getElementById('m_password').value;
                const pwCheck = document.getElementById('pwCheck');
            
            if(pw==m_password){
                pwCheck.value='일치하는 비밀번호입니다.';
                return true;
            }else{
                alert('비밀번호를 확인해주세요!!');
                pwCheck.value='비밀번호가 일치하지 않습니다.';
                member.m_password.focus();
                return false;
            }
           }
        </script>
    </form>
 
 
 
 
</body>
</html>
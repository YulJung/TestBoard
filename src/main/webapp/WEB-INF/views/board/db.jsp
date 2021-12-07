<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
create table Board(
	b_number bigint auto_increment,
    b_writer varchar(20),
    b_password varchar(20),
    b_title varchar(20),
    b_contents varchar(1000),
    b_date datetime,
    b_hits int default 0,
    constraint primary key (b_number)


);
</body>
</html>
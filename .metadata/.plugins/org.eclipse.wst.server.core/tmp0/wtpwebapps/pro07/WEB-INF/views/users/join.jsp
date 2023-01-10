<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<title>회원 가입</title>
</head>
<body>
<h2>회원 가입</h2>
<form action="/user/join" method="post">
	<sec:csrfInput/>
	<input type="text" name="id" placeholder="아이디" />
	<input type="password" name="password" placeholder="비밀번호" />
	<input type="password" name="confirmPassword" placeholder="비밀번호 확인" />
	<input type="email" name="email" placeholder="이메일" />
	<input type="text" name="phone" placeholder="전화번호(-없이)" />
	<button>회원가입</button>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>2021. 4. 20.오후 3:26:19</title>
</head>
<body>
	<form method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<button>회원탈퇴</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>2021. 4. 20.오후 3:26:19</title>
</head>
<body>
	<%-- <h1>Logout Page</h1>
	<p>principal : <security:authentication property="principal"/> </p>
	<p>memberVO : <security:authentication property="principal.vo"/></p>
	<p>사용자 이름 : <security:authentication property="principal.vo.userName"/></p>
	<p>사용자 아이디 : <security:authentication property="principal.username"/></p>
	<p>사용자 아이디 : <security:authentication property="principal.vo.userid"/></p>
	<p>사용자 권한 리스트 : <security:authentication property="principal.vo.authList"/></p> --%>
	<form method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<button>로그아웃</button>
	</form>
</body>
</html>
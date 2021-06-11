<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>2021. 4. 20.오전 10:45:40</title>
</head>
<body>
	<h1>sample/admin</h1>
	<p>principal : <security:authentication property="principal"/> </p>
	<p>memberVO : <security:authentication property="principal.vo"/></p>
	<p>사용자 이름 : <security:authentication property="principal.vo.userName"/></p>
	<%-- <p>사용자 활성화 : <security:authentication property="principal.enabled"/></p>
	<p>사용자 비번 : <security:authentication property="principal.password"/></p> --%>
	<p>사용자 아이디 : <security:authentication property="principal.username"/></p>
	<p>사용자 아이디 : <security:authentication property="principal.vo.userid"/></p>
	<p>사용자 권한 리스트 : <security:authentication property="principal.vo.authList"/></p>
	<a href="/customLogout">로그아웃하기</a>
</body>
</html>
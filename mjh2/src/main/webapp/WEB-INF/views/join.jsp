<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="includes/header.jsp"/>	
			<!-- Start search-course Area -->			
			<section class="search-course-area relative">
				<div class="overlay overlay-bg"></div>
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="col-lg-12 col-md-12 py-2 my-5">
					    <br>
						</div>
						<div class="col-lg-12 col-md-12 py-2 my-5">
							<h1 class="text-white text-center">회원가입</h1>
						</div>
						<div class="col-lg-8 col-md-8 py-5 mb-5 search-course-right section-gap">
							<form method="post" class="form-wrap">
								<input type="text" class="form-control my-3" name="userid" placeholder="아이디"  required="" >
								<input type="password" class="form-control my-3" name="userpw" placeholder="비밀번호"  required="" >
								<input type="password" class="form-control my-3" name="userpwchk" placeholder="비밀번호 확인"  required="" >
								<input type="text" class="form-control my-3" name="userName" placeholder="이름" required="">
								<input type="text" class="form-control my-3" name="tel" placeholder="전화번호"  required="" >
								<input type="text" class="form-control my-3" name="birthDate" placeholder="생년월일"  required="" >
								<input type="email" class="form-control my-3" name="email" placeholder="이메일 주소"  required="" >
								<button class="btn btn-info btn-block my-3">join</button>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							</form>
						</div>
					</div>
				</div>	
			</section>
			<!-- End search-course Area -->										
<jsp:include page="includes/footer.jsp"/>
			
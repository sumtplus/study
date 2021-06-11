<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
							<h1 class="text-white text-center">비밀번호 확인</h1>
						</div>
						<div class="col-lg-6 col-md-6 py-5 mb-5 search-course-right section-gap">
							<form method="post" class="form-wrap">
								<h4 class="text-secondary pb-20 text-center mb-30">회원정보를 수정하기 위해서는 비밀번호 확인이 필요합니다</h4>
								<input type="password" class="form-control my-3" name="userpw" placeholder="Your PassWord" required>
								<button class="primary-btn text-uppercase">submit</button>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							</form>
						</div>
					</div>
				</div>	
			</section>
			<!-- End search-course Area -->										

									    			
<jsp:include page="includes/footer.jsp"/>
			
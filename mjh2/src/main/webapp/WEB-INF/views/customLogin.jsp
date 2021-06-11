<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="includes/header.jsp"/>	
				
			<!-- Start search-course Area -->			
			<section class="search-course-area relative">
				<div class="overlay overlay-bg"></div>
				<div class="container">
					<div class="row justify-content-between align-items-center">
						<div class="col-lg-12 col-md-12">
						    <br>
						    <br>
						    <br>
						</div>
						<div class="col-lg-6 col-md-6 search-course-left">
							<h1 class="text-white">
								민스쿨
							</h1>
							<p class="text-white">
								공무원의 신분과 정치적 중립성은 법률이 정하는 바에 의하여 보장된다. 일반사면을 명하려면 국회의 동의를 얻어야 한다. 재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다. 민주평화통일자문회의의 조직·직무범위 기타 필요한 사항은 법률로
							</p>
							<div class="row details-content">
								<div class="col single-detials">
									<span class="lnr lnr-graduation-hat"></span>
									<a href="#" class="text-white"><h4>지능형 개별 맞춤학습</h4></a>		
									<p>
										개개인의 학습진도, 성취도, 학습능력, 진로에 따라 최적화된 학습과정을 1:1 컨설팅으로 가장 적합한 학습과정을 설계합니다
									</p>						
								</div>
								<div class="col single-detials">
									<span class="lnr lnr-license"></span>
									<a href="#" class="text-white"><h4>학생중심 참여수업</h4></a>		
									<p>
										수업내용을 스스로 예습하고, 본수업에서는 질문식 수업과 토론발표, 거꾸로 설명하기 등을 통해 학생이 주도적으로 수업에 참여합니다
									</p>						
								</div>								
							</div>
						</div>
						<div class="col-lg-4 col-md-6 search-course-right section-gap">
							<form method="post" class="form-wrap" action="${pageContext.request.contextPath}/login">
								<h4 class="text-white pb-20 text-center mb-30">로그인</h4>		
								<input type="text" class="form-control" name="username" placeholder="Your ID" >
								<input type="password" class="form-control" name="password" placeholder="Your PassWord" >
								<div class="switch-wrap d-flex justify-content-between">
									<p>Remember Me</p>
									<div class="confirm-switch">
										<input type="checkbox" name="remember-me" id="default-switch">
										<label for="default-switch"></label>
									</div>
								</div>
								<button class="primary-btn text-uppercase">login</button>
								<a href="${pageContext.request.contextPath}/join" class="primary-btn wh text-center mt-2">join</a>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							</form>
						</div>
					</div>
				</div>	
			</section>
			<!-- End search-course Area -->										

									    			
<jsp:include page="includes/footer.jsp"/>
			
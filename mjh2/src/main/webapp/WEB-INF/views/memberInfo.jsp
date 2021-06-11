<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<jsp:include page="includes/header.jsp"/>
	<!-- start banner Area -->
	<section class="banner-area relative about-banner" id="home">	
		<div class="overlay overlay-bg"></div>
		<div class="container">				
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">
						회원정보				
					</h1>	
				</div>	
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<sec:authentication property="principal" var="pinfo"/>
	<!-- Start contact-page Area -->	
	<section class="contact-page-area section-gap my-0 py-0">
	    <div class="container sidebar-widgets mb-0">
			<form method="post" class="row widget-wrap">
				<div class="col-lg-5 single-sidebar-widget user-info-widget">
					<img src="${pageContext.request.contextPath}/resources/img/blog/user-info.png" alt="">
					<br>
					<input type="text" name="userid" value="${pinfo.username}" class="form-control-plaintext text-center text-uppercase" readonly>
					<p>
						Senior blog writer
					</p>
					<p>
						Boot camps have its supporters andit sdetractors. Some people do not understand why you should have to spend money on boot camp when you can get. Boot camps have itssuppor ters andits detractors.
					</p>
				</div>
				<div class="col-lg-6 address-wrap">
					<%-- <div class="single-contact-address d-flex flex-row">
						<div class="icon mt-4 pt-2">
							<span class="lnr lnr-home"></span>
						</div>
						<div class="contact-details">
							<label for="userid" class="font-weight-bold text-warning float-left pl-2">userid</label>
							<input type="text" name="userid" value="${pinfo.username}" class="common-input mb-20 form-control" required="" >
						</div>
					</div> --%>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon mt-4 pt-2">
							<span class="lnr lnr-home"></span>
						</div>
						<div class="contact-details">
							<label for="userName" class="font-weight-bold text-warning float-left pl-2">name</label>
							<input type="text" id="userName" name="userName" value="${pinfo.vo.userName}" class="common-input mb-20 form-control" required="" >
						</div>
					</div>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon mt-4 pt-2">
							<span class="lnr lnr-phone-handset"></span>
						</div>
						<div class="contact-details">
							<label for="tel" class="font-weight-bold text-warning float-left pl-2">tel</label>
							<input type="text" id="tel" name="tel" value="${pinfo.vo.tel}" class="common-input mb-20 form-control" required="" >
						</div>
					</div>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon mt-4 pt-2">
							<span class="lnr lnr-envelope"></span>
						</div>
						<div class="contact-details">
							<label for="email" class="font-weight-bold text-warning float-left pl-2">email</label>
							<input type="email" id="email" name="email" value="${pinfo.vo.email}" class="common-input mb-20 form-control" required="" >
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<br>
					<div>
						<a href="${pageContext.request.contextPath}/index" class="genric-btn success radius float-right mx-1">cancel</a>
					    <button id="withdraw" class="genric-btn danger radius float-right mx-1" formaction="withdraw">withdraw</button>
					    <button id="modify" class="genric-btn primary radius float-right mx-1">modify</button>
				    </div>														
				</div>
			</form>																
		</div>
	</section>			
			<!-- End contact-page Area -->										

									    			
<jsp:include page="includes/footer.jsp"/>
			
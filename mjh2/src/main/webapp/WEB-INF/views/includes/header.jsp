<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>민스쿨</title>
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="colorlib">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/linearicons.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">							
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">			
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">			
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
			<!-- <script src="/resources/js/vendor/jquery.min.js"></script> -->
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
			<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js" integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ==" crossorigin="anonymous"></script>
		</head>
		<body>	
		  <header id="header" id="home">
	  		<div class="header-top">
	  			<div class="container">
			  		<div class="row">
			  			<div class="col-lg-6 col-sm-6 col-8 header-top-left no-padding">
			  				<ul>
								<li><i class="fa fa-facebook light px-1"></i></li>
								<li><i class="fa fa-twitter light px-1"></i></li>
								<li><i class="fa fa-dribbble light px-1"></i></li>
								<li><i class="fa fa-behance light px-1"></i></li>
			  				</ul>			
			  			</div>
			  			<sec:authentication property="principal" var="member"/>
			  			<div class="col-lg-6 col-sm-6 col-4 header-top-right no-padding">
			  				<sec:authorize access="isAnonymous()">
			  				<a href="${pageContext.request.contextPath}/customLogin" class="genric-btn success small ml-3">login</a>
			  				</sec:authorize>
			  				<sec:authorize access="isAuthenticated()">
			  				<span class="text-white">${member == 'anonymousUser' ? 'Not Login' : member.vo.userName}</span>
			  				<form class="float-right" method="post" action="${pageContext.request.contextPath}/customLogout">
				  				<button class="genric-btn success small ml-3">logout</button>
				  				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			  				</form>
			  				</sec:authorize>			
			  			</div>
			  		</div>			  					
	  			</div>
			</div>
		    <div class="container main-menu">
		    	<div class="row align-items-center justify-content-between d-flex">
			      <div id="logo">
			        <a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="" title="" /></a>
			      </div>
			      <nav id="nav-menu-container">
			        <ul class="nav-menu">
			          <li class="mx-3"><a href="${pageContext.request.contextPath}/index.html">메인</a></li>
			          <li class="mx-3"><a href="#">소개</a></li>
			          <li class="mx-2"><a href="${pageContext.request.contextPath}/board/courseList">강의정보</a></li>
			          <!-- <li><a href="events.html">Events</a></li> -->
			          <li class="mx-2"><a href="${pageContext.request.contextPath}/board/list">자유게시판</a></li>
			          <!-- <li class="menu-has-children"><a href="">Blog</a>
			            <ul>
			              <li><a href="blog-home.html">Blog Home</a></li>
			              <li><a href="blog-single.html">Blog Single</a></li>
			            </ul>
			          </li> -->	
			          <!-- <li class="menu-has-children"><a href="">Pages</a>
			            <ul>
		              		<li><a href="course-details.html">Course Details</a></li>		
		              		<li><a href="event-details.html">Event Details</a></li>		
			                <li><a href="elements.html">Elements</a></li>
					          <li class="menu-has-children"><a href="">Level 2 </a>
					            <ul>
					              <li><a href="#">Item One</a></li>
					              <li><a href="#">Item Two</a></li>
					            </ul>
					          </li>					                		
			            </ul>
			          </li> -->					          					          		          
			          <li class="menu-has-children mx-3">
						<a href="#" class="sf-with-ul">회원</a>
			            <ul style="">
			            	<sec:authorize access="isAnonymous()">
			              	<li><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
			              	</sec:authorize>
			              	<sec:authorize access="isAuthenticated()">
			              	<li><a href="${pageContext.request.contextPath}/passwordChk">회원정보</a></li>	
			              	</sec:authorize>
			            </ul></li>
			        </ul>
			      </nav><!-- #nav-menu-container -->		    		
		    	</div>
		    </div>
		  </header><!-- #header -->
			  
			
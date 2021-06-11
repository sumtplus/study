<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp"/>

        <!-- start banner Area -->
			<section class="banner-area relative about-banner" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								강의 소개		
							</h1>	
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->	
			
			<!-- Start popular-courses Area --> 
			<section class="popular-courses-area section-gap courses-page">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-70 col-lg-8">
							<div class="title text-center">
								<h1 class="mb-10">수강생들이 인정한 교육 과정</h1>
								<p>인기 강좌</p>
							</div>
						</div>
					</div>						
					<div class="row">
						<c:forEach items="${list}" var="board">
						<div class="single-popular-carusel col-lg-3 col-md-6 pb-3">
							<div class="thumb-wrap relative" >
								<div class="thumb relative" style="height:193px">
									<div class="overlay overlay-bg"></div>	
									<img class="img-fluid" src="${pageContext.request.contextPath}/display?fileName=${board.attachList[0].uploadPath}/${board.attachList[0].uuid}_${board.attachList[0].fileName}" alt=""> 
								</div>
								<div class="meta d-flex justify-content-between">
									<p><span class="lnr lnr-users"></span> ${board.hitcount} <span class="lnr lnr-bubble"></span>35</p>
								</div>									
							</div>
							<div class="details">
								<a href="course-details.html">
									<h4>${board.title}</h4>
								</a>
								<p>${board.content}</p>
								<%-- <p>${board.attachList}</p>
								<p>${board.attachList[0].uploadPath}</p>
								<p>${board.attachList[0].uuid}</p>
								<p>${board.attachList[0].fileName}</p> --%>
							</div>
						</div>
						</c:forEach>	
						<nav class="col-lg-12 col-md-6 blog-pagination justify-content-center d-flex py-0">
							<ul class="pagination">
	                        <c:if test="${pageMaker.prev}">
                            <li class="page-item">
                                <a href="courseList${pageMaker.cri.listLink2}&pageNum=${pageMaker.startPage -1}" class="page-link" aria-label="Previous">
                                       <span class="lnr lnr-chevron-left"></span>
                                </a>
                            </li>
                            </c:if>
                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                            <li class="page-item ${num == pageMaker.cri.pageNum ? 'active' : ''}">
                            	<a href="courseList${pageMaker.cri.listLink2}&pageNum=${num}" class="page-link">${num}</a>
                            </li>
                            </c:forEach>
                            <c:if test="${pageMaker.next}">
                            <li class="page-item">
                                <a href="courseList${pageMaker.cri.listLink2}&pageNum=${pageMaker.endPage + 1}" class="page-link" aria-label="Next">
                                    <span class="lnr lnr-chevron-right"></span>
                                </a>
                            </li>
                           	</c:if>
                           	</ul>
	                    </nav>								
					</div>
				</div>	
			</section>
			<!-- End popular-courses Area -->			

<jsp:include page="../includes/footer.jsp" />


            
            
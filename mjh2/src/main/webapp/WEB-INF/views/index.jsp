<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<jsp:include page="includes/header.jsp"/>
	<!-- start banner Area -->
			<section class="banner-area relative" id="home">
				<div class="overlay overlay-bg"></div>	
				<div class="container">
					<div class="row d-flex align-items-center justify-content-between" style="height: 534px;">
						<div class="banner-content col-lg-9 col-md-12">
							<h1 class="text-uppercase">
								민스쿨		
							</h1>
							<p class="pt-10 pb-10 text-light">
								공무원의 신분과 정치적 중립성은 법률이 정하는 바에 의하여 보장된다. 일반사면을 명하려면 국회의 동의를 얻어야 한다. 재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다. 민주평화통일자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다.
							</p>
						</div>										
					</div>
				</div>					
			</section>
			<!-- End banner Area -->

			<!-- Start feature Area -->
			<section class="feature-area">
				<div class="container">
					<div class="row">
						<div class="col-lg-4">
							<div class="single-feature">
								<div class="title">
									<h4>지능형 개별 맞춤학습</h4>
								</div>
								<div class="desc-wrap">
									<p>
										개개인의 학습진도, 성취도, 학습능력, 진로에 따라 최적화된 학습과정을
										1:1 컨설팅으로 가장 적합한 학습과정을 설계합니다
									</p>
									<a href="#">더보기</a>									
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="single-feature">
								<div class="title">
									<h4>학생중심 참여수업</h4>
								</div>
								<div class="desc-wrap">
									<p>
										수업내용을 스스로 예습하고, 본수업에서는 질문식 수업과 토론발표,
										거꾸로 설명하기 등을 통해 학생이 주도적으로 수업에 참여합니다
									</p>
									<a href="#">더보기</a>									
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="single-feature">
								<div class="title">
									<h4>완전학습 시스템</h4>
								</div>
								<div class="desc-wrap">
									<p>
										당일 수업한 내용의 자기화와 평가까지 학원내에서 일체의 학습이 완결되는
										완전학습 시스템을 구현하여 학습효과가 월등히 향상됩니다
									</p>
									<a href="#">더보기</a>									
								</div>
							</div>
						</div>												
					</div>
				</div>	
			</section>
			<!-- End feature Area -->
					
			<!-- Start popular-course Area -->
			<section class="popular-course-area section-gap">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-70 col-lg-8">
							<div class="title text-center">
								<h1 class="mb-10">강의정보</h1>
								<p>국가안전보장에 관련되는 대외정책·군사정책과 국내정책의 수립에 관하여 국무회의의 심의에 앞서 대통령의 자문에 응하기 위하여 국가안전보장회의를 둔다.</p>
							</div>
						</div>
					</div>						
					<div class="row">
						<div class="active-popular-carusel">
							<c:forEach items="${list}" var="board">	
							<div class="single-popular-carusel">
								<div class="thumb-wrap relative">
									<div class="thumb relative" style="height:193px">
										<div class="overlay overlay-bg"></div>	
										<img class="img-fluid" src="${pageContext.request.contextPath}/display?fileName=${board.attachList[0].uploadPath}/${board.attachList[0].uuid}_${board.attachList[0].fileName}" alt="">
									</div>
									<div class="meta d-flex justify-content-between">
										<p><span class="lnr lnr-users"></span> ${board.hitcount} <span class="lnr lnr-bubble"></span>35</p>
									</div>									
								</div>
								<div class="details">
									<a href="#">
										<h4>
											${board.title}
										</h4>
									</a>
									<p>
										${board.content}										
									</p>
								</div>
							</div>
							</c:forEach>
													
						</div>
					</div>
				</div>	
			</section>
			<!-- End popular-course Area -->
						
			<!-- Start review Area -->
			<section class="review-area section-gap relative">
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row">
						<div class="active-review-carusel">
							<div class="single-review item">
								<div class="title justify-content-start d-flex">
									<a href="#"><h4>김예은</h4></a>
									<div class="star">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</div>
								<p>
									대통령이 임시회의 집회를 요구할 때에는 기간과 집회요구의 이유를 명시하여야 한다. 계엄을 선포한 때에는 대통령은 지체없이 국회에 통고하여야 한다.
								</p>
							</div>
							<div class="single-review item">
								<div class="title justify-content-start d-flex">
									<a href="#"><h4>전지호</h4></a>
									<div class="star">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</div>
								<p>
									대한민국은 국제평화의 유지에 노력하고 침략적 전쟁을 부인한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 대법관은 대법원장의 제청으로 국회의 동의를 얻어 대통령이 임명한다.
								</p>
							</div>
							<div class="single-review item">
								<div class="title justify-content-start d-flex">
									<a href="#"><h4>신승원</h4></a>
									<div class="star">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</div>
								<p>
									대법원에 대법관을 둔다. 다만, 법률이 정하는 바에 의하여 대법관이 아닌 법관을 둘 수 있다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.
								</p>
							</div>
							<div class="single-review item">
								<div class="title justify-content-start d-flex">
									<a href="#"><h4>윤형규</h4></a>
									<div class="star">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</div>
								<p>
									대통령·국무총리·국무위원·행정각부의 장·헌법재판소 재판관·법관·중앙선거관리위원회 위원·감사원장·감사위원 기타 법률이 정한 공무원이 그 직무집행에 있어서 헌법이나 법률을 위배한 때에는 국회는 탄핵의 소추를 의결할 수 있다.
								</p>
							</div>	
							<div class="single-review item">
								<div class="title justify-content-start d-flex">
									<a href="#"><h4>최선미</h4></a>
									<div class="star">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</div>
								<p>
									대법원장과 대법관이 아닌 법관은 대법관회의의 동의를 얻어 대법원장이 임명한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.
								</p>
							</div>
							<div class="single-review item">
								<div class="title justify-content-start d-flex">
									<a href="#"><h4>정진원</h4></a>
									<div class="star">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</div>
								<p>
									이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 국가는 법률이 정하는 바에 의하여 재외국민을 보호할 의무를 진다. 국가는 농지에 관하여 경자유전의 원칙이 달성될 수 있도록 노력하여야 하며, 농지의 소작제도는 금지된다.
								</p>
							</div>
							<div class="single-review item">
								<div class="title justify-content-start d-flex">
									<a href="#"><h4>정종화</h4></a>
									<div class="star">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</div>
								<p>
									국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회의 정기회는 법률이 정하는 바에 의하여 매년 1회 집회되며, 국회의 임시회는 대통령 또는 국회재적의원 4분의 1 이상의 요구에 의하여 집회된다.
								</p>
							</div>
							<div class="single-review item">
								<div class="title justify-content-start d-flex">
									<a href="#"><h4>김형섭</h4></a>
									<div class="star">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</div>
								<p>
									국무총리는 대통령을 보좌하며, 행정에 관하여 대통령의 명을 받아 행정각부를 통할한다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다. 감사위원은 원장의 제청으로 대통령이 임명하고, 그 임기는 4년으로 하며, 1차에 한하여 중임할 수 있다.
								</p>
							</div>																												
						</div>
					</div>
				</div>	
			</section>
			<!-- End review Area -->	
			
			<!-- Start cta-one Area -->
			<section class="cta-one-area relative section-gap">
				<div class="container">
					<div class="overlay overlay-bg"></div>
					<div class="row justify-content-center">
						<div class="wrap">
							<h1 class="text-white">강사 지원</h1>
							<p>
								사회적 특수계급의 제도는 인정되지 아니하며, 어떠한 형태로도 이를 창설할 수 없다. 국가는 국민 모두의 생산 및 생활의 기반이 되는 국토의 효율적이고 균형있는 이용·개발과 보전을 위하여 법률이 정하는 바에 의하여 그에 관한 필요한 제한과 의무를 과할 수 있다.
							</p>
							<a class="primary-btn wh" href="#">더 보기</a>								
						</div>					
					</div>
				</div>	
			</section>
			<!-- End cta-one Area -->

			<!-- Start blog Area -->
			<section class="blog-area section-gap" id="blog">
			</section>
			<!-- End blog Area -->			
			

			<!-- Start cta-two Area -->
			<section class="cta-two-area">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 cta-left">
							<h1>궁금한 점은 온라인으로 편리하게!</h1>
						</div>
						<div class="col-lg-4 cta-right">
							<a class="primary-btn wh" href="#">상담신청</a>
						</div>
					</div>
				</div>	
			</section>
			<!-- End cta-two Area -->										

									    			
<jsp:include page="includes/footer.jsp"/>
			
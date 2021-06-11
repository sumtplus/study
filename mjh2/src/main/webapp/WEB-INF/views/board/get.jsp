<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<jsp:include page="../includes/header.jsp"/>
	<!-- start banner Area -->
			<section class="banner-area relative about-banner" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								상세보기				
							</h1>	
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->
			<!-- Start post-content Area -->
			<section class="post-content-area single-post-area">
				<div class="container">
					<div class="posts-list">
						<div class="single-post row mb-1">
							<div class="col-lg-3  col-md-3 meta-details">
								<ul class="tags">
									<li>Food,</li>
									<li>Technology,</li>
									<li>Politics,</li>
									<li>Lifestyle</li>
								</ul>
								<div class="user-details row">
									<p class="user-name col-lg-12 col-md-12 col-6">${board.writer}</a> <span class="lnr lnr-user"></span></p>
									<p class="date col-lg-12 col-md-12 col-6">${board.regdate}</a> <span class="lnr lnr-calendar-full"></span></p>
									<p class="view col-lg-12 col-md-12 col-6">1.2M Views</a> <span class="lnr lnr-eye"></span></p>
									<p class="comments col-lg-12 col-md-12 col-6">06 Comments</a> <span class="lnr lnr-bubble"></span></p>
								</div>
							</div>
							<div class="col-lg-9 col-md-9">
								<div>
									<h3 class="mt-20 mb-20">${board.title}</h3>
								</div>
								<div class="quotes" style="min-height:200px;">
									<p>${board.content}</p>
								</div>
							</div>
							<div class="col-lg-12 col-md-9">
							<a href="list${cri.listLink}" data-oper="list" class="genric-btn success radius float-right mx-2">List</a>
							<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal"  var="pinfo"/>
							<c:if test="${pinfo.username == board.writer}">
						    <a href="modify${cri.listLink}&bno=${board.bno}" data-oper="modify" class="genric-btn primary radius float-right mx-2">Modify</a>
						    </c:if>
						    <a href="register${cri.listLink}&bno=${board.bno}" id="answer" class="genric-btn info radius float-right mx-2">Answer</a>
						    </sec:authorize>
						    </div>
						</div>
						<div class="row widget-wrap px-3">
							<div class="col-lg-12 col-md-9 single-sidebar-widget popular-post-widget mx-1">
								<h4 class="popular-title bg-info">File</h4>
								<div class="popular-post-list">
							    	<div class="uploadResult">
								    	<ul>
											<!-- <li class="single-post-list d-flex flex-row align-items-center">
												<div class="thumb">
													<img class="img-fluid" src="img/blog/pp1.jpg" alt="">
												</div>
												<div class="details">
													<a href="blog-single.html"><h6>Space The Final Frontier</h6></a>
													<p>02 Hours ago</p>
												</div>
											</li> -->
   										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Reply -->
						<div class="row comments-area mt-1">
							<div class="col-lg-12 col-md-9">
								<h4 class="bg-info text-light py-3 mb-3">Comments</h4>
								<button id="addReplyBtn" class="genric-btn primary radius float-right">New Reply</button>
    						</div>
    						<div class="col-lg-12 col-md-9">
								<ul class="chat">
									<!-- <li class="comment-list">
	                                    <div class="single-comment justify-content-between d-flex">
	                                        <div class="user justify-content-between d-flex">
	                                            <div class="thumb">
	                                                <img src="/resources/img/avatar.png" alt="" width="60px" height="60px">
	                                            </div>
	                                            <div class="desc">
	                                                <h5>Emilly Blunt</h5>
	                                                <p class="date">December 4, 2017 at 3:12 pm </p>
	                                                <p class="comment">
	                                                    Never say goodbye till the end comes!
	                                                </p>
	                                            </div>
	                                        </div>
	                                        <div class="reply-btn">
	                                               <a href="" class="btn-reply text-uppercase">reply</a> 
	                                        </div>
	                                    </div>
	                                </li> -->	
	                               </ul>
                               </div>
							<button id="btnShowMore" class="genric-btn info radius btn-block my-4">더보기</button>	                                             				
						</div>
					</div>
				</div>
			</section>
			<!-- End post-content Area -->
    
			<!-- Result Modal-->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		        aria-hidden="true">
		        <div class="modal-dialog" role="document">
		            <div class="modal-content bg-light">
		                <div class="modal-header bg-info">
		                    <h5 class="modal-title text-light" id="myModalLabel">REPLY MODAL</h5>
		                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		                        <span aria-hidden="true">×</span>
		                    </button>
		                </div>
		                <div class="modal-body">
		                	<form method="post" class="needs-validation" novalidate>
	                            <div class="form-group">
								    <label for="reply" class="font-weight-bold text-info">reply</label>
								    <input type="text" class="form-control" id="reply" name="reply" required placeholder="New Reply!!!">
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
							    <div class="form-group">
								    <label for="replyer" class="font-weight-bold text-info">replyer</label>
								    <input type="text" class="form-control" id="replyer" name="replyer" required placeholder="replyer">
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
							    <div class="form-group">
								    <label for="replyDate" class="font-weight-bold text-info">replyDate</label>
								    <input type="text" class="form-control" id="replyDate" name="replyDate" required placeholder="2021-01-01 13:50">
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
                            </form>
		                </div>
		                <div class="modal-footer">
		                    <button id="modalModBtn" class="genric-btn primary radius medium ac" type="button" data-dismiss="modal">Modify</button>
		                    <button id="modalRemoveBtn" class="genric-btn danger radius medium ac" type="button" data-dismiss="modal">Remove</button>
		                    <button id="modalRegBtn" class="genric-btn info radius medium ac" type="button" data-dismiss="modal">Register</button>
		                    <button id="modalCloseBtn" class="genric-btn success radius medium" type="button" data-dismiss="modal">close</button>
		                </div>
	            	</div>
		    	</div>
			</div>
		    <!-- Image Modal-->
		    <div class="modal fade" id="imageModal">
		        <div class="modal-dialog modal-xl">
		            <div class="modal-content">
		                <div class="modal-body text-center">
		               		<img class="mw-100">
		                </div>
		            </div>
		        </div>
		    </div>
		    
        <!-- content-wrapper ends -->
        <script>
		// Disable form submissions if there are invalid fields
		(function() {
		  'use strict';
		  window.addEventListener('load', function() {
		    // Get the forms we want to add validation styles to
		    var forms = document.getElementsByClassName('needs-validation');
		    // Loop over them and prevent submission
		    var validation = Array.prototype.filter.call(forms, function(form) {
		      form.addEventListener('submit', function(event) {
		        if (form.checkValidity() === false) {
		          event.preventDefault();
		          event.stopPropagation();
		        }
		        form.classList.add('was-validated');
		      }, false);
		    });
		  }, false);
		})();
		</script>
		<script src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
		<script>
			var cp = '${pageContext.request.contextPath}';
			var bno = <c:out value="${board.bno}" />;
			var replyUL =$(".chat");
			var csrf = '${_csrf.headerName}';
			var csrfToken = "${_csrf.token}";
			$(document).ajaxSend(function(e,xhr) {
				xhr.setRequestHeader(csrf, csrfToken);
			});
			//var pageNum = 1;
			var replyer = '';
				<sec:authorize access="isAuthenticated()">
               		replyer = '<sec:authentication property="principal.username"/>';
               	</sec:authorize>
                     	
			showList();
			
			function showList(rno) {
				replyService.getList({bno:bno, rno:rno, cp:cp}, function(list) {
					// 댓글 목록 출력
					console.log(list);
					
					//if(page == -1) showList(result.realEnd)
					if(!list.length) { //list의 길이가 0이면
						$("#btnShowMore").prop("disabled", true).text("추가 댓글이 없습니다.");
					}
					
					var str = "";
					for(var i in list) {
						
						str += '<li class="comment-list" data-rno="' + list[i].rno + '">';
						str += '<div class="single-comment justify-content-between d-flex">';
						str += '<div class="user justify-content-between d-flex">';
						str += '<div class="thumb">';
						str += '<img src="${pageContext.request.contextPath}/resources/img/avatar.png" alt="" width="60px" height="60px"></div>';
                            
						str += '	<div class="desc">';
						str += '   	<h5>' + list[i].replyer + '</h5>';
						str += '    	<p class="date">' + replyService.displayTime(list[i].replyDate) +'</p>';
						str += '	<p class="comment">' + list[i].reply + '</p>';
						str += '	</div></div></div>';
						str += '</li>';
					}
					replyUL.html(replyUL.html() + str);
                        
				})
			}
			
			$(function() {
				// 등록폼 버튼 이벤트
				$("#addReplyBtn").click(function() {
					$("#myModal").find("input").val("");
					$("#replyer").val(replyer).prop("readonly", true);
					$("#replyDate").closest("div").hide();
					$(".ac").hide().eq(2).show();
					$("#myModal").modal("show");
				})
				/* $("#child").click(function() {
					event.preventDefault();
				} */
				
				
				// 댓글 목록 모달 팝업 이벤트
				$(".chat").on("click", "li", function() {
					var rno = $(this).data("rno");
					console.log(rno);
					replyService.get({rno:rno, cp:cp}, function(result) {
						console.log(result);
						$("#reply").val(result.reply);
						$("#replyer").val(result.replyer).prop("readonly", true);
						$("#replyDate").val(replyService.displayTime(result.replyDate)).prop("readonly", true).closest("div").show();
						$("#myModal").data("rno", rno);
						$(".ac").show().eq(2).hide();
						if(!replyer){
							$(".ac").hide();	
						}
						$("#myModal").modal("show");
					});
				})
				
				// 변경?
				// 등록 적용버튼 이벤트
				$("#modalRegBtn").click(function() {
					var reply = {bno:bno, reply:$("#reply").val(), replyer:replyer, cp:cp};
					replyService.add(reply, function(result) {
						alert(result);
						$("#myModal").modal("hide");
						
						replyService.get({rno:result, cp:cp}, function(result){
							$(".chat").append(replyService.getReplyDOM(result));
						})
						showList();
					});
				})
				// 수정 적용버튼 이벤트
				$("#modalModBtn").click(function() {
					var reply = {rno: $("#myModal").data("rno"), reply:$("#reply").val(), replyer:replyer, cp:cp};
					console.log(reply);
					replyService.update(reply, function(result) {
						alert(result);
						$("#myModal").modal("hide");
						$(".chat li").each(function() {
							if($(this).data("rno") == $("#myModal").data("rno")) {
								var $li = $(this);
								replyService.get({rno: $li.data("rno"), cp:cp}, function(result){
									//$li.find("p").html(result.reply);
									$li.after(replyService.getReplyDOM(result)).remove();
								})
							}
						})
						
						//showList();
					});
				})
				// 삭제 적용버튼 이벤트
				$("#modalRemoveBtn").click(function() {
					/* console.log(reply); */
					replyService.remove({rno:$("#myModal").data("rno"), replyer:replyer, cp:cp}, function(result) {
						alert(result);
						$("#myModal").modal("hide");
						
						$(".chat li").each(function() {
							if($(this).data("rno") == $("#myModal").data("rno")) {
								$(this).remove();
							}
						})
						
						//showList(pageNum);
					});
				})
				
				// 댓글 페이지 버튼 이벤트
				$(".reply-footer").on("click","a", function() {
					event.preventDefault();
					
					pageNum = $(this).attr("href");
					showList(pageNum);
				});
				
				// btnShowMore 이벤트
				$("#btnShowMore").click(function() {
					// 마지막 rno 가져오기
					var rno = $(".chat li:last").data("rno");
					// showList() 호출
					showList(rno);
				});
				var count = 0;
 				
				$.getJSON("${pageContext.request.contextPath}/board/getAttachList", {bno:bno}, function(uploadResultArr) {
					var str = "";
					for(var i in uploadResultArr) {
						var obj = uploadResultArr[i];
						console.log(obj);
						str += "<li class='single-post-list d-flex flex-row align-items-center' ";
						str += " data-filename='" + obj.fileName;
						str += "' data-image='" + obj.image;
						str += "' data-uuid='" + obj.uuid;
						str += "' data-uploadpath='" + obj.uploadPath;
						str += "' >";
						
						
					
						
						if(!obj.image) {
							//var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName); 	
							str += "<div class='details'>";
							str += "<a href='${pageContext.request.contextPath}/download?fileName=" + obj.downPath + "'><i class='fas fa-paperclip text-muted'></i><h6>" + obj.fileName + "</h6></a>";
							str += "</div>"
		//					str += "<li class='list-group-item'><i class='fas fa-paperclip text-muted'></i>" + uploadResultArr[i].fileName + "</li>";
						}
						else {
							//var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName); 
							str += "<div class='thumb'>";
							str += "<a href='javascript:showImage(\"" +  obj.downPath+ "\")'>";
							str += "<img class='img-fluid' src='${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
							str += "</div>"
						}
						str += "</li>";
					}
					$(".uploadResult ul").html(str);
				})
				
			});
			
			function showImage(path) {
				$("#imageModal img").attr("src", "${pageContext.request.contextPath}/display?fileName="+path);
				//alert(path);
				$("#imageModal").modal("show");
			} 
			
			
		</script>
		
<jsp:include page="../includes/footer.jsp"/>       

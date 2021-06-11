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
								상세보기				
							</h1>	
							<p class="text-white link-nav"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href="gallery.html"> Gallery</a></p>
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->
			
			
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      
      
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <!-- <div id="fb-root"></div>
			<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0" nonce="YOawqPB4"></script> -->
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <div class="card-body">
                  			<!-- <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="" data-layout="standard" data-action="like" data-size="small" data-share="true"></div> -->
                            <form method="post" class="needs-validation" novalidate>
	                            <div class="form-group">
								    <label for="bno" class="font-weight-bold text-warning">title</label>
								    <input type="text" class="form-control" id="bno" name="bno" required value="${board.bno}" readonly>
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
                            	<div class="form-group">
								    <label for="title" class="font-weight-bold text-warning">title</label>
								    <input type="text" class="form-control" id="title" placeholder="게시글 제목을 입력하세요" name="title" required value="${board.title}" readonly>
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
							    <div class="form-group">
								    <label for="content" class="font-weight-bold text-warning">content</label>
								    <textarea class="form-control" id="content" rows="10" placeholder="게시글 내용을 입력하세요" name="content" required readonly>${board.content}</textarea>
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
							    <div class="form-group">
								    <label for="writer" class="font-weight-bold text-warning">title</label>
								    <input type="text" class="form-control" id="writer" placeholder="작성자를 입력하세요" name="writer" required value="${board.writer}" readonly>
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
								<a href="list${cri.listLink}" data-oper="list" class="btn btn-outline-info float-right">List</a>
							    <a href="modify${cri.listLink}&bno=${board.bno}" data-oper="modify" class="btn btn-outline-warning float-right mx-1">Modify</a>
							    <a href="register${cri.listLink}&bno=${board.bno}" id="answer" class="btn btn-outline-warning float-right mx-1">Answer</a>
							    <%-- <a href="register${cri.listLink}&bno=${board.bno}" id="answer" class="btn btn-outline-warning float-right mx-1">Answer</a> --%>
							    
							    <%-- 
							    <input type="hidden" name="answer" value="answer">
							    <input type="hidden" name="origintitle" value="${board.title}">
							    <input type="hidden" name="parentno" value="${board.bno}">
							    <input type="hidden" name="regroup" value="${board.regroup}">
							    <input type="hidden" name="depth" value="${board.depth}">
							     --%>
                            </form>
                        </div>
                        
                        <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary float-left"><i class="fa fa-copy"></i> Files</h6>
	                        </div>
	                        <div class="card-body">
		                        <div class="uploadResult ">
									<ul class="list-group list-group-horizontal">
									</ul>
								</div>
	                        </div>
                        </div>
                        
                        <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary float-left"><i class="fa fa-comments fa-fw"></i> Reply</h6>
	                            <button id="addReplyBtn" class="genric-btn primary radius float-right float-right">New Reply</button>
	                        </div>
	                        <div class="card-body">
		                        <ul class="list-group chat">
		                        </ul>
		                        	<button id="btnShowMore" class="btn btn-primary btn-block my-4">더보기</button>
		                         <div class="reply-footer">
         						 </div>
	                        </div>
                        </div>
                    </div>
					<!-- Result Modal-->
				    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
				        aria-hidden="true">
				        <div class="modal-dialog" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="myModalLabel">REPLY MODAL</h5>
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
				                    <button id="modalModBtn" class="btn btn-warning btn-sm ac" type="button" data-dismiss="modal">Modify</button>
				                    <button id="modalRemoveBtn" class="btn btn-danger btn-sm ac" type="button" data-dismiss="modal">Remove</button>
				                    <button id="modalRegBtn" class="btn btn-primary btn-sm ac" type="button" data-dismiss="modal">Register</button>
				                    <button id="modalCloseBtn" class="btn btn-secondary btn-sm" type="button" data-dismiss="modal">close</button>
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
                </div>
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
		<script src="/resources/js/reply.js"></script>
		<script>
			var bno = <c:out value="${board.bno}" />;
			var replyUL =$(".chat");
			
			//var pageNum = 1;
                     	
			showList();
			
			function showList(rno) {
				replyService.getList({bno:bno, rno:rno}, function(list) {
					// 댓글 목록 출력
					console.log(list);
					
					//if(page == -1) showList(result.realEnd)
					if(!list.length) { //list의 길이가 0이면
						$("#btnShowMore").prop("disabled", true).text("추가 댓글이 없습니다.");
					}
					
					var str = "";
					for(var i in list) {
						
						str += '<li class="list-group-item" data-rno="' + list[i].rno + '">';
						str += '	<div class="header">';
						str += '   	<strong>' + list[i].replyer + '</strong>';
						str += '    	<small class="float-right">' + replyService.displayTime(list[i].replyDate) +'</small>';
						str += '	</div>';
						str += '	<p class="mt-2">' + list[i].reply + '</p>';
						str += '</li>';
					}
					replyUL.html(replyUL.html() + str);
					
				})
			}
			
			$(function() {
				// 등록폼 버튼 이벤트
				$("#addReplyBtn").click(function() {
					$("#myModal").find("input").val("");
					$("#replyer").val("");
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
					replyService.get(rno, function(result) {
						console.log(result);
						$("#reply").val(result.reply);
						$("#replyer").val(result.replyer);
						$("#replyDate").val(replyService.displayTime(result.replyDate)).prop("readonly", true).closest("div").show();
						$("#myModal").data("rno", rno);
						$(".ac").show().eq(2).hide();
						$("#myModal").modal("show");
					});
				})
				
				
				// 등록 적용버튼 이벤트
				$("#modalRegBtn").click(function() {
					var reply = {bno:bno, reply:$("#reply").val(), replyer:$("#replyer").val()};
					replyService.add(reply, function(result) {
						alert(result);
						$("#myModal").modal("hide");
						
						//showList(-1);
					});
				})
				// 수정 적용버튼 이벤트
				$("#modalModBtn").click(function() {
					var reply = {rno: $("#myModal").data("rno"), reply:$("#reply").val(), replyer:$("#replyer").val()};
					console.log(reply);
					replyService.update(reply, function(result) {
						alert(result);
						$("#myModal").modal("hide");
						
						//showList(pageNum);
					});
				})
				// 삭제 적용버튼 이벤트
				$("#modalRemoveBtn").click(function() {
					/* console.log(reply); */
					replyService.remove({rno:$("#myModal").data("rno"), replyer:$("#replyer").val()}, function(result) {
						alert(result);
						$("#myModal").modal("hide");
						
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
 				
				$.getJSON("/board/getAttachList", {bno:bno}, function(uploadResultArr) {
					var str = "";
					for(var i in uploadResultArr) {
						var obj = uploadResultArr[i];
						console.log(obj);
						str += "<li class='list-group-item' ";
						str += " data-filename='" + obj.fileName;
						str += "' data-image='" + obj.image;
						str += "' data-uuid='" + obj.uuid;
						str += "' data-uploadpath='" + obj.uploadPath;
						str += "' >";
						if(!obj.image) {
							//var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName); 	
							str += "<a href='/download?fileName=" + obj.downPath + "'><i class='fas fa-paperclip text-muted'></i>" + obj.fileName + "</a>";
		//					str += "<li class='list-group-item'><i class='fas fa-paperclip text-muted'></i>" + uploadResultArr[i].fileName + "</li>";
						}
						else {
							//var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName); 
							str += "<a href='javascript:showImage(\"" +  obj.downPath+ "\")'>";
							str += "<img src='/display?fileName=" + obj.thumbPath + "'></a>";
						}
						str += "</li>";
					}
					$(".uploadResult ul").html(str);
				})
				
			});
			
			function showImage(path) {
				$("#imageModal img").attr("src", "/display?fileName="+path);
				//alert(path);
				$("#imageModal").modal("show");
			} 
			
			
			
			/*
			replyService.add({bno:bno, reply:"JS 테스트", replyer:"테스트맨"}, function(result) {
				//객체를 보내고나서 할일
				alert(result);
			});
			
			replyService.getList({bno:bno, page:1}, function(list) {
				console.log(list);
				for(var i in list) {
					console.log(list[i].rno);
				}
			})
			replyService.remove(101, function(result) {
				alert(result);
			}, function(err) {
				alert("삭제 실패");
			});
			
			replyService.update({rno:102, reply:"ajax로 수정한 댓글"}, function(result) {
				alert(result);
			*/
			//});
			
			
		</script>
		
<jsp:include page="../includes/footer.jsp"/>       

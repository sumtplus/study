<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../includes/header.jsp"/>
<!-- start banner Area -->
			<section class="banner-area relative about-banner" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								글 수정				
							</h1>	
							<p class="text-white link-nav"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href="gallery.html"> Gallery</a></p>
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Board View</h6>
                        </div>
                        <div class="card-body">
                            <form method="post" class="needs-validation" novalidate>
                            	<input type="hidden" name="pageNum" value="${cri.pageNum}">
                            	<input type="hidden" name="amount" value="${cri.amount}">
	                            <div class="form-group">
								    <label for="bno" class="font-weight-bold text-warning">title</label>
								    <input type="text" class="form-control" id="bno" name="bno" required value="${board.bno}" readonly>
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
                            	<div class="form-group">
								    <label for="title" class="font-weight-bold text-warning">title</label>
								    <input type="text" class="form-control" id="title" placeholder="게시글 제목을 입력하세요" name="title" required value="${board.title}" >
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
							    <div class="form-group">
								    <label for="content" class="font-weight-bold text-warning">content</label>
								    <textarea class="form-control" id="content" rows="10" placeholder="게시글 내용을 입력하세요" name="content" required >${board.content}</textarea>
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
							    <div class="form-group">
								    <label for="writer" class="font-weight-bold text-warning">title</label>
								    <input type="text" class="form-control" id="writer" placeholder="작성자를 입력하세요" name="writer" required value="${board.writer}" readonly>
								    <div class="valid-feedback">Valid.</div>
      								<div class="invalid-feedback">Please fill out this field.</div>
							    </div>
								<a href="list${cri.listLink}" data-oper="list" class="btn btn-outline-info float-right mx-1">List</a>
							    <!-- formaction 전체폼을 전송할때 어디로 갈지 action값변경(기본값은 현재위치로 보냄) -->
							    <button data-oper="remove" class="btn btn-outline-danger float-right mx-1" formaction="remove">Remove</button>
							    <button data-oper="modify" class="btn btn-outline-warning float-right mx-1">Modify</button>
                            </form>
                        </div>
                    </div>
                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary float-left"><i class="fa fa-copy"></i> Files</h6>
	                        </div>
	                        <div class="card-body">
	                        	<div class="uploadDiv">
									<input id="files" type="file" name="files" multiple>
								</div>
		                        <div class="uploadResult">
									<ul class="list-group list-group-horizontal">
									</ul>
								</div>
	                        </div>
                        </div>
					
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
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
			<script>
					//var csrf = '${_csrf.headerName}';
					//var csrfToken = "${_csrf.token}";
					var bno = <c:out value="${board.bno}"/>;
					var cloneObj = $(".uploadDiv").clone();
					
					function checkExtension(name, size) {
						var regex = /(.*?)\.(exe|sh|jsp|php|jar)/gi;
						var maxSize = 1024 * 1024 * 5;
						
						if(size >= maxSize) {
							alert("파일 사이즈 초과");
							return false;
						}
						if(regex.test(name)) {
							alert("해당 종류의 파일은 업로드 할수 없습니다.")
							return false;
						}
						return true;
					}
					$(function() {
						function showUploadedFile(uploadResultArr) {
							var str = "";
							for(var i in uploadResultArr) {
								var obj = uploadResultArr[i];
								str += "<li class='list-group-item' ";
								str += " data-filename='" + obj.fileName;
								str += "' data-image='" + obj.image;
								str += "' data-uuid='" + obj.uuid;
								str += "' data-uploadpath='" + obj.uploadPath;
								str += "' >";
								if(!obj.image) {
									str += "<i class='fas fa-paperclip text-muted'></i> " + obj.fileName ;
								}
								else {
									str += "<img src='/display?fileName=" + obj.thumbPath + "'>";
								}
								str += "<i class='fas fa-times text-danger removeFileBtn'></i>";
								str += "</li>";
							}
							$(".uploadResult ul").append(str);
						}
					
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
									str += "<i class='fas fa-paperclip text-muted'></i> "+ obj.fileName + "";
								}
								else {
									str += "<img src='/display?fileName=" + obj.thumbPath + "'>";
								}
								str += "<i class='fas fa-times text-danger removeFileBtn'></i>"
								str += "</li>";
							}
							$(".uploadResult ul").html(str);
						});
						
						$(".uploadResult").on("click", ".removeFileBtn", function() {
						// x를 클릭하면 객체를 생성한다
						var $li = $(this).closest("li");
						var data = {
							fileName : $li.data("filename"),
							image: $li.data("image"),
							uuid: $li.data("uuid"),
							uploadPath: $li.data("uploadpath")
						}
						console.log(data);
						console.log(JSON.stringify(data));
						
						$.ajax({
							url : "/deleteFile",
							type : "post",
							data : JSON.stringify(data),
							/* beforeSend : function(xhr) {
								xhr.setRequestHeader(csrf, csrfToken)
							}, */
							contentType : "application/json; charset=utf-8",
							success : function(result) {
								alert(result);
								$li.remove();
							}
						});
						
						 $li.remove();
						});
						 $(".uploadDiv").on("change", "#files", function() {
							var formData = new FormData();
							var files = $("#files")[0].files; // 자바스크립트의 일반 객체로 가져오기위해 [0]를 씀
							console.log(files);
							
							for(var i in files) {
								if(!checkExtension(files[i].name, files[i].size)) {
									$(".uploadDiv").html(CloneObj.html());	
									return false;			
								}
								formData.append("files", files[i]);
							}
							console.log(formData);
							
							$.ajax({
								url : '/uploadAction',
								type : 'post',
								data : formData,
								dataType: 'json',
								/* beforeSend : function(xhr) {
									xhr.setRequestHeader(csrf, csrfToken)
								}, */
								processData : false,
								contentType : false, //contentType을 알아서보냄
								success : function(result) { //result는 jsp에 대한 요청정보
									console.log(result);
									showUploadedFile(result);
									$(".uploadDiv").html(cloneObj.html());
								}
							});
						 })
						 $("button").click(function() {
							if($(this).data("oper") !== "modify") return;
							event.preventDefault();
							var str = "";
							var attrs = ["fileName", "uuid", "uploadPath", "image"];
							$(".uploadResult li").each(function(i, it) { //i는 인덱스 it는 아이템
								for(var j in attrs) {
									var tmp = '<input type="hidden" name="attachList[' + i + '].';
									tmp += attrs[j] + '" value="' + $(it).data(attrs[j].toLowerCase()) + '">';
									console.log(tmp);
									str += tmp;
								}
							});
							console.log(str);
							$(this).closest("form").append(str).submit();
						 })
					})
					</script>
<jsp:include page="../includes/footer.jsp"></jsp:include>
            
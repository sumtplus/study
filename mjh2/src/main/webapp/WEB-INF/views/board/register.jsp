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
								글 작성
							</h1>	
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->
			
            <!-- Begin Page Content -->
			<div class="container">
				<div class="card shadow mb-4">
					<div class="card-body comment-form mt-1">
						<form method="post" class="needs-validation" novalidate>
                          	<div class="form-group">
							    <label for="title" class="font-weight-bold text-warning float-left pl-2">title</label>
							    <input type="text" class="form-control" id="title" placeholder="게시글 제목을 입력하세요" name="title" required
							    <%-- value="${empty board.title ? '' : 'RE : '} ${empty board.title ? '' : board.title}"  ${empty board.title ? '' : 'readonly'} > --%>
							    value="${empty board.title ? '' : board.title}"  ${empty board.title ? '' : 'readonly'} >
							    <div class="valid-feedback">Valid.</div>
   								<div class="invalid-feedback">Please fill out this field.</div>
					    	</div>
						    <div class="form-group">
							    <label for="content" class="font-weight-bold text-warning float-left pl-2">content</label>
							    <textarea class="form-control" id="content" rows="10" placeholder="게시글 내용을 입력하세요" name="content" required></textarea>
							    <div class="valid-feedback">Valid.</div>
   								<div class="invalid-feedback">Please fill out this field.</div>
						    </div>
						    <div class="form-group">
							    <label for="writer" class="font-weight-bold text-warning float-left pl-2">title</label>
							    <input type="text" class="form-control" id="writer" placeholder="작성자를 입력하세요" name="writer" required readonly value='<sec:authentication property="principal.username"/>'>
							    <div class="valid-feedback">Valid.</div>
   								<div class="invalid-feedback">Please fill out this field.</div>
						    </div>
						    <input type="hidden" name="parentno" value="${board.bno}">
						    <input type="hidden" name="regroup" value="${board.regroup}">
						    <input type="hidden" name="depth" value="${empty board.title ? null : board.depth + 1}" >
							<button type="reset" class="genric-btn success-border radius float-right">reset</button>
						    <button type="submit" class="genric-btn info-border radius float-right mx-1">submit</button>
						    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</div>
				</div>
                <div class="card shadow mb-4">
 					<div class="card-header bg-info py-3">
                        <h6 class="m-0 font-weight-bold text-light">File Attach</h6>
                    </div>
                    <div class="card-body">
	                    <div class="uploadDiv">
							<input id="files" type="file" name="files" multiple>
						</div>
						<div class="uploadResult ">
							<ul class="list-group list-group-horizontal">
							</ul>
						</div>
					</div>
				</div>
			</div>
					
			<!-- Result Modal-->
		    <div class="modal fade" id="imageModal">
		        <div class="modal-dialog modal-xl">
		            <div class="modal-content">
		                <div class="modal-body text-center">
		               		<img class="mw-100">
		                </div>
		            </div>
		        </div>
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
			var regex = /(.*?)\.(exe|sh|jsp|php|jar)/gi;
			var maxSize = 1024 * 1024 * 5;
			var cloneObj = $(".uploadDiv").clone(); //클론을 했을때 이벤트가 없으며 이벤트가 위임이 안되있음
			var uploadResult = $(".uploadResult ul");
			var csrf = '${_csrf.headerName}';
			var csrfToken = "${_csrf.token}";
			
			console.log(cloneObj);
			$(".uploadDiv").on("change", "#files", function() {
				var formData = new FormData();
				var files = $("#files")[0].files; // 자바스크립트의 일반 객체로 가져오기위해 [0]를 씀
				console.log(files);
				
				for(var i in files) {
					if(!checkExtension(files[i].name, files[i].size)) {
							
						return false;			
					}
					formData.append("files", files[i]);
				}
				console.log(formData);
				
				$.ajax({
					url : '${pageContext.request.contextPath}/uploadAction',
					type : 'post',
					data : formData,
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrf, csrfToken)
					},
					dataType: 'json',
					processData : false,
					contentType : false, //contentType을 알아서보냄
					success : function(result) { //result는 jsp에 대한 요청정보
						console.log(result);
						showUploadedFile(result);
						$(".uploadDiv").html(cloneObj.html());
					}
				});
			})
			
			function checkExtension(name, size) {
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
						str += "<a href='${pageContext.request.contextPath}/download?fileName=" + obj.downPath + "'><i class='fas fa-paperclip text-muted'></i>" + obj.fileName + "</a>";
					}
					else {
						str += "<a href='javascript:showImage(\"" +  obj.downPath+ "\")'>";
						str += "<img src='${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
					}
					str += "<i class='fas fa-times text-danger removeFileBtn'></i>"
					str += "</li>";
				}
				uploadResult.append(str);
			}
			function showImage(path) {
				$("#imageModal img").attr("src", "${pageContext.request.contextPath}/display?fileName="+path);
				$("#imageModal").modal("show");
			}
			$(".uploadResult").on("click", ".removeFileBtn", function() {
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
					url : "${pageContext.request.contextPath}/deleteFile",
					type : "post",
					data : JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success : function(result) {
						alert(result);
						$li.remove();
					}
				});
				
			});
			
			$("button[type='submit']").click(function(){
				event.preventDefault();
				var str = "";
				var attrs = ["fileName", "uuid", "uploadPath", "image"];
				$(".uploadResult li").each(function(i, it) { 
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
		</script>
<jsp:include page="../includes/footer.jsp"></jsp:include>
            
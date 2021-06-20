/**
 *  자바스크립트 댓글 모듈
 */
console.log("reply module...");

var replyService = (function() {
	return {
		//ajax 댓글등록
		add: function(reply, callback, error) {
			console.log("reply.add()........");
			
			$.ajax({
				type : "post",
				url : reply.cp+"/replies/new",
				data : JSON.stringify(reply), 
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}
			});
			
		},
		//ajax 댓글목록조회
		getList: function(param, callback, error) {
			var bno = param.bno;
			var rnoStr = param.rno ? + param.rno : "";
			var url = param.cp+"/replies/more/" + bno + "/" + rnoStr;
			console.log(url);
			
			$.getJSON(url, function(result) { //success
				if(callback) {
					callback(result);
				}
			}).fail(function(xhr, status, er) { // error
				if(error) {
					error(er);
				}
			});
		},
		// ajax 댓글 삭제
		remove: function(reply, callback, error) {
			var url = reply.cp+"/replies/" + reply.rno + "/" + reply.replyer;
			$.ajax({
				type : "delete",
				url : url,
				success : function(result) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}
			})
		},
		//ajax 댓글 수정
		update: function(reply, callback, error) {
			var url = reply.cp+"/replies/" + reply.rno;
			$.ajax({
				type : "put",
				url : url,
				data : JSON.stringify(reply), 
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}
			});
		},
		//ajax 댓글 상세조회
		get: function(reply, callback, error) {
			var rno = reply.rno;
			var url = reply.cp+"/replies/" + rno;
			$.getJSON(url, function(result) { //success
				if(callback) {
					callback(result);
				}
			}).fail(function(xhr, status, er) { // error
				if(error) {
					error(er);
				}
			});
		},
		// 지난시간
		displayTime: function(timeValue) {
			return moment(timeValue).fromNow();
		},
		getReplyDOM: function(param) {
			var str="";
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
	};
})();












/**
 *  reply module
 */
console.log("reply module...");

var replyService = (function() {
	return {
		add: function(reply, callback, error) {
			console.log("reply.add()........");
			//ajax호출
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
		displayTime: function(timeValue) {
			return moment(timeValue).fromNow();
		},
		getReplyDOM: function(param) {
			var str="";
//			str += '<li class="list-group-item" data-rno="' + param.rno + '">';
//			str += '	<div class="header">';
//			str += '   	<strong>' + param.replyer + '</strong>';
//			str += '    	<small class="float-right">' + this.displayTime(param.replyDate) +'</small>';
//			str += '	</div>';
//			str += '	<p class="mt-2">' + param.reply + '</p>';
//			str += '</li>';
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












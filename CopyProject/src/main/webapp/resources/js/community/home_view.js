/* 사이드 메뉴 바 */
if($(window).width() > 1400){
	$(window).scroll(function(){
		if ($(this).scrollTop() > 700){
			$('.slide_bar').css({"display" : "block"});
			$('.slide_bar_').css({"display" : "block"});
			$('.slide_bar').show();
			$('.slide_bar_').show();
		} else{
			$('.slide_bar').hide();
			$('.slide_bar_').hide();
		}
	});	
}else if($(window).width() > 1200){
	$(window).scroll(function(){
		if ($(this).scrollTop() > 550){
			$('.slide_bar').css({"display" : "block"});
			$('.slide_bar_').css({"display" : "block"});
			$('.slide_bar').show();
			$('.slide_bar_').show();
		} else{
			$('.slide_bar').hide();
			$('.slide_bar_').hide();
		}
	});	
}else if($(window).width() > 992){
	$(window).scroll(function(){
		if ($(this).scrollTop() > 400){
			$('.slide_bar').css({"display" : "block"});
			$('.slide_bar_').css({"display" : "block"});
			$('.slide_bar').show();
			$('.slide_bar_').show();
		} else{
			$('.slide_bar').hide();
			$('.slide_bar_').hide();
		}
	});	
}else if($(window).width() > 768){
	$(window).scroll(function(){
		if ($(this).scrollTop() > 300){
			$('.slide_bar').css({"display" : "block"});
			$('.slide_bar_').css({"display" : "block"});
			$('.slide_bar').show();
			$('.slide_bar_').show();
		} else{
			$('.slide_bar').hide();
			$('.slide_bar_').hide();
		}
	});	
}else if($(window).width() > 576){
	$(window).scroll(function(){
		if ($(this).scrollTop() > 220){
			$('.slide_bar').css({"display" : "block"});
			$('.slide_bar_').css({"display" : "block"});
			$('.slide_bar').show();
			$('.slide_bar_').show();
		} else{
			$('.slide_bar').hide();
			$('.slide_bar_').hide();
		}
	});	
}else{
	$(window).scroll(function(){
		if ($(this).scrollTop() > 100){
			$('.slide_bar').css({"display" : "block"});
			$('.slide_bar_').css({"display" : "block"});
			$('.slide_bar').show();
			$('.slide_bar_').show();
		} else{
			$('.slide_bar').hide();
			$('.slide_bar_').hide();
		}
	});	
}


/* 팔로우 요청 */
function follow(fmidx){
	$.ajax({
		type : 'post',
		url : contextPath+'/follow/followC',
		data : 'fmidx='+fmidx,
		success : function(result){
			if(result == "FollowOK"){
				location.reload();
				
			}
		}
	})
}

/* 언팔로우 요청 */
function unfollow(fmidx){
	$.ajax({
		type : 'post',
		url : contextPath+'/follow/unfollowC',
		data : 'fmidx='+fmidx,
		success : function(result){
			if(result == "UnFollowOK"){
				location.reload();
				
			}
		}	
	});
}

/* 좋아요 요청 */
function scrap(cbidx){
	$.ajax({
		type : 'post',
		url : contextPath+'/scrap/scrapUp',
		data : 'cbidx='+cbidx,
		success  : function(result){
			if(result == "ScrapOK"){
				location.reload();
			}
		}
	});
}

/* 좋아요 취소 */
function unscrap(cbidx){
	$.ajax({
		type : 'post',
		url : contextPath+'/scrap/scrapDown',
		data : 'cbidx='+cbidx,
		success : function(result){
			if(result == "UnScrapOK"){
				location.reload();
			}
		}
	})
}

/* 댓글 높이 조절 */
var textEle = $('.reply_content_form_text');
textEle.on('keyup', function() {
	adjustHeight();
});

function adjustHeight() {
	var textEle = $('.reply_content_form_text');
	var textSize = $(".reply_input");
	var textForm = $("#replyFrm");
	textEle[0].style.height = 'auto';
	textSize[0].style.height = 'auto';
	textForm[0].style.height = 'auto';
	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight);
	textEle.css('overflow', 'hidden');
	textSize.css('height', textEleHeight);
	textForm.css('height', textEleHeight);
	
};

/* 댓글 수정 높이 조절 */
var text_Ele = $('.Re');
text_Ele.on('keyup', function() {
	adjustHeight_();
});

function adjustHeight_(){
	var textEle = $('.Re');

	textEle[0].style.height = 'auto';
	
	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight);
	textEle.css('overflow', 'hidden');
}

/* 답글 높이 조절 */
var textEle_ = $('.reply_content_form_text_');
textEle_.on('keyup', function() {
	adjust_Height(obj);
});

function adjust_Height(obj){
	var textEle = $('.reply_content_form_text_'+obj);
	var textSize = $(".reply_input_");
	var formSize = $(".reply_Frm");
	
	textEle[0].style.height = 'auto';

	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight);
	textEle.css('overflow', 'hidden');
	textSize.css('height', textEleHeight);
	formSize.css('height', textEleHeight);
}

/* 댓글 위치 이동 */
function focusOn(){
	$(".reply_content_input_text").focus();
}
/* 본문 삭제 */
function del(){
	swal({
       text: "정말 삭제 하시겠습니까?",
       icon: "warning",
       buttons: [" 취소 ", " 확인 "],
       dangerMode: false,
	}).then((willDelete) => {
       if (willDelete) {
         document.delfrm.submit();
	   } else {
	      return;
	   }
	});
}
/* 댓글 삭제 */
function replydel(cbridx){
	swal({
       text: "정말 삭제 하시겠습니까?",
       icon: "warning",
       buttons: [" 취소 ", " 확인 "],
       dangerMode: false,
	}).then((willDelete) => {
       if (willDelete) {
         var form = $("#replydelfrm"+cbridx);
		 var formdata = form.serialize();
		
		 $.ajax({
			 url : contextPath+"/reply/delete",
			 type : "post",
			 data : formdata,
			 success : function(data){
				 location.reload();
			 },
			 error : function(data){
				 console.log("error");
			 }
		 });
	   } else {
	     return;
	   }
	});
}


/* 댓글 수정 */
function replymodify(cbridx, img){
	var p = $(".reply_item_content"+cbridx);
	var content = $(".reply_item_content_content"+cbridx).text();
	var contents = "<form id='RereplyFrm' name='RereplyFrm' method='post'>"
				+ "<input type='hidden' name='cbridx' value="+cbridx+">"
				+ "<div class='reply_writer'>"
				+ "<img class='reply_item_content_writer_image' src='"+contextPath+"/image/"+img+"'></div>"
				+ "<textarea name='content' class='Re' onkeyup='adjustHeight_()'>"+content+"</textarea>"
				+ "<div class='mfdel_'><button type='button' class='Rereply_submit' onclick='Resubmit()'>등록</button>"
				+ "<button type='button' onclick='Recancle()'>취소</button></div>"
				+ "</form>";		
	p.html(contents);
	$(".reply_item_footer"+cbridx).css("display", "none");
	var textEleHeight = $(".Re").prop('scrollHeight');
	$(".Re").css("height", textEleHeight);
	$(".Re").css("overflow", "hidden");
	p.css("width", "100%");
}

/* 댓글 복구 */
function replyRedistribution(cbridx){
	
	$.ajax({
		url : contextPath+"/reply/redistribution",
		type : "post",
		data : "cbridx="+cbridx,
		success : function(result){
			console.log(result)
			if(result == "redistributionOK"){
				location.reload();
			}
		}
	});
}
/* 댓글 수정 등록 */
function Resubmit(){
	var formdata = $("form[name='RereplyFrm']").serialize();
	formdata = decodeURIComponent(formdata);
	
	$.ajax({
		url : contextPath+"/reply/modify",
		type : "post",
		data : formdata,
		success : function(data){
			location.reload();
		},
		error : function(data){
			console.log("error");
		}
	});
	
}
/* 댓글 수정 취소 */
function Recancle(){
	swal({
       text: "작성을 취소하시겠습니까?",
       icon: "warning",
       buttons: [" 취소 ", " 확인 "],
       dangerMode: false,
	}).then((willDelete) => {
       if (willDelete) {
         location.reload();
	   } else {
	      return;
	   }
	});
}

/* 비로그인시 답글 버튼 */
function ReNot(){
	swal({
		text : "로그인 후 이용 가능합니다.",
		button : "확인",
		closeOnClickOutside : false
	}).then(function(){
		location.href = contextPath+"/login/login.do"
	});
}

/* 답글하기 visible*/
function Re(orincbridx){
	var form = $("#reply_Frm"+orincbridx);
	var formdata = form.serialize();
	var css = $("form").not(form);
	
	form.css("display", "flex");
	css.css("display", "none");
	$("#replyFrm").css("display", "flex");
}

/* 답글 등록 */
function Reinsert(orincbridx){
	var form = $("#reply_Frm"+orincbridx);
	var formdata = form.serialize();
	formdata = decodeURIComponent(formdata);
	
	$.ajax({
		url : contextPath+"/reply/Reinsert",
		type : "post",
		data : formdata,
		success : function(data){
			location.reload();
		},
		error : function(data){
			console.log("error");
		}
	});
}

/* 댓글 작성 */
$(document).ready(function(){
	$(".reply_submit").on("click", function(){
		
		if(!$(".reply_content_input_text").val().replace(/(^\s*)|(\s*$)/gi, "")){
			swal({
				text : "내용을 입력하세요.",
				button : "확인",
				closeOnClickOutside : false
			}).then(function(){
				$(".reply_content_input_text").focus();
				return;
			});
		}else{
			var formdata = $("form[name='replyFrm']").serialize();
			$.ajax({
				url : contextPath+"/reply/write",
				type : "post",
				data : formdata,
				success : function(data){
					location.reload();
				},
				error : function(data){
					console.log("error");
				}
			});	
		}
	});
	var img = document.getElementsByTagName("img");
	$(".content_img").children().find(img).css("width", "100%");
});
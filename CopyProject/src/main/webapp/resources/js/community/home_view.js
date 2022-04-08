/* 사이드 메뉴 바 */
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
	if(confirm("정말 삭제 하시겠습니까?") == true){
		document.delfrm.submit();
	}else{
		return;
	}
	
}
/* 댓글 작성 */
$(document).ready(function(){
	
	$(".reply_submit").on("click", function(){
		
		var formdata = $("form[name='replyFrm']").serialize();
		
		$.ajax({
			url : "/controller/reply/write",
			type : "post",
			data : formdata,
			success : function(data){
				location.reload();
			},
			error : function(data){
				console.log("error");
			}
		});
	});
	
	console.log($(".time").val());
});
/* 댓글 삭제 */
function replydel(cbridx){
	if(confirm("정말 삭제하시겠습니까??") == true){
		var form = $("#replydelfrm"+cbridx);
		var formdata = form.serialize();
		
		$.ajax({
			url : "/controller/reply/delete",
			type : "post",
			data : formdata,
			success : function(data){
				location.reload();
			},
			error : function(data){
				console.log("error");
			}
		});
	}else{
		return;
	}
}


/* 댓글 수정 */
function replymodify(cbridx, img){
	var p = $(".reply_item_content"+cbridx);
	var content = $(".reply_item_content_content"+cbridx).text();
	var contents = "<form id='RereplyFrm' name='RereplyFrm' method='post'>"
				+ "<input type='hidden' name='cbridx' value="+cbridx+">"
				+ "<div class='reply_writer'>"
				+ "<img class='reply_item_content_writer_image' src='/controller/image/"+img+"'></div>"
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
/* 댓글 수정 등록 */
function Resubmit(){
	var formdata = $("form[name='RereplyFrm']").serialize();
	formdata = decodeURIComponent(formdata);
	
	$.ajax({
		url : "/controller/reply/modify",
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
	if(confirm("작성을 취소하시겠습니까?") == true){
		location.reload();
	}else{
		return;
	}
}

/* 비로그인시 답글 버튼 */
function ReNot(){
	alert("로그인 후 이용 가능합니다.");
	location.href = "/controller/login/login.do"
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
	console.log(formdata);
	
	$.ajax({
		url : "/controller/reply/Reinsert",
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


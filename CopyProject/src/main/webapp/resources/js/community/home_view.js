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

function adjustHeight() {
	var textEle = $('textarea');
	var textSize = $("#replyFrm");
	textEle[0].style.height = 'auto';
	textSize[0].style.height = 'auto';
	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight);
	textEle.css('overflow', 'hidden');
	textSize.css('height', textEleHeight);
	
};

var textEle = $('textarea');
textEle.on('keyup', function() {
	adjustHeight();
});
function focusOn(){
	$("#reply_text").focus();
}
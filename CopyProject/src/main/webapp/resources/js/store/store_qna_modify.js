function submitFn(){
	var result = true;


	value = document.getElementById("reviewContents").value;
	info = document.getElementById("contentInfo");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
	}else{
		info.style.visibility = "hidden";
	}
	
	
	if(result){
		
		var content =$("#reviewContents").val();
		content = content.replace(/(\n|\r\n)/g,'<br>');
		
		$.ajax({
			type : "POST",
			url : "store_qna_modify.do",
			data : "content="+content+"&sqidx="+sqidx,
			success : function(res) {
				
				console.log(res);
				if(res>0){
					alert("상품문의가 수정되었습니다.");
					location.href="store_view.do?spidx="+spidx;
				}else{
					alert("실행오류");
				}
			}
		});
	}
	
	
}

function resize(obj) {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
}
function cancelFn(){
	var isCancel = confirm("이 페이지를 나가면 수정된 사항이 모두 유실됩니다! 그래도 나가시겠어요?");
	if(isCancel){
		location.href = "store_view.do?spidx="+spidx;
	}
}
/* 이미지 업로드 */

function adjustHeight() {
	var textEle = $(".note-editable");
	textEle[0].style.height = 'auto';
	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight);
	textEle.css('overflow', 'hidden');
};

var textEle = $(".note-editable");
textEle.on('keyup', function() {
	adjustHeight();
});


function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$("#imgArea").css("background-color", "none");
			$("#coverImg").attr("src", e.target.result);
			$("#coverImg").show();
			$("#imgArea img").css("width", "100%");
			$("#imgArea img").css("height", "100%");
			$("#imgText").css("display", "none");
			$("#imgButton").css("display", "none");
		}
		reader.readAsDataURL(input.files[0]);
	}
}

$(function() {
	$("#imgUpload").on("change", function(){
	readURL(this);
	});
});



$(document).ready(function() {
	
	
	$("#reviewContents").val(content);
	
	
});
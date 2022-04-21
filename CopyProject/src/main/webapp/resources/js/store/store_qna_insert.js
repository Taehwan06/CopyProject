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
			url : "store_qna_insert.do",
			data : "content="+content+"&spidx="+spidx,
			success : function(res) {
				
				console.log(res);
				if(res>0){
					swal({
				         text: "상품문의가 등록되었습니다.",
				         button: "확인",
				         closeOnClickOutside : false
				      }).then(function(){
				         location.href="store_view.do?spidx="+spidx;
				      });
					
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
		location.href = "home_list.do"
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
	
	$('#summernote').summernote({ 
		minHeight: 300,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '내용을 입력해주세요.',	//placeholder 설정
		
		 toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough']],
			    ['color', ['forecolor','color']],
			    ['para', ['paragraph']],
			    ['height', ['height']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

	});
	
	
});
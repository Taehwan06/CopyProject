function submitFn(){
	var result = true;

	value = document.getElementById("title").value;
	info = document.getElementById("titleInfo");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
	}else{
		info.style.visibility = "hidden";
	}
	
	value = document.getElementById("summernote").value;
	info = document.getElementById("contentInfo");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
	}else{
		info.style.visibility = "hidden";
	}
	
	if(result){
		document.updateFrm.submit();
	}
	
	
}

function cancelFn(cbidx, midx){
	swal({
       text: "이 페이지를 나가면 수정된 사항이 모두 유실됩니다!\n 그래도 나가시겠어요?",
       icon: "warning",
       buttons: [" 취소 ", " 확인 "],
       dangerMode: false,
	}).then((willDelete) => {
       if (willDelete) {
         location.href='home_view.do?cbidx='+cbidx+'&fmidx='+midx+'&nowPage=1';
	   } else {
	      return
	   }
	});
}

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

$(document).ready(function() {
	
	$('#summernote').summernote({
		width : 750,
		maxWidth : 750, 
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
			    ['height', ['height']],
			    ['insert',['picture']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks: {
			onImageUpload: function(image) {
				var file = image[0];
				var reader = new FileReader();
				reader.onloadend = function() {
					var image = $('<img>').attr('src',  reader.result);
					image.attr('width','100%');
					$('#summernote').summernote("insertNode", image[0]);
				}
				reader.readAsDataURL(file);
			}
		}
	});
	
	var img = document.getElementsByTagName("img");
	$(".note-editable").children().find(img).css("width", "100%")
	
	
	$(".note-editor").css({"width" : "auto", "max-width" : "750px" , "min-width" : "500px"});
});
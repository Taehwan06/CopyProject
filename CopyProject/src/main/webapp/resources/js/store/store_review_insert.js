function submitFn(){
	var result = true;

	
	var value = document.getElementById("reviewContents").value;
	var info = document.getElementById("contentInfo");
	if(value == ""){
		result = false;
		info.style.display = "inline";
	}else{
		info.style.display = "none";
	}
	
	
	var starck = $('input:radio[name="score"]').is(':checked');
	info = document.getElementById("starInfo");
	if(!starck){
		result = false;
		info.style.display = "inline";
	}else{
		info.style.display = "none";
	}
	
	if(result){
		var img_style = $("#imgArea").attr("style");
		/*img_style= img_style.replace(/&/g,"%26");*/
		console.log(img_style);
		if(img_style != "" && img_style != null){
			img_style= img_style.replace(/\+/g,"%2B");
		}
		/*img_style= img_style.replace(/=/g,"%3D");*/
		/*
		console.log($("#insertFrm").serialize());*/
		var content =$("#reviewContents").val();
		content = content.replace(/(<br>|<brV>|<br V>)/g,'\r\n');
		var score = $("input:radio[name='score']:checked").val( );
		$.ajax({
			type : "POST",
			url : "store_review_insert.do",
			data : "content="+content+"&score="+score+"&img_style="+img_style+"&spidx="+spidx,
			success : function(res) {
				
				console.log(res);
				if(res>0){
					alert("리뷰가 등록되었습니다.");
					location.href="store_view.do?spidx="+spidx;
				}else{
					alert("실행오류");
				}
			}
		});
	}
}

function readURL(input) {
	let regex = new RegExp("(.*?)\.(jpg|png|webp|jfif|bmp|rle|dib|gif|tif|tiff|raw)$");
	
	var fileValue = document.getElementById("imgUpload").value;
	
	var fileNameAry = fileValue.split("\\");
	var fileNameBe = fileNameAry[2];
	var fileName = fileNameBe.toLowerCase();
	
	if(regex.test(fileName)){
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$("#imgArea").css("background-color", "none");
				$("#imgArea").css("background-image", "url('"+e.target.result+"')");
				$("#imgText").css("display", "none");
				$("#imgButton").css("display", "none");
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
}
function resize(obj) {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
}

$(function() {
	$("#imgUpload").on("change", function(){
		
		var form = $("#uploadForm")[0];
	    var formData = new FormData(form);
	    
	    $.ajax({
			url: "/controller/mypage/fileUpload",
			type: "post",
			data: formData,
			enctype: "multipart/form-data",
			contentType: false,
			processData: false,
			success: function(data){
				var result = data.trim();
				
				if(result == "fail1"){
					alert("이미지 파일만 등록할 수 있습니다");
					
				}else if(result == "fail2"){
					alert("이미지 변경에 실패했습니다");
					
				}else if(result == "fail3"){
					alert("변경할 이미지를 선택해 주세요");
					
				}else{
					var resultAry = result.split(",")
					var profile_origin = resultAry[0];
					var profile_system = resultAry[1];
					
					$("#profile_origin").val(profile_origin);
					$("#profile_system").val(profile_system);
				
				}
			}
	    });
	    readURL(this);
	});
});

function cancelFn(){
   var isCancel = confirm("이 페이지를 나가면 수정된 사항이 모두 유실됩니다! 그래도 나가시겠어요?");
   if(isCancel){
      location.href = "store_view.do?spidx="+spidx;
   }
}

function readURL(input) {
	let regex = new RegExp("(.*?)\.(jpg|png|webp|jfif|bmp|rle|dib|gif|tif|tiff|raw)$");
	
	var fileValue = document.getElementById("imgUpload").value;
	
	var fileNameAry = fileValue.split("\\");
	var fileNameBe = fileNameAry[2];
	var fileName = fileNameBe.toLowerCase();
	
	if(regex.test(fileName)){
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$("#imgArea").css("background-color", "none");
				$("#imgArea").css("background-image", "url('"+e.target.result+"')");
				$("#imgText").css("display", "none");
				$("#imgButton").css("display", "none");
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
}
//textarea크기 자동조절
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
      minHeight: 300,             // 최소 높이
      maxHeight: null,             // 최대 높이
      focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
      lang: "ko-KR",               // 한글 설정
      placeholder: '내용을 입력해주세요.',   //placeholder 설정
      
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
         fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

   });

	
	  
});

function submitFn(){
	var result = true;

	var value = document.getElementById("imgUpload").value;
	var info = document.getElementById("imgUploadInfo");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
	}else{
		info.style.visibility = "hidden";
	}

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
		document.insertFrm.submit();
	}
	
	
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
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

	});
	
	$("input[type=file]").on("change", function(e){
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: 'uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	datatype : 'json',
	    	success : function(data){
				var fileName = null;
				var uploadPath = null;
				var uuid = null
				var orinfilename = $("#img_origin");
				var uploadfilename = $("#img_system");
				console.log(data);
				$.each(data, function() { 
				    fileName = this["fileName"];
				
				    uploadPath = this["uploadPath"].replace(/\\/g, '/');
				    
				    uuid = this["uuid"]
				});
				var filePath = uploadPath + "/" + uuid + "_" + fileName;

			    
				ornval = orinfilename.val(fileName);
				upload = uploadfilename.val(filePath);
			},
			error : function(data){
				alert("이미지 파일이 아닙니다.");
			}
		});
		
	});
	
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png|webp|PNG|jfif)$");
	let maxSize = 10485760; //10MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
});
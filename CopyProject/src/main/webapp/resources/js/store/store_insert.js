//카테고리 선택시 해당하는 디테일 select박스 보이기
function selectFn(obj){
	var detail1 = document.getElementById("detailArea1");
	var detail2 = document.getElementById("detailArea2");
	var detail3 = document.getElementById("detailArea3");
	var detail4 = document.getElementById("detailArea4");
	var detail5 = document.getElementById("detailArea5");
	var detail6 = document.getElementById("detailArea6");
	
	if(obj.value == "10"){
		detail1.style.display = "inline-block";
		detail2.style.display = "none";
		detail3.style.display = "none";
		detail4.style.display = "none";
		detail5.style.display = "none";
		detail6.style.display = "none";
	}else if(obj.value == "20"){
		detail1.style.display = "none";
		detail2.style.display = "inline-block";
		detail3.style.display = "none";
		detail4.style.display = "none";
		detail5.style.display = "none";
		detail6.style.display = "none";
	}else if(obj.value == "30"){
		detail1.style.display = "none";
		detail2.style.display = "none";
		detail3.style.display = "inline-block";
		detail4.style.display = "none";
		detail5.style.display = "none";
		detail6.style.display = "none";
	}else if(obj.value == "40"){
		detail1.style.display = "none";
		detail2.style.display = "none";
		detail3.style.display = "none";
		detail4.style.display = "inline-block";
		detail5.style.display = "none";
		detail6.style.display = "none";
	}else if(obj.value == "50"){
		detail1.style.display = "none";
		detail2.style.display = "none";
		detail3.style.display = "none";
		detail4.style.display = "none";
		detail5.style.display = "inline-block";
		detail6.style.display = "none";
	}else if(obj.value == "60"){
		detail1.style.display = "none";
		detail2.style.display = "none";
		detail3.style.display = "none";
		detail4.style.display = "none";
		detail5.style.display = "none";
		detail6.style.display = "inline-block";
	}else{
		detail1.style.display = "none";
		detail2.style.display = "none";
		detail3.style.display = "none";
		detail4.style.display = "none";
		detail5.style.display = "none";
		detail6.style.display = "none";
	}
}
//배달비 설정시 금액설정 보이기
function selectFn2(obj){
	var deliveryChargeArea = document.getElementById("deliveryChargeArea");
	
	if(obj.value == "N"){
		deliveryChargeArea.style.display = "inline-block";
	}else{
		deliveryChargeArea.style.display = "none";			
	}
}


function submitFn(){
	console.log($("#title").val());
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
	
	value = document.getElementById("productName").value;
	info = document.getElementById("productNameInfo");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
	}else{
		info.style.visibility = "hidden";
	}
	
	value = document.getElementById("originPrice").value;
	info = document.getElementById("originPriceInfo");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
	}else{
		info.style.visibility = "hidden";
	}
	
	value = document.getElementById("salePrice").value;
	info = document.getElementById("salePriceInfo");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
	}else{
		info.style.visibility = "hidden";
	}
	
	value = document.getElementById("discount").value;
	info = document.getElementById("discountInfo");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
	}else{
		info.style.visibility = "hidden";
	}
	
	value = document.getElementById("freeDelivery").value;
	info = document.getElementById("freeDeliveryInfo");
	value2 = document.getElementById("deliveryCharge").value;
	info2 = document.getElementById("deliveryChargeInfo");
	if(value == "0"){
		result = false;
		info.style.visibility = "visible";
	}else if(value == "N"){
		if(value2 == ""){
			result = false;
			info2.style.visibility = "visible";
			info.style.visibility = "hidden";
		}else{
			info2.style.visibility = "hidden";
			info.style.visibility = "hidden";
		}
	}else{
		info.style.visibility = "hidden";
	}
	
	//디테일값 미설정시 resul=false주어 submit버튼 비활성화
	//id값이 아닌 클래스를 주어 좀더 짧게 구현할것
	//아니면 따로 변수를 두어 변수값으로 조회할것
	value = document.getElementById("categorySelect").value;
	info = document.getElementById("categorySelectInfo");
	valueD1 = document.getElementById("detailSelect1").value;
	infoD1 = document.getElementById("detailSelect1Info");
	valueD2 = document.getElementById("detailSelect2").value;
	infoD2 = document.getElementById("detailSelect2Info");
	valueD3 = document.getElementById("detailSelect3").value;
	infoD3 = document.getElementById("detailSelect3Info");
	valueD4 = document.getElementById("detailSelect4").value;
	infoD4 = document.getElementById("detailSelect4Info");
	valueD5 = document.getElementById("detailSelect5").value;
	infoD5 = document.getElementById("detailSelect5Info");
	valueD6 = document.getElementById("detailSelect6").value;
	infoD6 = document.getElementById("detailSelect6Info");
	
	if(value == "0"){
		result = false;
		info.style.visibility = "visible";
	}else if(value == "10"){
		info.style.visibility = "hidden";
		if(valueD1 == "0"){
			result = false;
			infoD1.style.visibility = "visible";
		}else{
			infoD1.style.visibility = "hidden";
		}
	}else if(value == "20"){
		info.style.visibility = "hidden";
		if(valueD2 == "0"){
			result = false;
			infoD2.style.visibility = "visible";
		}else{
			infoD2.style.visibility = "hidden";
		}
	}else if(value == "30"){
		info.style.visibility = "hidden";
		if(valueD3 == "0"){
			result = false;
			infoD3.style.visibility = "visible";
		}else{
			infoD3.style.visibility = "hidden";
		}
	}else if(value == "40"){
		info.style.visibility = "hidden";
		if(valueD4 == "0"){
			result = false;
			infoD4.style.visibility = "visible";
		}else{
			infoD4.style.visibility = "hidden";
		}
	}else if(value == "50"){
		info.style.visibility = "hidden";
		if(valueD5 == "0"){
			result = false;
			infoD5.style.visibility = "visible";
		}else{
			infoD5.style.visibility = "hidden";
		}
	}else if(value == "60"){
		info.style.visibility = "hidden";
		if(valueD6 == "0"){
			result = false;
			infoD6.style.visibility = "visible";
		}else{
			infoD6.style.visibility = "hidden";
		}
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
		/*var img_style = $("#imgArea").attr("style");*/
		/*img_style= img_style.replace(/&/g,"%26");*/
		/*img_style= img_style.replace(/\+/g,"%2B");*/
		/*img_style= img_style.replace(/=/g,"%3D");*/
		/*
		console.log($("#insertFrm").serialize());*/
		
		document.insertFrm.submit();
		/*$.ajax({
			type : "POST",
			url : "store_insert.do",
			data : $("#insertFrm").serialize(),
			success : function(res) {
				
				console.log(res);
				if(res>0){
					alert("상품이 등록되었습니다.");
					location.href="store_view.do?spidx="+res;
				}else{
					alert("실행오류");
				}
			}
		});*/
	}
}



//이건 왜둔거지
//페이지 로드 펑션 안쓰고 이런식으로도 되네
$(function() {
	//이미지 업로드
	$("#imgUpload").on("change", function(){
		
		var form = $("#uploadForm")[0];
	    var formData = new FormData(form);
	    
	    $.ajax({
			url: "fileUpload",
			type: "post",
			data: formData,
			enctype: "multipart/form-data",
			contentType: false,
			processData: false,
			success: function(data){
				var result = data.trim();
				
				if(result == "fail1"){
					swal({
				         text: "이미지 파일만 등록할 수 있습니다.",
				         button: "확인",
				         closeOnClickOutside : false
				      }).then(function(){
				         
				      });
					
				}else if(result == "fail2"){
					swal({
				         text: "이미지 변경에 실패했습니다.",
				         button: "확인",
				         closeOnClickOutside : false
				      }).then(function(){
				        
				      });
					
				}else if(result == "fail3"){
					aswal({
				         text: "변경할 이미지를 선택해 주세요.",
				         button: "확인",
				         closeOnClickOutside : false
				      }).then(function(){
				        
				      });
					
				}else{
					var resultAry = result.split(",")
					var img_origin = resultAry[0];
					var img_system = resultAry[1];
					
					$("#img_origin").val(img_origin);
					$("#img_system").val(img_system);
				
				}
			}
	    });
	    readURL(this);
	});
});

//이미지 등록시 화면노출
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

//취소버튼
function cancelFn(){
   swal({
	      text: "이 페이지를 나가면 수정된 사항이 모두 유실됩니다!\n그래도 나가시겠어요?",
	      icon: "warning",
	      buttons: [" 취소 ", " 확인 "],
	      dangerMode: false,
	   })
	   .then((willDelete) => {
		      if (willDelete) {
		         location.href = "store.do"
		   } else {
		      
		   }
		});
}

//content영역 내용작성시 보이는 크기 변화
var textEle = $(".note-editable");
textEle.on('keyup', function() {
   adjustHeight();
});

function adjustHeight() {
   var textEle = $(".note-editable");
   textEle[0].style.height = 'auto';
   var textEleHeight = textEle.prop('scrollHeight');
   textEle.css('height', textEleHeight);
   textEle.css('overflow', 'hidden');
};
//




//페이지가 로딩된 후 동작
$(document).ready(function() {
	
	$('#summernote').summernote({
      width : 750,
      maxWidth : 750, 
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

	//썸머노트 반응형
    $(".note-editor").css({"width" : "auto", "max-width" : "100%" , "min-width" : "500px"});

	
	//디테일값 등록
	$(".detailSelect").on("change",function(){
		var detail = $(this).val();
		$("#detail").val(detail);
	});
	  
});



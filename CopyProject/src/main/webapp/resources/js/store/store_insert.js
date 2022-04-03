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
	
function selectFn2(obj){
	var deliveryChargeArea = document.getElementById("deliveryChargeArea");
	
	if(obj.value == "N"){
		deliveryChargeArea.style.display = "inline-block";
	}else{
		deliveryChargeArea.style.display = "none";			
	}
}


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
		var img_style = $("#imgArea").attr("style");
		/*img_style= img_style.replace(/&/g,"%26");*/
		img_style= img_style.replace(/\+/g,"%2B");
		/*img_style= img_style.replace(/=/g,"%3D");*/
		/*
		console.log($("#insertFrm").serialize());*/
		$.ajax({
			type : "POST",
			url : "store_insert.do",
			data : $("#insertFrm").serialize()+"&img_style="+img_style,
			success : function(res) {
				
				console.log(res);
				if(res>0){
					alert("상품이 장바구니에 담겼습니다.");
					location.href="store.do";
				}else{
					alert("실행오류");
				}
			}
		});
	}
}

$(function() {
	$("#imgUpload").on("change", function(){
	readURL(this);
	});
});
function readURL(input) {
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

function cancelFn(){
   var isCancel = confirm("이 페이지를 나가면 수정된 사항이 모두 유실됩니다! 그래도 나가시겠어요?");
   if(isCancel){
      location.href = "store.do"
   }
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

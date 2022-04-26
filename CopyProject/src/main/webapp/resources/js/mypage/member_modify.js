function impossible(type){

	var span = document.getElementById("impossibleSpan");
	var span2 = document.getElementById("impossibleSpan2");
	
	if(type == 'email'){
		span.style.color = "red";	
		span.style.visibility = "visible";
			
	}else if(type == 'birth'){
		span2.style.color = "red";	
		span2.style.visibility = "visible";
		
	}

}

function guide(type){
	var guideSpan = document.getElementById("guideSpan");
	var guideSpan2 = document.getElementById("guideSpan2");
	
	var nickInput = document.getElementById("nickInput").value;
	var phone2 = document.getElementById("phone2").value;
	var phone3 = document.getElementById("phone3").value;
	
	if(type == 'nickname'){
		if(nickInput.length > 20){
			guideSpan.innerHTML = "20자리 이하로 입력하세요";
			guideSpan.style.color = "red";
			guideSpan.style.visibility = "visible";	
		}else{
			guideSpan.style.visibility = "hidden";
		}
		
	}else if(type == 'phone'){
		if((phone2.length <4) || (phone3.length <4)){
			guideSpan2.innerHTML = "4자리만 입력할 수 있습니다";
			guideSpan2.style.color = "red";
			guideSpan2.style.visibility = "visible";
		}else if((phone2.length == 4) && (phone3.length == 4)){
			guideSpan2.style.visibility = "hidden";
		}
		
		
	}
	
	
}

function checkForm() {
	var nickInput = document.getElementById("nickInput").value;
	var phone2 = document.getElementById("phone2").value;
	var phone3 = document.getElementById("phone3").value;
	var fileVal = document.getElementById("imgUpload").value;
	var prevImg = document.getElementById("profile_prev").value;
	
	let phone_val =  /^[0-9]+$/; 
	let nick_val = /[가-힣0-9a-zA-Z]{1,20}$/;
	
	if(fileVal == '' || fileVal == null){
		if(prevImg == '' || prevImg == null){
			$("#profile_origin").val("kakao_profile_basic.png");
			$("#profile_system").val("kakao_profile_basic.png");
		}else{
			$("#profile_origin").val(prevImg);
			$("#profile_system").val(prevImg);
		}
	}
	
	if(nickInput == '' || phone2 == '' ||phone3 == ''){
		
		swal({
         text: "값을 입력하세요.",
         button: "확인",
         closeOnClickOutside : false
     	 }).then(function(){
         
    			 });
		//alert("값을 입력하세요");
		//return false;
		
	}else if(!phone_val.test(phone2)||!phone_val.test(phone3)||!nick_val.test(nickInput)){
		swal({
         text: "입력형식이 맞지 않습니다",
         button: "확인",
         closeOnClickOutside : false
     	 }).then(function(){
         
    			 });
		//alert("입력형식이 맞지 않습니다");
		
	}else{
		swal({
         text: "회원정보가 수정되었습니다",
         button: "확인",
         closeOnClickOutside : false
     	 }).then(function(){
         
         			document.memberModifyFrm.method = "post";
					document.memberModifyFrm.action = "member_modify.do";
					document.memberModifyFrm.submit();
			         
         
    			 });
		
		
		//alert("회원정보가 수정되었습니다");
		//return ture;
		
		
	}
	
}
	
/* 이미지 업로드 */


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
				$("#coverImg").attr("src", e.target.result);
				$("#coverImg").css("width", "180px");
				$("#coverImg").css("height", "auto");
			}
			reader.readAsDataURL(input.files[0]);
		}
	}else{
		$("#coverImg").attr("src", contextPath+"/image/kakao_profile_basic.png");
		$("#coverImg").css("width", "180px");
		$("#coverImg").css("height", "auto");
	}
}

function imgValCheckFn(){
	var fileValue = document.getElementById("imgUpload").value;
    
    console.log("fileValue="+fileValue);
    
    if(fileValue == "" || fileValue == null){
    	$("#coverImg").attr("src", contextPath+"/image/kakao_profile_basic.png");
		$("#coverImg").css("width", "180px");
		$("#coverImg").css("height", "auto");
    }
}

$(function() {
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
			         text: "이미지 파일만 등록할 수 있습니다",
			         button: "확인",
			         closeOnClickOutside : false
			     	 }).then(function(){
			         
			    			 });
					
					//alert("이미지 파일만 등록할 수 있습니다");
					
				}else if(result == "fail2"){
					
					swal({
			         text: "이미지 변경에 실패했습니다",
			         button: "확인",
			         closeOnClickOutside : false
			     	 }).then(function(){
				
					         $("#coverImg").attr("src", contextPath+"/image/kakao_profile_basic.png");
							 $("#coverImg").css("width", "180px");
							 $("#coverImg").css("height", "auto");
					         
			         
			    			 });
					
					
					//alert("이미지 변경에 실패했습니다");
					
					
				}else if(result == "fail3"){
					
					swal({
			         text: "변경할 이미지를 선택해 주세요",
			         button: "확인",
			         closeOnClickOutside : false
			     	 }).then(function(){
			         
			    			 });
					
					//alert("변경할 이미지를 선택해 주세요");
					
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
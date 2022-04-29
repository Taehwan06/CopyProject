/* 전역 변수 */
var idcheck = false;
var emailCheck = false;
var ph1Reg = /\d{2,3}/;
var ph2Reg = /\d{3,4}/;
var ph3Reg = /\d{4}/;
var bir1Reg = /^\d{4}/;
var bir2Reg = /^\d{1,2}/;
var bir3Reg = /^\d{1,2}/;
var spaceReg = /^\s/g;
//var emailCheck = false;
//var phoneCk = false;

var phReg = /^\d{10,11}/;

/* 유효성 검사 */
/* ============================================================== */
function onBlurFn(obj){
	var value = obj.value;
	var id = obj.id;
	var parent = obj.parentElement;
	var reg = "";
	var pwdValue = document.getElementById("pwd").value;
	var ph1Val = document.getElementById("phone1").value;
	var ph2Val = document.getElementById("phone2").value;
	var ph3Val = document.getElementById("phone3").value;
	var bir1Val = document.getElementById("birth1").value;
	var bir2Val = document.getElementById("birth2").value;
	var bir3Val = document.getElementById("birth3").value;
	
	if(id =="id"){
		reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var info = document.getElementById("idFoot");
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "이메일 주소를 입력하세요";
			info.style.color = "red";
		}else if(!reg.test(value)){
			info.style.visibility = "visible";
			info.textContent = "이메일 주소 형식이 올바르지 않습니다";
			info.style.color = "red";
		}else{
			info.style.visibility = "visible";
			info.textContent = "올바르게 입력하셨습니다";
			info.style.color = "green";
		}
	}else if(id =="emailcheck"){
		info = document.getElementById("emailFoot");
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "이메일 인증을 해주세요";
			info.style.color = "red";
		}else{
			info.style.visibility = "hidden";
			info.textContent = "";
			info.style.color = "green";
		}
	}else if(id =="pwd"){
		info = document.getElementById("pwdFoot");
		reg = /(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,20}$/;
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "비밀번호를 입력하세요";
			info.style.color = "red";
		}else if(!reg.test(value)){
			info.style.visibility = "visible";
			info.textContent = "영문,숫자,특수문자를 모두 포함한 6~20자리만 가능합니다";
			info.style.color = "red";
		}else{
			info.style.visibility = "visible";
			info.textContent = "사용 가능한 비밀번호입니다";
			info.style.color = "green";
		}
	}else if(id =="pwdcheck"){
		info = document.getElementById("pwdcheckFoot");
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "비밀번호를 다시 입력하세요";
			info.style.color = "red";
		}else if(value != pwdValue){
			info.style.visibility = "visible";
			info.textContent = "비밀번호가 다릅니다";
			info.style.color = "red";
		}else{
			info.style.visibility = "visible";
			info.textContent = "비밀번호가 일치합니다";
			info.style.color = "green";
		}
	}else if(id =="name"){
		info = document.getElementById("nameFoot");
		reg = /^[가-힣]{2,20}$/;
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "이름을 입력하세요";
			info.style.color = "red";
		}else if(!reg.test(value)){
			info.style.visibility = "visible";
			info.textContent = "2~20자 한글만 입력 가능합니다";
			info.style.color = "red";
		}else{
			info.style.visibility = "visible";
			info.textContent = "올바르게 입력하셨습니다";
			info.style.color = "green";
		}
	}else if(id =="nick"){
		info = document.getElementById("nickFoot");
		reg = /^[가-힣0-9a-zA-Z]{1,20}$/;
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "닉네임을 입력하세요";
			info.style.color = "red";
		}else if(!reg.test(value)){
			info.style.visibility = "visible";
			info.textContent = "1~20자 한글,숫자,영문만 입력 가능합니다";
			info.style.color = "red";
		}else{
			info.style.visibility = "visible";
			info.textContent = "올바르게 입력하셨습니다";
			info.style.color = "green";
		}
	}else if(id =="gender"){
		info = document.getElementById("genderFoot");
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "성별을 입력하세요";
			info.style.color = "red";
		}else{
			info.style.visibility = "visible";
			info.textContent = "올바르게 입력하셨습니다";
			info.style.color = "green";
		}
	}
	
	if(id =="sample2_postcode"){
		info = document.getElementById("addrFoot");
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "우편번호 찾기를 이용해주세요";
			info.style.color = "red";
		}else{
			info.style.visibility = "hidden";
			info.style.color = "green";
		}
	}
	if(id =="sample2_address"){
		info = document.getElementById("addrFoot");
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "우편번호 찾기를 이용해주세요";
			info.style.color = "red";
		}else{
			info.style.visibility = "hidden";
			info.style.color = "green";
		}
	}
	if(id =="sample2_detailAddress"){
		info = document.getElementById("addrFoot");
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "주소를 입력해주세요";
			info.style.color = "red";
		}else{
			info.style.visibility = "hidden";
			info.style.color = "green";
		}
	}
	
	if(id =="phone1"){
		info = document.getElementById("phoneFoot");
		if(ph1Reg.test(ph1Val) && ph2Reg.test(ph2Val) && ph3Reg.test(ph3Val)){
			info.style.visibility = "visible";
			info.textContent = "올바르게 입력하셨습니다";
			info.style.color = "green";
		}else{
			info.style.visibility = "visible";
			info.textContent = "연락처를 올바르게 입력해주세요";
			info.style.color = "red";
		}
	}
	if(id =="phone2"){
		info = document.getElementById("phoneFoot");
		if(ph1Reg.test(ph1Val) && ph2Reg.test(ph2Val) && ph3Reg.test(ph3Val)){
			info.style.visibility = "visible";
			info.textContent = "올바르게 입력하셨습니다";
			info.style.color = "green";
		}else{
			info.style.visibility = "visible";
			info.textContent = "연락처를 올바르게 입력해주세요";
			info.style.color = "red";
		}
	}
	if(id =="phone3"){
		info = document.getElementById("phoneFoot");
		if(ph1Reg.test(ph1Val) && ph2Reg.test(ph2Val) && ph3Reg.test(ph3Val)){
			info.style.visibility = "visible";
			info.textContent = "올바르게 입력하셨습니다";
			info.style.color = "green";
		}else{
			info.style.visibility = "visible";
			info.textContent = "연락처를 올바르게 입력해주세요";
			info.style.color = "red";				
		}
	}
	
/*    생년월일 유효성 검사     =========================================================================== */
/* =================================================================================================== */
/* =================================================================================================== */
	var checkYear = /^[0-9]{4}/g;
	var checkDate = /\d{1,2}/;
         
         
	if(id =="birth1"){
	    var span = $("#birthFoot");
	    var yyVal = document.getElementById("birth1").value;
	    var mmVal = document.getElementById("birth2").value;
	    var ddVal = document.getElementById("birth3").value;
    
	    if(yyVal == "" || yyVal == null || parseInt(yyVal) < 1900 || parseInt(yyVal) > 2022){
			span.text("태어난 년도 4자리를 정확하게 입력하세요.");
			span.css({"color" : "red", "visibility" : "visible"});
	    }else if(!checkYear.test(yyVal)){
			span.text("태어난 년도 4자리를 정확하게 입력하세요.");
			span.css({"color" : "red", "visibility" : "visible"});
		}else{
			if(mmVal == "00" || mmVal == "0" || mmVal == "" || mmVal == null || parseInt(mmVal) > 12){
				span.text("태어난 월을 정확하게 입력하세요.");
				span.css({"color" : "red", "visibility" : "visible"});
			}else{
				if(ddVal == "0" || ddVal == "00" || ddVal == "" || ddVal == null){
					span.text("생년월일을 다시 확인해주세요.");
					span.css({"color" : "red", "visibility" : "visible"});
				}else if(ddVal == ""){
					span.text("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
					span.css({"color" : "red", "visibility" : "visible"});
				}else{
					if(mmVal == "01" || mmVal == "03" || mmVal == "05" || mmVal == "07" || mmVal == "08" || mmVal == "10" || mmVal == "12"
						|| mmVal == "1" || mmVal == "3" || mmVal == "5" || mmVal == "7" || mmVal == "8" ){
						if(parseInt(ddVal) <= 31){
							span.text("");
							span.css({"visibility" : "hidden"});
						}else{
							span.text("생년월일을 다시 확인해주세요.");
							span.css({"color" : "red", "visibility" : "visible"});
						}
					}else if(mmVal == "02" || mmVal == "2"){
						if(parseInt(yyVal)%4 == 0){
							if(parseInt(ddVal) <= 29){
								span.text("");
								span.css({"visibility" : "hidden"});
							}else{
								span.text("생년월일을 다시 확인해주세요.");
								span.css({"color" : "red", "visibility" : "visible"});
							}
						}else{
							if(parseInt(ddVal) <= 28){
								span.text("");
								span.css({"visibility" : "hidden"});
							}else{
								span.text("생년월일을 다시 확인해주세요.");
								span.css({"color" : "red", "visibility" : "visible"});
							}
						}
					}else{
						if(parseInt(ddVal) <= 30){
							span.text("");
							span.css({"visibility" : "hidden"});
						}else{
							span.text("생년월일을 다시 확인해주세요.");
							span.css({"color" : "red", "visibility" : "visible"});
						}
					}
				}
			}
		}
	}
	
	
	if(id == "birth2"){
		var span = $("#birthFoot");
	    var yyVal = document.getElementById("birth1").value;
	    var mmVal = document.getElementById("birth2").value;
	    var ddVal = document.getElementById("birth3").value;
		
		
		if(mmVal == "00" || mmVal == "0" || mmVal == "" || mmVal == null || parseInt(mmVal) > 12){
			span.text("태어난 월을 정확하게 입력하세요.");
			span.css({"color" : "red", "visibility" : "visible"});
	    }else if(mmVal != "00" && mmVal != "0" && mmVal != "" && mmVal != null){
			if(yyVal == "" || yyVal == null || parseInt(yyVal) < 1900 || parseInt(yyVal) > 2022){
				span.text("태어난 년도 4자리를 정확하게 입력하세요.");
				span.css({"color" : "red", "visibility" : "visible"});
			}else if(ddVal == "" || ddVal == null){
				span.text("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
				span.css({"color" : "red", "visibility" : "visible"});
			}else if(ddVal == "0" || ddVal == "00"){
				span.text("생년월일을 다시 확인해주세요.");
				span.css({"color" : "red", "visibility" : "visible"});
			}else{
				if(mmVal == "01" || mmVal == "03" || mmVal == "05" || mmVal == "07" || mmVal == "08" || mmVal == "10" || mmVal == "12"
					|| mmVal == "1" || mmVal == "3" || mmVal == "5" || mmVal == "7" || mmVal == "8"){
					if(parseInt(ddVal) <= 31){
						span.text("");
						span.css({"visibility" : "hidden"});
					}else{
						span.text("생년월일을 다시 확인해주세요.");
						span.css({"color" : "red", "visibility" : "visible"});
					}
				}else if(mmVal == "02" || mmVal == "2"){
					if(parseInt(yyVal)%4 == 0){
						if(parseInt(ddVal) <= 29){
							span.text("");
							span.css({"visibility" : "hidden"});
						}else{
							span.text("생년월일을 다시 확인해주세요.");
							span.css({"color" : "red", "visibility" : "visible"});
						}
					}else{
						if(parseInt(ddVal) <= 28){
							span.text("");
							span.css({"visibility" : "hidden"});
						}else{
							span.text("생년월일을 다시 확인해주세요.");
							span.css({"color" : "red", "visibility" : "visible"});
						}
					}
				}else{
					if(parseInt(ddVal) <= 30){
						span.text("");
						span.css({"visibility" : "hidden"});
					}else{
						span.text("생년월일을 다시 확인해주세요.");
						span.css({"color" : "red", "visibility" : "visible"});
					}
				}
			}
		}
	}
	
	
	if(id == "birth3"){
		var span = $("#birthFoot");
	    var yyVal = document.getElementById("birth1").value;
	    var mmVal = document.getElementById("birth2").value;
	    var ddVal = document.getElementById("birth3").value;
   
		if(ddVal == "" || ddVal == null){
			span.text("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
			span.css({"color" : "red", "visibility" : "visible"});
	    }else if(!checkDate.test(ddVal)){
			span.text("생년월일을 다시 확인해주세요.");
			span.css({"color" : "red", "visibility" : "visible"});
	    }else if(ddVal == "0" || ddVal =="00"){
			span.text("생년월일을 다시 확인해주세요.");
			span.css({"color" : "red", "visibility" : "visible"});
	    }else{
			if(yyVal == "" || yyVal == null || parseInt(yyVal) < 1900 || parseInt(yyVal) > 2022){
				span.text("태어난 년도 4자리를 정확하게 입력하세요.");
				span.css({"color" : "red", "visibility" : "visible"});
			}else if(mmVal == "00" || mmVal == "0" || mmVal == "" || mmVal == null || parseInt(mmVal) > 12){
				span.text("태어난 월을 정확하게 입력하세요.");
				span.css({"color" : "red", "visibility" : "visible"});
			}else{
				if(mmVal == "01" || mmVal == "03" || mmVal == "05" || mmVal == "07" || mmVal == "08" || mmVal == "10" || mmVal == "12"
					|| mmVal == "1" || mmVal == "3" || mmVal == "5" || mmVal == "7" || mmVal == "8"){
					if(parseInt(ddVal) <= 31){
						span.text("");
						span.css({"visibility" : "hidden"});
					}else{
						span.text("생년월일을 다시 확인해주세요.");
						span.css({"color" : "red", "visibility" : "visible"});
					}
				}else if(mmVal == "02" || mmVal == "2"){
					if(parseInt(yyVal)%4 == 0){
						if(parseInt(ddVal) <= 29){
							span.text("");
							span.css({"visibility" : "hidden"});
						}else{
							span.text("생년월일을 다시 확인해주세요.");
							span.css({"color" : "red", "visibility" : "visible"});
						}
					}else{
						if(parseInt(ddVal) <= 28){
							span.text("");
							span.css({"visibility" : "hidden"});
						}else{
							span.text("생년월일을 다시 확인해주세요.");
							span.css({"color" : "red", "visibility" : "visible"});
						}
					}
				}else{
					if(parseInt(ddVal) <= 30){
						span.text("");
						span.css({"visibility" : "hidden"});
					}else{
						span.text("생년월일을 다시 확인해주세요.");
						span.css({"color" : "red", "visibility" : "visible"});
					}
				}
			}
		}
	}
	

 
/* =================================================================================================== */
/* =================================================================================================== */
/* =================================================================================================== */


	/*if(id =="birth1"){	
		info = document.getElementById("birthFoot");
		if(bir1Reg.test(bir1Val) && bir2Reg.test(bir2Val) && bir3Reg.test(bir3Val) 
		&& bir1Val!="0000" && bir2Val!="0" && bir2Val!="00" && bir3Val!="0" && bir3Val!="00" 
		&& parseInt(bir2Val)<=12 && parseInt(bir3Val)<=31){
			info.style.visibility = "visible";
			info.textContent = "올바르게 입력하셨습니다";
			info.style.color = "green";
		}else if(value == "0000"){
			info.style.visibility = "visible";
			info.textContent = "0은 입력하실 수 없습니다";
			info.style.color = "red";
		}else{
			info.style.visibility = "visible";
			info.textContent = "생년월일을 올바르게 입력해주세요";
			info.style.color = "red";
		}
	}
	if(id =="birth2"){
		info = document.getElementById("birthFoot");
		if(bir1Reg.test(bir1Val) && bir2Reg.test(bir2Val) && bir3Reg.test(bir3Val) 
		&& bir1Val!="0000" && bir2Val!="0" && bir2Val!="00" && bir3Val!="0" && bir3Val!="00" 
		&& parseInt(bir2Val)<=12 && parseInt(bir3Val)<=31){
			info.style.visibility = "visible";
			info.textContent = "올바르게 입력하셨습니다";
			info.style.color = "green";
		}else if(value == "0" || value == "00"){
			info.style.visibility = "visible";
			info.textContent = "0은 입력하실 수 없습니다";
			info.style.color = "red";
		}else if(parseInt(value)>12){
			info.style.visibility = "visible";
			info.textContent = "출생월은 12 이하로 입력하세요";
			info.style.color = "red";
		}else{
			info.style.visibility = "visible";
			info.textContent = "생년월일을 올바르게 입력해주세요";
			info.style.color = "red";
		}
	}
	if(id =="birth3"){
		info = document.getElementById("birthFoot");
		if(bir1Reg.test(bir1Val) && bir2Reg.test(bir2Val) && bir3Reg.test(bir3Val) 
		&& bir1Val!="0000" && bir2Val!="0" && bir2Val!="00" && bir3Val!="0" && bir3Val!="00" 
		&& parseInt(bir2Val)<=12 && parseInt(bir3Val)<=31){
			info.style.visibility = "visible";
			info.textContent = "올바르게 입력하셨습니다";
			info.style.color = "green";
		}else if(value == "0" || value == "00"){
			info.style.visibility = "visible";
			info.textContent = "0은 입력하실 수 없습니다";
			info.style.color = "red";
		}else if(parseInt(value)>31){
			info.style.visibility = "visible";
			info.textContent = "출생일은 31 이하로 입력하세요";
			info.style.color = "red";
		}else{
			info.style.visibility = "visible";
			info.textContent = "생년월일을 올바르게 입력해주세요";
			info.style.color = "red";
		}
	}*/
	
	
}


/* submit 버튼 */
/* ============================================================== */
function joinSubmitFn(){
	var result = true;

	var value = document.getElementById("id").value;
	var info = document.getElementById("idFoot");
	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "이메일 주소를 입력하세요";
		info.style.color = "red";
	}else if(!reg.test(value)){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "이메일 주소 형식이 올바르지 않습니다";
		info.style.color = "red";
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
		info.style.color = "green";
	}
	
	value = document.getElementById("emailcheck").value;
	info = document.getElementById("emailFoot");
		
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "이메일 인증을 해주세요";
		info.style.color = "red";
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
		info.style.color = "green";
	}
	
	value = document.getElementById("pwd").value;
	info = document.getElementById("pwdFoot");
	reg = /(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,20}$/;
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "비밀번호를 입력하세요";
		info.style.color = "red";
	}else if(!reg.test(value)){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "영문,숫자,특수문자를 모두 포함한 6~20자리만 가능합니다";
		info.style.color = "red";
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
		info.style.color = "green";
	}

	value = document.getElementById("pwdcheck").value;
	info = document.getElementById("pwdcheckFoot");
	var pwdValue = document.getElementById("pwd").value;
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "비밀번호를 다시 입력하세요";
		info.style.color = "red";
	}else if(value != pwdValue){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "비밀번호가 다릅니다";
		info.style.color = "red";
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
		info.style.color = "green";
	}

	value = document.getElementById("name").value;
	info = document.getElementById("nameFoot");
	reg = /^[가-힣]{2,20}$/;
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "이름을 입력하세요";
		info.style.color = "red";
	}else if(!reg.test(value)){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "2~20자 한글만 입력 가능합니다";
		info.style.color = "red";
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
		info.style.color = "green";
	}

	value = document.getElementById("nick").value;
	reg = /^[가-힣0-9a-zA-Z]{1,20}$/;
	info = document.getElementById("nickFoot");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "닉네임을 입력하세요";
		info.style.color = "red";
	}else if(!reg.test(value)){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "1~20자 한글,숫자,영문만 입력 가능합니다";
		info.style.color = "red";
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
		info.style.color = "green";
	}
	
	value = document.getElementById("sample2_postcode").value;
	info = document.getElementById("addrFoot");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "우편번호 찾기를 이용해주세요";
		info.style.color = "red";
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
		info.style.color = "green";
	}

	value = document.getElementById("sample2_address").value;
	info = document.getElementById("addrFoot");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "우편번호 찾기를 이용해주세요";
		info.style.color = "red";
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
		info.style.color = "green";
	}

	value = document.getElementById("sample2_detailAddress").value;
	info = document.getElementById("addrFoot");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "주소를 입력해주세요";
		info.style.color = "red";
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
		info.style.color = "green";
	}

	info = document.getElementById("phoneFoot");
	var ph1Val = document.getElementById("phone1").value;
	var ph2Val = document.getElementById("phone2").value;
	var ph3Val = document.getElementById("phone3").value;		
	if(ph1Reg.test(ph1Val) && ph2Reg.test(ph2Val) && ph3Reg.test(ph3Val)){
		info.style.visibility = "hidden";
		info.textContent = "";
	}else{
		info.style.visibility = "visible";
		info.textContent = "연락처를 올바르게 입력해주세요";
		info.style.color = "red";
		result = false;
	}

/*    생년월일 유효성 검사     =========================================================================== */
/* =================================================================================================== */
/* =================================================================================================== */
	var checkYear = /^[0-9]{4}/g;
	var checkDate = /\d{1,2}/;
	
    var span = $("#birthFoot");
    var yyVal = document.getElementById("birth1").value;
    var mmVal = document.getElementById("birth2").value;
    var ddVal = document.getElementById("birth3").value;

    if(yyVal == "" || yyVal == null || parseInt(yyVal) < 1900 || parseInt(yyVal) > 2022){
		span.text("태어난 년도 4자리를 정확하게 입력하세요.");
		span.css({"color" : "red", "visibility" : "visible"});
		result = false;
    }else if(!checkYear.test(yyVal)){
		span.text("태어난 년도 4자리를 정확하게 입력하세요.");
		span.css({"color" : "red", "visibility" : "visible"});
		result = false;
	}else{
		if(mmVal == "00" || mmVal == "0" || mmVal == "" || mmVal == null || parseInt(mmVal) > 12){
			span.text("태어난 월을 정확하게 입력하세요.");
			span.css({"color" : "red", "visibility" : "visible"});
			result = false;
		}else{
			if(ddVal == "0" || ddVal == "00" || ddVal == "" || ddVal == null || parseInt(ddVal) > 31){
				span.text("생년월일을 다시 확인해주세요.");
				span.css({"color" : "red", "visibility" : "visible"});
				result = false;
			}else if(ddVal == ""){
				span.text("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
				span.css({"color" : "red", "visibility" : "visible"});
				result = false;
			}else{
				if(mmVal == "01" || mmVal == "03" || mmVal == "05" || mmVal == "07" || mmVal == "08" || mmVal == "10" || mmVal == "12"
					|| mmVal == "1" || mmVal == "3" || mmVal == "5" || mmVal == "7" || mmVal == "8" ){
					if(parseInt(ddVal) <= 31){
						span.text("");
						span.css({"visibility" : "hidden"});
					}else{
						span.text("생년월일을 다시 확인해주세요.");
						span.css({"color" : "red", "visibility" : "visible"});
						result = false;
					}
				}else if(mmVal == "02" || mmVal == "2"){
					if(parseInt(yyVal)%4 == 0){
						if(parseInt(ddVal) <= 29){
							span.text("");
							span.css({"visibility" : "hidden"});
						}else{
							span.text("생년월일을 다시 확인해주세요.");
							span.css({"color" : "red", "visibility" : "visible"});
							result = false;
						}
					}else{
						if(parseInt(ddVal) <= 28){
							span.text("");
							span.css({"visibility" : "hidden"});
						}else{
							span.text("생년월일을 다시 확인해주세요.");
							span.css({"color" : "red", "visibility" : "visible"});
							result = false;
						}
					}
				}else{
					if(parseInt(ddVal) <= 30){
						span.text("");
						span.css({"visibility" : "hidden"});
					}else{
						span.text("생년월일을 다시 확인해주세요.");
						span.css({"color" : "red", "visibility" : "visible"});
						result = false;
					}
				}
			}
		}
	}
	
/* =================================================================================================== */
/* =================================================================================================== */
/* =================================================================================================== */

	/*info = document.getElementById("birthFoot");
	var bir1Val = document.getElementById("birth1").value;
	var bir2Val = document.getElementById("birth2").value;
	var bir3Val = document.getElementById("birth3").value;
	if(bir1Reg.test(bir1Val) && bir2Reg.test(bir2Val) && bir3Reg.test(bir3Val) 
		&& bir1Val!="0000" && bir2Val!="0" && bir2Val!="00" && bir3Val!="0" && bir3Val!="00" 
		&& parseInt(bir2Val)<=12 && parseInt(bir3Val)<=31){
		info.style.visibility = "hidden";
		info.textContent = "";
	}else if(bir1Val=="0000" || bir2Val=="0" || bir2Val=="00" || bir3Val=="0" || bir3Val=="00"){
		info.style.visibility = "visible";
		info.textContent = "0은 입력하실 수 없습니다";
		info.style.color = "red";
		result = false;
	}else if(parseInt(bir2Val)>12){
		info.style.visibility = "visible";
		info.textContent = "출생월은 12 이하로 입력하세요";
		info.style.color = "red";
		result = false;
	}else if(parseInt(bir3Val)>31){
		info.style.visibility = "visible";
		info.textContent = "출생일은 31 이하로 입력하세요";
		info.style.color = "red";
		result = false;
	}else{
		info.style.visibility = "visible";
		info.textContent = "생년월일을 올바르게 입력해주세요";
		info.style.color = "red";
		result = false;
	}*/
	
	if(!emailCheck){
		swal({
			text: "이메일 인증을 해주세요.",
			button: "확인",
			icon: "warning",
			closeOnClickOutside : false
		});
	}else if(!result){
		swal({
			text: "입력하신 정보가 올바르지 않습니다.",
			button: "확인",
			icon: "warning",
			closeOnClickOutside : false
		});
	}else if(result && emailCheck){
		document.joinFrm.method = "post";
		document.joinFrm.action = "join.do";
		document.joinFrm.submit();
	}
}

// 휴대폰 문자인증 관련 
/*else if(!phoneCk){
		swal({
			text: "인증번호를 다시 확인해주세요.",
			button: "확인",
			icon: "warning",
			closeOnClickOutside : false
		});
}*/


/* 아이디 중복 확인 */
/* ============================================================== */
/*function idCheck(){
	var id = $("#id").val();
	var idFoot = $("#idFoot");
	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(id != null && id != "" && reg.test(id)){
		$.ajax({
			url: contextPath+"/login/idCheck",
			type: "post",
			data: "id="+id,
			success: function(data){
				var result = data.trim();
				console.log(result);
				if(result == "idCheckFail"){
					idFoot.text("이미 사용 중인 메일 주소입니다.");
					idFoot.css("color","red");
					idFoot.css("visibility","visible");
					emailCheck = false;
				}else if(result == "idCheckSuccess"){
					idFoot.text("사용 가능한 아이디입니다.");
					idFoot.css("color","green");
					idFoot.css("visibility","visible");
					emailCheck = true;
				}
			}
		});
	}
}*/

/* 휴대폰 번호 인증 */ 

/*function phoneCheckFn(){
	var phone = $("#phone").val();
	var phoneFoot = $("#phoneFoot");
	var reg = /^\d{10,11}/;
	
	if(phone != null && phone != "" && reg.test(phone)){
		$.ajax({
			url: contextPath+"/login/phoneCheck",
			type: "post",
			data: "phone="+phone,
			success: function(data){
				var result = data.trim();
				console.log("result="+result);
				if(result == "CheckFail"){
					phoneFoot.text("이미 사용 중인 번호입니다.");
					phoneFoot.css("color","red");
					phoneFoot.css("visibility","visible");
				}else if(result == "CheckSuccess"){
					phoneFoot.text("사용 가능한 번호입니다.");
					phoneFoot.css("color","green");
					phoneFoot.css("visibility","visible");
					
					checkphone();
				}
			}
		});
	}
}*/

/*var code2 = "";
function checkphone(){
	swal({
		text: "인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.",
		button: "확인",
		icon: "warning",
		closeOnClickOutside : false
	});
	var phone = $("#phone").val(); 
	$.ajax({ 
		type:"GET", 
		url:contextPath+"/login/phoneCheck?phone=" + phone, 
		cache : false, 
		success:function(data){ 
			if(data == "error"){ 
				swal({
					text: "휴대폰 번호가 올바르지 않습니다.",
					button: "확인",
					icon: "warning",
					closeOnClickOutside : false
				});
				$("#phoneCheckFoot").text("유효한 번호를 입력해주세요."); 
				$("#phoneCheckFoot").css("color","red");
				$("#phoneCheckFoot").css("visibility","visible");
				$("#phone").attr("autofocus",true); 
			}else{ $("#phoneCheck").attr("disabled",false); 
				$("#phoneChk2").css("display","inline-block"); 
				$("#phoneCheckFoot").text("인증번호 입력 후 인증번호 확인을 눌러주세요."); 
				$("#phoneCheckFoot").css("color","green"); 
				$("#phoneCheckFoot").css("visibility","visible"); 
				$("#phone").attr("readonly",true); 
				code2 = data; 
			} 
		} 
	}); 
}*/

/* 휴대폰 인증번호 대조 */ 
/*function checkphone2(){
	if($("#phoneCheck").val() == code2){ 
		$("#phoneCheckFoot").text("인증번호가 일치합니다."); 
		$("#phoneCheckFoot").css("color","green"); 
		$("#phoneCheckFoot").css("visibility","visible");
		$("#phoneDoubleChk").val("true"); 
		$("#phoneCheck").attr("disabled",true); 
		phoneCk = true;
	}else{ 
		$("#phoneCheckFoot").text("인증번호가 일치하지 않습니다.");
		$("#phoneCheckFoot").css("color","red");
		$("#phoneCheckFoot").css("visibility","visible");
		$("#phoneDoubleChk").val("false");
		$(this).attr("autofocus",true);
	} 
}*/


/* 인증번호 발송 */
/* ============================================================== */
function sendMailFn(){
	var id = $("#id").val();
	var idFoot = $("#idFoot");
	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(id != null && id != "" && reg.test(id)){
		$.ajax({
			url: contextPath+"/login/send_number",
			type: "post",
			data: "id="+id,
			success: function(data){
				var result = data.trim();
				console.log(result);
				if(result == "idCheckFail"){
					idFoot.text("이미 사용 중인 메일 주소입니다.");
					idFoot.css("color","red");
					idFoot.css("visibility","visible");
				}else if(result == "success"){
					idFoot.text("인증번호가 발송되었습니다.");
					idFoot.css("color","green");
					idFoot.css("visibility","visible");
				}else{
					idFoot.text("인증번호 발송이 실패했습니다.");
					idFoot.css("color","red");
					idFoot.css("visibility","visible");
				}
			}
		});
	}else{
		
	}
}


/* 인증번호 확인 */
/* ============================================================== */
function tempNumCheckFn(){
	var id = $("#id").val();
	var tempNum = $("#emailcheck").val();
	var foot = $("#emailFoot");
	
	if(tempNum != null && tempNum != "" ){
		$.ajax({
			url: contextPath+"/login/temp_num_check",
			type: "post",
			data: "temp_number="+tempNum+"&id="+id,
			success: function(data){
				var result = data.trim();
				console.log(result);
				if(result == "success"){
					emailCheck = true;
					foot.text("이메일 인증이 완료되었습니다.");
					foot.css("color","green");
					foot.css("visibility","visible");
				}else{
					emailCheck = false;
					foot.text("인증번호가 일치하지 않습니다.");
					foot.css("color","red");
					foot.css("visibility","visible");
				}
			}
		});
	}else{
		emailCheck = false;
	}
}
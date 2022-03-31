/* 전역 변수 */
var idcheck = false;
var ph1Reg = /\d{2,3}/;
var ph2Reg = /\d{3,4}/;
var ph3Reg = /\d{4}/;
var bir1Reg = /\d{4}/;
var bir2Reg = /\d{1,2}/;
var bir3Reg = /\d{1,2}/;
var spaceReg = /\s/g;
var emailCheck = false;

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
		reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,20}$/;
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
		reg = /[가-힣]{2,20}$/;
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
		reg = /[가-힣0-9a-zA-Z]{3,20}$/;
		if(value == ""){
			info.style.visibility = "visible";
			info.textContent = "닉네임을 입력하세요";
			info.style.color = "red";
		}else if(!reg.test(value)){
			info.style.visibility = "visible";
			info.textContent = "3~20자 한글,숫자,영문만 입력 가능합니다";
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

	if(id =="birth1"){	
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
	}
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
	reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,20}$/;
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
	reg = /[가-힣]{2,20}$/;
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
	reg = /[가-힣0-9a-zA-Z]{3,20}$/;
	info = document.getElementById("nickFoot");
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "닉네임을 입력하세요";
		info.style.color = "red";
	}else if(!reg.test(value)){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "3~20자 한글,숫자,영문만 입력 가능합니다";
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

	info = document.getElementById("birthFoot");
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
	}

	if(result && emailCheck){
		document.joinFrm.method = "post";
		document.joinFrm.action = "join.do";
		document.joinFrm.submit();
	}
}


/* 인증번호 발송 */
/* ============================================================== */
function sendMailFn(){
	var id = $("#id").val();
	var idFoot = $("#idFoot");
	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(id != null && id != "" && reg.test(id)){
		$.ajax({
			url: "send_number",
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
			url: "temp_num_check",
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
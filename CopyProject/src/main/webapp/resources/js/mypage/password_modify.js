/*function checkForm() {
	var newpass = document.getElementById("newpass").value;
	var newpassre = document.getElementById("newpassre").value;

	if(newpass != newpassre){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		return false;
	}else if((newpass == null)||(newpassre == null)||
	((newpass == null) && (newpassre == null))){
		alert("먼저 값을 입력하세요");	
		return false;
	}else if(((newpass != null) && (newpassre != null))&&
	(newpass == newpassre) &&(newpass != null)&&(newpassre != null)){
		alert("비밀번호가 수정되었습니다. 다시 로그인 하세요!");
		return ture;
	}
}
*/

function checkSubmitFn(){
	var result = true;

	value = document.getElementById("newpass").value;
	info = document.getElementById("guideSpan");
	reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,20}$/;
	if(value == ""){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "비밀번호를 입력하세요";
		info.style.color = "red";
		swal({
			text: "먼저 값을 입력하세요.",
			button: "확인",
		});
	}else if(!reg.test(value)){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "형식 오류";
		info.style.color = "red";
		swal({
			text: "영문,숫자,특수문자를 모두 포함한 6~20자리만 가능합니다",
			button: "확인",
		});
		
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
	}

	value = document.getElementById("newpassre").value;
	info = document.getElementById("guideSpan");
	var pwdValue = document.getElementById("newpass").value;
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
		swal({
			text: "비밀번호와 비밀번호 확인이 일치하지 않습니다",
			button: "확인",
		});
	}else if(!reg.test(value)){
		result = false;
		info.style.visibility = "visible";
		info.textContent = "형식이 올바르지 않습니다";
		info.style.color = "red";
	}else{
		info.style.visibility = "hidden";
		info.textContent = "";
	}


	if(result){
		swal({
			text: "비밀번호가 수정되었습니다. 다시 로그인 하세요",
			button: "확인",
		});
		document.modifyFrm.method = "post";
		document.modifyFrm.action = "password_modify.do";
		document.modifyFrm.submit();
	}
}
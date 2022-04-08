function loginFn(){
	document.loginFrm.method = "post";
	document.loginFrm.action = "login.do";
	document.loginFrm.submit();
}

function enterkey() {
    if (window.event.keyCode == 13) {
         loginFn();
    }
}

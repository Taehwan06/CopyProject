function CheckPassFn(){
	document.CheckPassFrm.method = "post";
	document.CheckPassFrm.action = "password_check.do";
	document.CheckPassFrm.submit();
}
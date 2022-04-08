function goOutFn(){
	
	var check = document.getElementById("check1").checked;
	
	
	if(!check){
		alert("체크박스 동의를 해주세요!");
		
		
	}else{
		
		document.OutFrm.method = "post";
		document.OutFrm.action = "member_delete.do";
		document.OutFrm.submit();
		
	}
	
}
function selectFn(obj){
	var rInput = document.getElementById("requestInput");
	
	if(obj.value == "option01"){
		rInput.style.visibility = "visible";
	}else{
		rInput.style.visibility = "hidden";
	}
}

function paidConfirmFn(){
   
   document.hiddenFrm.method = "post";
    document.hiddenFrm.action = "payConfirm";
    document.hiddenFrm.submit();
    
}

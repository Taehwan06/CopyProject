function selectFn(obj){
	var rInput = document.getElementById("requestInput");
	
	if(obj.value == "option01"){
		rInput.style.visibility = "visible";
	}else{
		rInput.style.visibility = "hidden";
	}
}


function goOutFn(){
	
	var check = document.getElementById("check1").checked;
	
	
	if(!check){
		/*alert("체크박스 동의를 해주세요!");*/
		swal({
		  title:"unchecked",
		  text: "체크박스 동의를 해주세요!",
		  icon: "warning",
		  button: "확인",
		  closeOnClickOutside : false
		}).then(function(){
			location.reload();
			
		 });
		
	}else{
		swal({
		  title:"success",
		  text: "탈퇴가 완료되었습니다. 이용해주셔서 감사합니다!",
		  icon: "success",
		  button: "확인",
		  closeOnClickOutside : false
		}).then(function(){
						
			document.OutFrm.method = "post";
			document.OutFrm.action = "member_delete.do";
			document.OutFrm.submit();
			
			
			 });
		
	
		
	}
	
}
/* 필터 */	
	function stateFn(){
		var sel = document.getElementById("stateBar");
		var delState = sel.options[sel.selectedIndex].value;
		
		
		
		location.href="/controller/mypage/state?progress="+delState;
			
	}
	
	

	function already(){
	
		swal({
			title: "이미 리뷰를 작성하셨습니다",
			text: "나의 리뷰 페이지로 이동합니다",
		 	icon: "success",
		 	button: "확인",
			
		}).then(function(){
			location.href='my_review.do';
			})
		
	}
	
	function yet(){
	
		swal({
		  title: "작성불가",
		  text: "배송완료 상태일 때만 리뷰를 작성하실 수 있습니다",
		  icon: "warning",
		  button: "확인",
		});
	
		
	}

	
/*주문배송조회 필터*/

/*function stateFn(){
	var sel = document.getElementById("stateBar");
	var delState = sel.options[sel.selectedIndex].value;
	var div = document.getElementsByClassName("product")[0];
	
	console.log(sel);
	console.log("배송상태: "+delState);
	console.log(div);
	
		$.ajax({
			url: "state",
			type: "get",
			data: "progress="+delState,
			success: function(data){
				var result = data.trim();
				if(result = "success"){						
					
				}
			}
		});
	

		
	});
	
	if(delState = "pay"){
		div.innerText = '';
		
		
		
		
	}else if(delState = "ready"){	
		div.innerText = '';
		
		
		
		
	}else if(delState = "ing"){
		div.innerText = '';
		
		
		
		
	}else if(delState = "complete"){
		div.innerText = '';
		
		
	}*/
	
	
	
	function stateFn(){
		var sel = document.getElementById("stateBar");
		var delState = sel.options[sel.selectedIndex].value;
		
		/*console.log(sel);
		console.log("배송상태: "+delState);*/
		
		location.href="/controller/mypage/state?progress="+delState;
		
		
		
	}
	
	

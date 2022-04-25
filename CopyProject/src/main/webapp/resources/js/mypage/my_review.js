function R_delFn(sridx,spidx,midx){
	swal({
	      text: "리뷰를 삭제하시겠습니까?",
	      icon: "warning",
	      buttons: [" 취소 ", " 확인 "],
	      dangerMode: false,
	   })
	   .then((willDelete) => {
		      if (willDelete) {
		          swal({
				      text: "확인을 누르면 리뷰가 삭제됩니다.",
				      icon: "warning",
				      buttons: [" 취소 ", " 확인 "],
				      dangerMode: false,
				   })
				   .then((willDelete) => {
					      if (willDelete) {
					         $.ajax({
								type : "POST",
								url : "mypage_review_del.do",
								data : "sridx="+sridx+"&spidx="+spidx+"&midx="+midx,
								success : function(res) {
									console.log(res);
									if(res>0){
										swal({
									         text: "리뷰가 삭제되었습니다.",
									         button: "확인",
									         closeOnClickOutside : false
									      }).then(function(){
									         location.reload();
									      });
									}else{
										alert("실행오류");
									}
								}
							});
					   } else {
					      
					   }
					});
		   } else {
		      
		   }
		});
}



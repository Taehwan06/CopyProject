$(document).ready(function(){
	/* 스토어 서브 네비 */
	/*========================================================================*/
	$("#menuStore").mouseover(function(){
		$("#menuStore").css({"color" : "#ffb6c1"});
		if($(window).width()>751){
			$("#subNav").css({"display" : "block", "border-bottom" : "3px solid #ffb6c1"});
			$("#subNav2").css({"display" : "none"});
		}
	});
	
	$("header").mouseover(function(){
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
		}
	});
	

	$("#subNav").mouseover(function(){
		if($(window).width()>751){
			$("#menuStore").css({"color" : "#ffb6c1"});
			$("#subNav").css({"display" : "block"});
		}
	});
	
	$("#menuLogin").mouseover(function(){
		$("#subNav").css({"display" : "none"});
	});
	
	$("#menuLogin").mouseleave(function(){
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
		}
	});
	
	$("#menuJoin").mouseover(function(){
		$("#subNav").css({"display" : "none"});
	});
	
	$("#menuJoin").mouseleave(function(){
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
		}
	});
	
	$("#menuSearchlist").mouseover(function(){
		$("#subNav").css({"display" : "none"});
	});
	
	$("#menuSearchlist").mouseleave(function(){
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
		}
	});
	
	/* 커뮤니티 서브네비 */
	/*========================================================================*/
	$("#menuComm").mouseover(function(){
		$("#menuComm").css({"color" : "#ffb6c1"});
		if($(window).width()>751){
			$("#subNav").css({"display" : "none"});
			$("#subNav2").css({"display" : "block", "border-bottom" : "3px solid #ffb6c1"});
		}else{
			$("#subNav").css({"display" : "none"});
			$("#subNav2").css({"display" : "none"});
		}
	});

	$("#menuComm").mouseleave(function(){
		$("#menuComm").css({"color" : "black"});
		$("#menuStore").css({"color" : "#ffb6c1"});
		$("#subNav2").css({"display" : "none"});
	});

	$("#subNav2").mouseover(function(){
		if($(window).width()>751){
			$("#menuComm").css({"color" : "#ffb6c1"});
			$("#subNav2").css({"display" : "block"});
		}
	});

	$("#subNav2").mouseleave(function(){
		$("#menuComm").css({"color" : "black"});
		$("#menuStore").css({"color" : "#ffb6c1"});
		$("#subNav2").css({"display" : "none"});
		$("#subNav").css({"display" : "block"});
	});
	
	/* 카테고리 */
	/*========================================================================*/
	
	$("#category").mouseover(function(){
		$("#categoryLi").css({"color" : "#ffb6c1"});
		if($(window).width()>751){
			$(".categoryDiv").css({"display" : "block"});
		}
	});

	$("#category").mouseleave(function(){
		$("#categoryLi").css({"color" : "black"});
		$(".categoryDiv").css({"display" : "none"});
		
	});

	$(".categoryDiv").mouseover(function(){
		if($(window).width()>751){
			$("#categoryLi").css({"color" : "#ffb6c1"});
			$(".categoryDiv").css({"display" : "block"});
		}
	});

	$(".categoryDiv").mouseleave(function(){
		$("#categoryLi").css({"color" : "black"});
		$(".categoryDiv").css({"display" : "none"});
	});
	
	/* 상품정보 */
	/*========================================================================*/
	
	$("#shop_information_area_header").mouseover(function(){
		$("._product").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#shop_information_area_header").mouseleave(function(){
		$("._product").css({"border" : "none", "color" : "black"});
	});
	
	$("#shop_information_area").mouseover(function(){
		$("._product").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#shop_information_area").mouseleave(function(){
		$("._product").css({"border" : "none", "color" : "black"});
	});
	
	$("#review_area_header").mouseover(function(){
		$("._review").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#review_area_header").mouseleave(function(){
		$("._review").css({"border" : "none", "color" : "black"});
	});
	
	$("#review_area").mouseover(function(){
		$("._review").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#review_area").mouseleave(function(){
		$("._review").css({"border" : "none", "color" : "black"});
	});
	
	$("#QnA_area_header").mouseover(function(){
		$("._QnA").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#QnA_area_header").mouseleave(function(){
		$("._QnA").css({"border" : "none", "color" : "black"});
	});
	
	$("#QnA_area").mouseover(function(){
		$("._QnA").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#QnA_area").mouseleave(function(){
		$("._QnA").css({"border" : "none", "color" : "black"});
	});
	
	$("#delivery_area_header").mouseover(function(){
		$("._change").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#delivery_area_header").mouseleave(function(){
		$("._change").css({"border" : "none", "color" : "black"});
	});
	
	$("#delivery_area").mouseover(function(){
		$("._change").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#delivery_area").mouseleave(function(){
		$("._change").css({"border" : "none", "color" : "black"});
	});
	
	$("#change_area_header").mouseover(function(){
		$("._change").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#change_area_header").mouseleave(function(){
		$("._change").css({"border" : "none", "color" : "black"});
	});
	
	$("#change_area").mouseover(function(){
		$("._change").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#change_area").mouseleave(function(){
		$("._change").css({"border" : "none", "color" : "black"});
	});
	
	$("#change_content").mouseover(function(){
		$("._change").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#change_content").mouseleave(function(){
		$("._change").css({"border" : "none", "color" : "black"});
	});
	
	
	/* 컨텐츠 이미지사이즈 조절 */
	
	$("#shop_information_area img").css("width","100%");
	/*$("#shop_information_area").children("p").children("img").css("width","100%");*/

});

function moreview(){
	$("#shop_information_area").css("height","auto");
	$("#moreview_button").css("display","none");
}

function locationFn(type){
	var offset = null;
	if(type == 'product'){
		offset = $("#shop_information_area_header").offset();
		$("html, body").animate({scrollTop: offset.top - 200},400);
	}else if(type == 'review'){
		offset = $("#review_area_header").offset();
		$("html, body").animate({scrollTop: offset.top - 200},400);
	}else if(type == 'QnA'){
		offset = $("#QnA_area_header").offset();
		$("html, body").animate({scrollTop: offset.top - 200},400);
	}else if(type == 'change'){
		offset = $("#delivery_area_header").offset();
		$("html, body").animate({scrollTop: offset.top - 200},400);
	}

}
let match = {10:"가구", 11:"가구 > 소파", 12:"가구 > 수납장", 13:"가구 > 의자", 14:"가구 > 침대", 15:"가구 > 테이블", 16:"가구 > 화장대",
			20:"조명", 21:"조명 > LED", 22:"조명 > 단스텐드", 23:"조명 > 장스텐드", 24:"조명 > 무드등", 25:"조명 > 천장등",
			30:"침구", 31:"침구 > 베게", 32:"침구 > 이불", 33:"침구 > 커버", 34:"침구 > 커튼", 35:"침구 > 쿠션 & 방석",
			40:"가전", 41:"가전 > 냉장고", 42:"가전 > TV", 43:"가전 > 세탁기", 44:"가전 > 에어컨", 45:"가전 > 청소기",
			50:"주방", 51:"주방 > 그릇 & 접시", 52:"주방 > 냄비 & 팬", 53:"주방 > 보관용기", 54:"주방 > 수저", 55:"주방 > 식기건조대", 56:"주방>컵",
			60:"생활", 61:"생활 > 욕실", 62:"생활 > 수건", 63:"생활 > 청소", 64:"생활 > 세탁", 65:"생활 > 생활잡화"};

function delFn(){
	
	swal({
	      text: "상품을 삭제하시겠습니까?",
	      icon: "warning",
	      buttons: [" 취소 ", " 확인 "],
	      dangerMode: false,
	   })
	   .then((willDelete) => {
		      if (willDelete) {
		          swal({
				      text: "확인을 누르면 상품이 삭제됩니다.",
				      icon: "warning",
				      buttons: [" 취소 ", " 확인 "],
				      dangerMode: false,
				   })
				   .then((willDelete) => {
					      if (willDelete) {
					         swal({
						         text: "상품이 삭제되었습니다.",
						         button: "확인",
						         closeOnClickOutside : false
						      }).then(function(){
						         location.href = "store_del.do?spidx="+spidx;
						      });
					   } else {
					      
					   }
					});
		   } else {
		      
		   }
		});
	/*var isCancel = false;
	var tx1 = confirm("상품을 삭제하시겠습니까?");
	if(tx1){
		isCancel = confirm("확인을 누르면 상품이 삭제됩니다.");
	}
	
	if(isCancel){
		swal({
	         text: "상품이 삭제되었습니다.",
	         button: "확인",
	         closeOnClickOutside : false
	      }).then(function(){
	         location.href = "store_del.do?spidx="+spidx;
	      });
		
	}*/
}	

//textarea크기 자동조절
function adjustHeight() {
   var textEle = $(".A_textarea");
   textEle[0].style.height = 'auto';
   var textEleHeight = textEle.prop('scrollHeight');
   textEle.css('height', textEleHeight);
   textEle.css('overflow', 'hidden');
};

var textEle = $(".A_textarea");
textEle.on('keyup', function() {
   adjustHeight();
});


function cntFn(){
	var selectCnt = $('#selectCnt option:selected').val();
	if(selectCnt == 10){
		$('#selectCnt').css("display","none");
		$('.hiddenCnt').css("display","inline-block");
	}
	cnt=selectCnt
	var sum_price = selectCnt*price;
	$('.sum_price').text(sum_price);
}	

function cntFn2(){
	var selectCnt = $('.hiddenCnt').val();
	$('#cnt').val(selectCnt);
	cnt=selectCnt
	var sum_price = selectCnt*price;
	$('.sum_price').text(sum_price);
}

function R_modifyFn(sridx){
	if(loginYN){
		location.href="store_review_modify.do?spidx="+spidx+"&sridx="+sridx;
	}else{
		swal({
	         text: "로그인 후 이용하여 주세요.",
	         button: "확인",
	         closeOnClickOutside : false
	      }).then(function(){
	         location.href="/controller/login/login.do";
	      });
		
	}
}


function R_delFn(sridx){
	var isCancel = false;
	var tx1 = confirm("리뷰를 삭제하시겠습니까?");
	if(tx1){
		isCancel = confirm("확인을 누르면 리뷰가 삭제됩니다.");
	}
	
	if(isCancel){
		$.ajax({
			type : "POST",
			url : "store_review_del.do",
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
	}
}




function qnaInFn(){
	if(loginYN){
		location.href="store_qna_insert.do?spidx="+spidx;
	}else{
		swal({
	         text: "로그인 후 이용하여 주세요.",
	         button: "확인",
	         closeOnClickOutside : false
	      }).then(function(){
	         location.href="/controller/login/login.do";
	      });
	}
}
function Q_modifyFn(sqidx){
	if(loginYN){
		location.href="store_qna_modify.do?spidx="+spidx+"&sqidx="+sqidx;
	}else{
		swal({
	         text: "로그인 후 이용하여 주세요.",
	         button: "확인",
	         closeOnClickOutside : false
	      }).then(function(){
	         location.href="/controller/login/login.do";
	      });
	}
}

//답변작성란출력
function A_writeFn(obj,sqidx){
	$(".qna_a_area_").remove();
	var html = "<div class='qna_a_area qna_a_area_'>"
				+"<div>"
				+"<span class='qna_qa'>A</span><c:out value='${loginUser.nick_name}'/>"
				+"<div style='float: right; padding-top:10px; '>"
				+"<span class='A_write' onclick='A_insert("+sqidx+")'>저장</span>"
				+" <span class='A_write' onclick='page_reload()'>취소</span>"
				+"</div>"
				+"</div>"
				+"<div class='qna_content_font qna_a_back'>"
				+"<textarea class='A_textarea'></textarea>"
				+"</div>"
				+"</div>"
	$(obj).parent().parent().after(html);
	
	function adjustHeight() {
	   var textEle = $(".A_textarea");
	   textEle[0].style.height = 'auto';
	   var textEleHeight = textEle.prop('scrollHeight');
	   textEle.css('height', textEleHeight);
	   textEle.css('overflow', 'hidden');
	};
	
	var textEle = $(".A_textarea");
	textEle.on('keyup', function() {
	   adjustHeight();
	});
}
function A_modifyFn(obj,sqidx){
	$(".qna_a_area_").remove();
	var content = $(obj).parent().next().html();
	content = content.replace(/(<br>|<brV>|<br V>)/g,'\r\n');
	var html = "<div class='qna_a_area qna_a_area_'>"
				+"<div>"
				+"<span class='qna_qa'>A</span><c:out value='${loginUser.nick_name}'/>"
				+"<div style='float: right; padding-top:10px; '>"
				+"<span class='A_write' onclick='A_insert("+sqidx+")'>저장</span>"
				+" <span class='A_write' onclick='page_reload()'>취소</span>"
				+"</div>"
				+"</div>"
				+"<div class='qna_content_font qna_a_back'>"
				+"<textarea class='A_textarea'>"+content+"</textarea>"
				+"</div>"
				+"</div>"
	$(obj).parent().parent().after(html);
	$(obj).parent().parent().remove();
	
	
	var textEle = $(".A_textarea");
    textEle[0].style.height = 'auto';
    var textEleHeight = textEle.prop('scrollHeight');
    textEle.css('height', textEleHeight);
    textEle.css('overflow', 'hidden');
	
	function adjustHeight() {
	   textEle = $(".A_textarea");
	   textEle[0].style.height = 'auto';
	   textEleHeight = textEle.prop('scrollHeight');
	   textEle.css('height', textEleHeight);
	   textEle.css('overflow', 'hidden');
	};
	
	var textEle = $(".A_textarea");
	textEle.on('keyup', function() {
	   adjustHeight();
	});
}



function A_insert(sqidx){
	var content = $(".A_textarea").val();
	content = content.replace(/(\n|\r\n)/g,'<br>');
	if(content != ""){
		$.ajax({
			type : "POST",
			url : "store_qna_a_insert.do",
			data : "answer_content="+content+"&sqidx="+sqidx,
			success : function(res) {
				
				console.log(res);
				if(res>0){
					swal({
				         text: "답변이 등록되었습니다.",
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
	}else{
		alert("공백은 등록할수 없습니다..");
	}
}
function A_delFn(sqidx){
	var isCancel = false;
	var tx1 = confirm("답변을 삭제하시겠습니까?");
	if(tx1){
		isCancel = confirm("확인을 누르면 답변이 삭제됩니다.");
	}
	
	if(isCancel){
		$.ajax({
			type : "POST",
			url : "store_qna_a_del.do",
			data : "sqidx="+sqidx,
			success : function(res) {
				console.log(res);
				if(res>0){
					swal({
				         text: "답변이 삭제되었습니다.",
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
	}
}
function Q_delFn(sqidx){
	var isCancel = false;
	var tx1 = confirm("문의를 삭제하시겠습니까?");
	if(tx1){
		isCancel = confirm("확인을 누르면 문의가 삭제됩니다.");
	}
	
	if(isCancel){
		$.ajax({
			type : "POST",
			url : "store_qna_q_del.do",
			data : "sqidx="+sqidx+"&midx="+midx,
			success : function(res) {
				console.log(res);
				if(res>0){
					swal({
				         text: "로그인 후 이용하여 주세요.",
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
	}
}
function page_reload(){
	location.reload();
}

function likeFn(likeYN){
	if(likeYN==0){
		if(!loginYN){
			swal({
		         text: "로그인 후 이용하여 주세요.",
		         button: "확인",
		         closeOnClickOutside : false
		      }).then(function(){
		         location.href="/controller/login/login.do";
		      });
		}
		$.ajax({
			type : "GET",
			url : "likeIN",
			data : "spidx="+spidx+"&midx="+midx,
			success : function(res) {
				if(res!=1){
					console.log("오류오류");
				}
				if(res==100){
					swal({
				         text: "로그인 후 이용하여 주세요.",
				         button: "확인",
				         closeOnClickOutside : false
				      }).then(function(){
				         location.href="/controller/login/login.do";
				      });
				}
				var html="<div onclick='likeFn(1)'>"
				html += "<svg xmlns='http://www.w3.org/2000/svg' width='30' height='30' fill='currentColor' class='bi bi-heart-fill' viewBox='0 0 16 16'>";
				html += "<path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/>";
				html += "</svg>";			
				html += "</div>";		
				$(".like").html(html);
			}
		});
	}else{
		$.ajax({
			type : "GET",
			url : "likeDEL",
			data : "spidx="+spidx+"&midx="+midx,
			success : function(res) {
				if(res!=1){
					console.log("오류오류");
				}
				if(res==100){
					swal({
				         text: "로그인 후 이용하여 주세요.",
				         button: "확인",
				         closeOnClickOutside : false
				      }).then(function(){
				         location.href="/controller/login/login.do";
				      });
				}
				var html="<div onclick='likeFn(0)'>"
				html += "<svg xmlns='http://www.w3.org/2000/svg' width='30' height='30' fill='currentColor' class='bi bi-heart' viewBox='0 0 16 16'>";
				html += "<path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z'/>";
				html += "</svg>";			
				html += "</div>";		
				$(".like").html(html);
			}
		});
	}
}


//ajax페이징 실패(데이터담기까지 가능 하단 번호조정 실패)
/*function review_paging(nowPage){
	$.ajax({
		type : "get",
		url : "review_paging",
		data : "spidx="+spidx+"&nowPage="+nowPage,
		success : function(res) {
			var jsondata = $.parseJSON(res);
			var sethtml = "";
			for(var i=0; i<jsondata.length; i++){
				sethtml+= "<li class='reply_list_item'>";
				sethtml+= "<article class='reply_item_'>";
				sethtml+= "<p class='reply_item_content'>";
				sethtml+= "<a class='reply_item_content_writer' href=''>"+jsondata[i].nick_name;
				sethtml+= "<img class='reply_item_content_writer_image' src='/controller/image/"+jsondata[i].profile_system+"'>";
				sethtml+= "</a>";
				sethtml+= "<time class='reply_item_footer_time'>";
				if(jsondata[i].modify_yn=='N'){
					sethtml+= jsondata[i].write_date;
				}
				if(jsondata[i].modify_yn=='Y'){
					sethtml+= jsondata[i].modify_date+"(수정됨)";
				}
				sethtml+= "</time>";
				if(midx==jsondata[i].midx){
				sethtml+= "<span class='A_write' onclick='R_modifyFn("+jsondata[i].sridx+")'>수정하기</span>";
				sethtml+= "<span class='A_write' onclick='R_delFn("+jsondata[i].sridx+")'>삭제하기</span>";
				}
				sethtml+= "</p>";
				sethtml+= "<footer class='reply_item_footer'>";
				sethtml+= "<div style='position: absolute;top: 0px;'>";
				sethtml+= "<c:set var='star' value='"+jsondata[i].score+"'/>";
				sethtml+= "<span class='sky'>";
				for(var a=0; a<jsondata[i].score;a++){
				sethtml+= " <svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-star-fill' viewBox='0 0 16 16'>";
				sethtml+= "<path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/>";
				sethtml+= "</svg>";
				}
				sethtml+= "</span>";
				sethtml+= "</div>";
				sethtml+= "</footer>";
				sethtml+= "</article>";	
				sethtml+= "<div style='margin:30px 0px 0 20px;'>";
				if(jsondata[i].img_origin!=null&&jsondata[i].img_origin!=""){
				sethtml+= "<div style='padding: 5px; width: 150px; height: 150px;'><img alt='' src='"+jsondata[i].img_origin+"' style='width: 100%; height: 100%;border-radius: 5px;'> </div>";		
				};
				sethtml+= "<div style='padding: 10px;'>"+jsondata[i].content+"</div>";
				sethtml+= "</div>";	
				sethtml+= "</li>";												
			}														
										
			$(".reply_list").html("");
			$(".reply_list").html(sethtml);
		}
	});

}*/
			
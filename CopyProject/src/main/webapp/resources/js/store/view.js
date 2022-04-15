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
	
	/*$("#shop_information_area img").style.width ="200px";*/

	

});

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
	var isCancel = false;
	var tx1 = confirm("상품을 삭제하시겠습니까?");
	if(tx1){
		isCancel = confirm("확인을 누르면 상품이 삭제됩니다.");
	}
	
	if(isCancel){
		alert("상품이 삭제되었습니다.");
		location.href = "store_del.do?spidx="+spidx;
	}
}	

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
function qnaInFn(){
	if(loginYN){
		location.href="store_qna_insert.do?spidx="+spidx;
	}else{
		alert("로그인 후 이용하여 주세요.");
	}
}
function Q_modifyFn(sqidx){
	if(loginYN){
		location.href="store_qna_modify.do?spidx="+spidx+"&sqidx="+sqidx;
	}else{
		alert("로그인 후 이용하여 주세요.");
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
					alert("답변이 등록되었습니다.");
					location.reload();
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
					alert("답변이 삭제되었습니다.");
					location.reload();
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
					alert("문의가 삭제되었습니다.");
					location.reload();
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
			
$(document).ready( function(){
	/*$("#priceSelected").on('click', function() {
		var start = $("#priceStart").val()*1;
		var end = $("#priceEnd").val()*1;
		if (start < 0) start = 0;
		if (end <= 0) end = Math.pow(10, 9);
		alert(start+" ~ "+end);
	});*/
	
	/*$(".category_link").click(function(){
		var id = $(this).attr('id');
		location.href = 'store_list.do?category='+id;
	});*/
	
	//카테고리 이동처리
	$(".category_link2").click(function(){
		var id = $(this).attr('id');
		location.href = 'store_list.do?detail='+id;
	});


	
	//가격범위 노출
	textchange = false;
	$(".price_btn").click(function(){
	  	if(textchange){
	      textchange = false;
	      $("#pricePopup").hide();
	      $(this).css({"background" : "none", "color" : "black"});
		  price_btn = false;
	    }else{
	      textchange = true;
	      $(this).css({"background" : "#ffb6c1", "color" : "white"});
			$("#pricePopup").show();
			price_btn = true;
	    }
	})
	
	//가격 인풋에 숫자만 입력가능
	$(".numberOnly").on("keyup", function() {
    	$(this).val($(this).val().replace(/[^0-9]/g,""));
    });
	//가격 인풋범위초과시 가격고정
	$(".max_price").on("keyup", function() {
		if($(this).val()>69930000){
			$(this).val(69930000)
		}
	});
	
});

//정렬방식 클릭시 색상변경
var free = false;
var price_btn = false;

function freeFn(e){
	if($(e).css("color")!="rgb(255, 255, 255)"){
		$(e).css({"background" : "#ffb6c1", "color" : "white"});
		free=true;
		lookup();
	}else{
		$(".list_btn").css({"background" : "none", "color" : "black"});
		free=false;
		lookup();
	}
}

//상품 필터 적용
function lookup(){
	var lookupdata = "";
	if($("#priceStart").val()!=""){
		var priceStart= $("#priceStart").val();
	}else{
		var priceStart= 0;
	}
	if($("#priceEnd").val()!=""){
		var priceEnd=$("#priceEnd").val();
	}else{
		var priceEnd= 99999999999999;
	}
	var order=$("#sort option:selected").val();
	if(free==true){
		lookupdata += "free=Y";
	}else{
		lookupdata += "free=N";
	}
	if(price_btn==true){
		lookupdata += "&priceStart="+priceStart+"&priceEnd="+priceEnd;
		
	}else{
		lookupdata += "&price1=0&priceStart=0&priceEnd=99999999999999";
	}
	lookupdata += "&order="+order+"&category="+category+"&detail="+detail;
	$.ajax({
		type : "GET",
		url : "lookup",
		data : lookupdata,
		contentType : "application/json; charset=UTF-8",
		datatype : 'json',
		success : function(data) {
			
			var jsondata = $.parseJSON(data);
			var sethtml = "";
			/*for(var vo[] : jsondata){
				
			}*/

			for(var i=0; i<jsondata.length; i++){
				sethtml+="<div class='col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop' onClick=\"location.href='"+contextPath+"/store/store_view.do?spidx="+jsondata[i].spidx+"'\">";
				sethtml+="<img src='"+contextPath+"/image/"+jsondata[i].img_system+"' class='shopImg'>";
				sethtml+="<div class='shopText'>";
				sethtml+="<div class='shopTitle'>";
				sethtml+="<div class='brand'>"+jsondata[i].brand+"</div>";
				sethtml+=""+jsondata[i].title+"";
				sethtml+="</div>";
				sethtml+="<div class='shopPrice row'>";
				sethtml+="<div class='discount_area col-4'><span class='red discount'>"+jsondata[i].discount+"%</span></div><div class='price_area col-8'><span class='origin'>"+jsondata[i].origin_price+"원</span><br>"+jsondata[i].view_price+"원</div>";
				sethtml+="</div>";
				sethtml+="<span class='sky'>";
				sethtml+="<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-star-fill' viewBox='0 0 16 16'>";
				sethtml+="<path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/>";
				sethtml+="</svg>";
				sethtml+="</span>";
				sethtml+=" <b>"+jsondata[i].score+"</b> <span class='gray'>리뷰 "+jsondata[i].review_cnt+"</span>";
				sethtml+="</div>";
				sethtml+="</div>";
			}
			$(".shopList").html("");
			$(".shopList").html(sethtml);
			

		}
	});
}


//페이지 분류코드
let match = {10:"가구", 11:"가구 > 소파", 12:"가구 > 수납장", 13:"가구 > 의자", 14:"가구 > 침대", 15:"가구 > 테이블", 16:"가구 > 화장대",
			20:"조명", 21:"조명 > LED", 22:"조명 > 단스텐드", 23:"조명 > 장스텐드", 24:"조명 > 무드등", 25:"조명 > 천장등",
			30:"침구", 31:"침구 > 베게", 32:"침구 > 이불", 33:"침구 > 커버", 34:"침구 > 커튼", 35:"침구 > 쿠션 & 방석",
			40:"가전", 41:"가전 > 냉장고", 42:"가전 > TV", 43:"가전 > 세탁기", 44:"가전 > 에어컨", 45:"가전 > 청소기",
			50:"주방", 51:"주방 > 그릇 & 접시", 52:"주방 > 냄비 & 팬", 53:"주방 > 보관용기", 54:"주방 > 수저", 55:"주방 > 식기건조대", 56:"주방>컵",
			60:"생활", 61:"생활 > 욕실", 62:"생활 > 수건", 63:"생활 > 청소", 64:"생활 > 세탁", 65:"생활 > 생활잡화",
			"Discount":"오늘의 딜","sell_cnt":"Best","select":"추천상품"};

//아코디언 마우스 호버시 글씨 색 변경
function colorFn(obj){
   $(".abtn").not(".collapsed").css("color", "white");
   $(".collapsed").css("color", "black");
   
   if($(obj).hasClass("collapsed") === true) {
      $(obj).css("color", "#ffb6c1");
   }
   
   $(obj).not(".collapsed").mouseover(function(){
      $(obj).css("color", "white");
   });

   $(obj).not(".collapsed").mouseleave(function(){
      $(obj).css("color", "white");
   });
   
   $(".collapsed").mouseover(function(){
      $(this).css("color", "#ffb6c1");
   });

   $(".collapsed").mouseleave(function(){
      $(this).css("color", "black");
   });
   
   $(".abtn").not(obj).mouseover(function(){
      $(this).not(obj).css("color", "#ffb6c1");
   });

   $(".abtn").not(obj).mouseleave(function(){
      $(this).not(obj).css("color", "black");
   });
}

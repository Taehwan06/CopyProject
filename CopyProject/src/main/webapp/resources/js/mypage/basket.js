$(document).ready(function() {
	//전체선택 클릭시 모든상품 선택되도록
	$('input[name=all]').click(function(){
		if($(this).is(':checked')){
			$('.Selection').prop('checked',true);
		}else{
			$('.Selection').prop('checked',false);
		}
	});
	//개별상품 체크해제할시 전체선택 취소
	$('.Selection').click(function(){
		if(!$(this).is(':checked')){
			$('input[name=all]').prop('checked',false);
		}
	});
	//
	
	
	//수량선택시 1미만 1000초과시 선택못하도록 설정
	$('.decreaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $(this).next().val();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
			swal({
				text: "1개미만은 선택할 수 없습니다.",
				button: "확인",
				icon: "warning",
				closeOnClickOutside : false
			}).then(function(){
				num =1;
			});
		}else{
			$(this).next().val(num);
			var price = $(this).parent().parent().next('.price_val_box').children('.hidden').text();
			$(this).parent().parent().next('.price_val_box').children('.price_val').children('span').text((price*num).toLocaleString());
		}
		
		
	});
	$('.increaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $(this).prev().val();
		var num = parseInt(stat,10);
		num++;

		if(num>999){
			swal({
				text: "상품은 999개까지만 구매가능합니다.",
				button: "확인",
				icon: "warning",
				closeOnClickOutside : false
			}).then(function(){
				num=999;
			});
		}else{
			$(this).prev().val(num);
			var price = $(this).parent().parent().next('.price_val_box').children('.hidden').text();
			$(this).parent().parent().next('.price_val_box').children('.price_val').children('span').text((price*num).toLocaleString());
		}
	});
	
	
	$('.numberUpDown').change(function(){
		var count = $(this).val();
		var price = $(this).parent().parent().next('.price_val_box').children('.hidden').text();
		if(count > 0){
			$(this).parent().parent().next('.price_val_box').children('.price_val').children('span').text((price*count).toLocaleString());
		}else{
			swal({
				text: "0이하는 선택할 수 없습니다.",
				button: "확인",
				icon: "warning",
				closeOnClickOutside : false
			}).then(function(){
				
			});
			$(this).val("1");
			$(this).parent().parent().next('.price_val_box').children('.price_val').children('span').text(parseInt(price).toLocaleString());
		}
	});
});


var productCnt = 0;
var totalPrice = 0;
var totalDelivery = 0;

var checkedPrice = 0;
var checkedCnt = 0;
var checkedDelivery = 0;
var checkedPay = 0;
		
var totalPay = totalPrice + totalDelivery;

window.onload = function(){
	$(".totalPay").text(totalPay);
	$(".productCnt").text(productCnt);
	$(".totalPrice").text(totalPrice);
	$(".totalDelivery").text(totalDelivery);
}

function deleteOneBasketFn(sbidx,cnt,price,delivery){
	var basket = $("#basket"+sbidx);
	
	if($("#Selection"+sbidx).is(":checked")){
		$("#Selection"+sbidx).prop("checked", false);
		
		checkedPrice -= (price*cnt);
		checkedCnt -= cnt;
		checkedDelivery -= delivery;
		checkedPay -= (price*cnt);
		checkedPay -= delivery;
		
		$(".totalPay").text(checkedPay.toLocaleString());
		$(".productCnt").text(checkedCnt);
		$(".totalPrice").text(checkedPrice.toLocaleString());
		$(".totalDelivery").text(checkedDelivery.toLocaleString());
		
	}
	
	$.ajax({
		url: contextPath+"/mypage/deleteOneBasket",
		type: "post",
		data: "sbidx="+sbidx,
		success: function(data){
			var result = data.trim();
			if(result == "success"){
				$("#Selection"+sbidx).prop("checked", false);
				basket.remove();
			}
		}
	});
}

function selectFn(){
	
	var len = $("input[name='Selection']:checked").length;
	checkedCnt = 0;
	checkedPrice = 0;
	checkedDelivery = 0;
	checkedPay = 0;
	
	if(len > 0){
	    $("input[name='Selection']:checked").each(function(e){
	        var value = $(this).val();
	        var valueAry = value.split(",");
			
			var sbidx = valueAry[0];
			var cnt = parseInt($("#cnt"+sbidx).val());
			var price = parseInt(valueAry[2]);
			var delivery = parseInt(valueAry[3]);
			
			checkedCnt += cnt;
			checkedPrice += parseInt(price*cnt);
			checkedDelivery += parseInt(delivery);
	        
	    })
	}
	
	checkedPay = (checkedPrice + checkedDelivery);
	
	$(".totalPay").text(checkedPay.toLocaleString());
	$(".productCnt").text(checkedCnt);
	$(".totalPrice").text(checkedPrice.toLocaleString());
	$(".totalDelivery").text(checkedDelivery.toLocaleString());
}

function minusFn(obj,sbidx,price,delivery){
	var cnt = parseInt($(obj).next().val());
	if(cnt > 1){
		$.ajax({
			url: contextPath+"/mypage/minusCntBasket",
			type: "post",
			data: "sbidx="+sbidx,
			success: function(data){
				var result = data.trim();
				if(result = "success"){
					if($("#Selection"+sbidx).is(":checked")){
						
						checkedPrice -= parseInt(price);
						checkedCnt -= 1;
						checkedDelivery -= parseInt(delivery);
						checkedPay -= parseInt(price);
						checkedPay -= parseInt(delivery);
						
						$(".totalPay").text(checkedPay.toLocaleString());
						$(".productCnt").text(checkedCnt);
						$(".totalPrice").text(checkedPrice.toLocaleString());
						$(".totalDelivery").text(checkedDelivery.toLocaleString());
					}
				}
			}
		});
	}
}

function plusFn(obj,sbidx,price,delivery){
	var cnt = parseInt($(obj).prev().val());
	if(cnt < 999){
		$.ajax({
			url: contextPath+"/mypage/plusCntBasket",
			type: "post",
			data: "sbidx="+sbidx,
			success: function(data){
				var result = data.trim();
				if(result = "success"){			
					if($("#Selection"+sbidx).is(":checked")){
						
						checkedPrice += parseInt(price);
						checkedCnt += 1;
						checkedDelivery += parseInt(delivery);
						checkedPay += parseInt(price);
						checkedPay += parseInt(delivery);
						
						$(".totalPay").text(checkedPay.toLocaleString());
						$(".productCnt").text(checkedCnt);
						$(".totalPrice").text(checkedPrice.toLocaleString());
						$(".totalDelivery").text(checkedDelivery.toLocaleString())
					}
				}
			}
		});
	}
}


function payFn(){
	
	if(postCode == 0){
		swal({
			text: "주소 등록 후 구매 가능합니다.",
			button: "확인",
			icon: "warning",
			closeOnClickOutside : false
		}).then(function(){
			location.href = contextPath+"/mypage/addr_modify.do";
		});
		
	}else{
		
		var checkedSbidx = [];
		var sbidxStr = "";
		var len = $("input[name='Selection']:checked").length;
		
		if(len > 0){
		    $("input[name='Selection']:checked").each(function(e){
		        var value = $(this).val();
		        var valueAry = value.split(",");
				var sbidx = valueAry[0];
				
				checkedSbidx.push(sbidx);
				sbidxStr += sbidx+",";
		    })
		}
		
		$("#sbidxStr").val(checkedSbidx);
		
		if(checkedSbidx.length == 0){
			swal({
				text: "구매하실 상품을 선택해주세요.",
				button: "확인",
				});
		}else{
			document.payFrm.method = "post";
			document.payFrm.action = contextPath+"/mypage/payment.do";
			document.payFrm.submit();
		}
	}
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var size = ${basketList.size()};
	var totalPrice = 0;
	var totalDelivery = 0;
	var titleAry = [];
	var payTitle = "";
	var sbidxStr = "";
	
	<c:forEach items="${basketList}" var="basketListvo" varStatus="cnt">
		totalPrice += (${basketListvo.price}) * (${basketListvo.cnt});
		totalDelivery += ${basketListvo.delivery_charge};
		titleAry.push("${basketListvo.title}");
		sbidxStr += ${basketListvo.sbidx}+",";
	</c:forEach>
	
	var totalPay = totalPrice + totalDelivery;
	
	if(totalDelivery == 0){
		totalDelivery = "무료배송";
	}else{
		totalDelivery = totalDelivery+"원";
	}
	
	if(size > 2){
		payTitle = titleAry[0]+" 외 "+(size-1)+"건";
	}else{
		payTitle = titleAry[0];
	}
	
	
	window.onload = function(){
		var productAmount = document.getElementById("productAmount");
		productAmount.value = totalPrice;
		var deliveryCharge = document.getElementById("deliveryCharge");
		deliveryCharge.value = totalDelivery;
		var amount = document.getElementById("amount");
		amount.value = totalPay;
	}
	
	function iamport(){
		//가맹점 식별코드
		IMP.init("imp58059253");
		IMP.request_pay({
			pg : "html5_inicis",
		    pay_method : "card",
		    merchant_uid : "merchant_" + new Date().getTime(),
		    name : payTitle , //결제창에서 보여질 이름
		    amount : totalPay, //실제 결제되는 가격
		    buyer_email : "${loginUser.id}",
		    buyer_name : "${loginUser.membername}",
		    buyer_tel : "${loginUser.phone}",
		    buyer_addr : "${loginUser.addr}",
		    buyer_postcode : "${loginUser.post_code}"
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	
				var ordernumber = new Date().getTime();
				
				$.ajax({
					url: "insertOrderList",
					type: "post",
					data: "ordernumber="+ordernumber+"&sbidxStr="+sbidxStr,
					success: function(data){
						var result = data.trim();
						if(result = "success"){
							console.log("insertOrderList = success");
						}
					}
				});
		    	
		    	$.ajax({
					url: "deleteListBasket",
					type: "post",
					data: "sbidxStr="+sbidxStr,
					success: function(data){
						var result = data.trim();
						if(result = "success"){
							console.log("deleteListBasket = success");
						}
					}
				});
		    	
				location.href="order_success.do";
		    	
		    } else {
		    	location.href="order_fail.do";
		    }
		    alert(msg);
		});
	}
</script>
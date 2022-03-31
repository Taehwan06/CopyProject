$(function(){
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
	
	
	//수량선택시 1미만 100초과시 선택못하도록 설정
	$('.decreaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $(this).next().val();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
			alert('1개미만은 선택할 수 없습니다.');
			num =1;
		}
		$(this).next().val(num);
		var price = $(this).parent().parent().next('.price_val_box').children('.hidden').text();
		$(this).parent().parent().next('.price_val_box').children('.price_val').children('span').text(price*num);
	});
	$('.increaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $(this).prev().val();
		var num = parseInt(stat,10);
		num++;

		if(num>999){
			alert('상품은 999개까지만 구매가능합니다');
			num=999;
		}
		$(this).prev().val(num);
		var price = $(this).parent().parent().next('.price_val_box').children('.hidden').text();
		$(this).parent().parent().next('.price_val_box').children('.price_val').children('span').text(price*num);
	});
	
	
	$('.numberUpDown').change(function(){
		var count = $(this).val();
		var price = $(this).parent().parent().next('.price_val_box').children('.hidden').text();
		$(this).parent().parent().next('.price_val_box').children('.price_val').children('span').text(price*count);
	});
	
	
	
});
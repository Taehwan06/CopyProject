<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- 부트스트랩 -->
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Bootstrap icon CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
	<title>장바구니</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/home.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<link href="/controller/css/mypage/basket.css" rel="stylesheet">
	
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/home.js"></script>
	<script src="/controller/js/mypage/basket.js"></script>
	<script src="/controller/js/footer.js"></script>
	
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	<section class="basket_content">	
		<!-- content -->
		<form action="#">
		<div class="row content_box">
		
			<!-- 전체선택 체크박스 -->
			<div class="checkbox_all">
				<div>
					<label><input type="checkbox" name="all" value="all"> 전체선택</label>
				</div>
			</div>
			<!-- 상품표기 -->
			<div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8 padding_right">
				<div>
					<!-- 개별 상품목록 -->
					<ul class="row no_list container-fluid border_b">
						<div class="col-6">
							<input class="Selection" type="checkbox" name="Selection" value="상품번호3">
						</div><!-- 상품삭제 -->
						<div class="col-6" style="text-align: right; padding-right: 15px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
  						</div>
						<li class="col-3">
							<ul class="row no_list">
							<li class="col-3"></li>
								<li class="col-9">
									<img class="product_image" src="/controller/image/bedding.png">
								</li>
							</ul>
						</li>
						<li class="col-9">
							<ul class="row no_list" style="text-align: center;">
								<li class="col-6 content_margin">
									<div class="text_left">
										포근한 이불
									</div>
								</li>
								<li class="col-3 text_center">
									<div class="padding_t10">
										<button type="button" class="btn decreaseQuantity">	- </button>
										<input type="text" class="numberUpDown" class="numberOnly" maxlength="3" size="1" value="1">
									    <button type="button" class="btn increaseQuantity">&#43;</button>
								    </div>
								</li>
								<li class="col-3 text_center price_val_box">
									<div class="hidden">10000</div>
									<div class="price_val margin_auto"><span>10000</span>원</div>
								</li>
							</ul>
						</li>
					</ul>
					<!--  -->
					
					
					<!-- 하단 금액표기 -->
					<div class="row text_middle bottom_all_price text_center">
						<div class="col-4 bottom_all_price_text">
							<div>
								상품금액
								<br>
								<div class="bottom_all_price_price">
									<span class="font_size_15px">0</span>&nbsp;원
								</div>
							</div>
						</div>
						<div class="col-1 bottom_all_price_sign">
							<div>+</div>
						</div>
						<div class="col-2 bottom_all_price_text">
							<div>
								배송비
								<br>
								<div class="bottom_all_price_price">
									<span class="font_size_15px">0</span>&nbsp;원
								</div>
							</div>
						</div>
						<div class="col-1 bottom_all_price_sign">
							<div>=</div>
						</div>
						<div class="col-4 bottom_all_price_text">
							<div>
								상품금액
								<br>
								<div class="bottom_all_price_price">
									<span class="font_size_15px">0</span>&nbsp;원
								</div>
							</div>
						</div>
					</div>
					<!--  -->
					<!-- 모바일 결제버튼 -->
						<div class="m_payment_button">
							<button class="sumPriceBox_button" type="button">구매하기</button>
						</div>
				</div>
			</div>
			<!-- 합계금액표시 sticky box -->
			<div class="col-4 sumPriceBox">
				<div class="sticky_box">
					<div class="sumPriceBox_tltel">
						결제정보
					</div>
					<div class="sumPriceBox_content">
						<ul class="no_list">
							<li class="row text_middle margin_tb10">
								<span class="col-4">상품수</span>
								<span class="col-8 sumPriceBox_content_text_right">
									<strong class="font_size_small">0</strong><span class="font_size_small">&nbsp;개</span>
								</span>
							</li>
							<li class="row text_middle margin_tb10">
								<span class="col-4">금액</span>
								<span class="col-8 sumPriceBox_content_text_right">
									<strong class="font_size_small">0</strong><span class="font_size_small">&nbsp;원</span>
								</span>
							</li>
							<li class="row text_middle margin_tb10">
								<span class="col-4">배송비</span>
								<span class="col-8 sumPriceBox_content_text_right">
									<strong class="font_size_small">0</strong><span class="font_size_small">&nbsp;원</span>
								</span>
							</li>
						</ul>
					</div>
					<div class="row content_margin">
						<span class="col-5 price_visible">총 결제금액</span>
						<span class="col-7 sumPriceBox_content_text_right">
							<strong >9,000,000</strong><span class="font_size_small">&nbsp;원</span>
						</span>
					</div>
					
				</div>
				<div class="content_margin">
						<button type="button" class="sumPriceBox_button" onclick="payFn()">구매하기</button>
				</div>
			</div>
		</div>
		</form>
		<form id="payFrm" name="payFrm">
			<input type="hidden" name="sbidx" value="1,2,3">
			<input type="hidden" name="midx" value="1">
		</form>
	</section>
	
	<script>
		function payFn(){
			document.payFrm.method = "post";
			document.payFrm.action = "payment.do";
			document.payFrm.submit();
		}
	</script>
	
	<%@ include file="../footer.jsp" %>
	
	
</body>
</html>
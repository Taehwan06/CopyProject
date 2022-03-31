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
	
	
	<title>주문/결제 - 홈프렌즈</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/mypage/payment.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/mypage/payment1.js"></script>
	<script src="/controller/js/footer.js"></script>
	
	

</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		<div class="title">주문결제</div>
		
		<div class="contents">	
			<!-- 배송지 정보 -->
			<!-- ============================================================================================================= -->
			<div class="addrArea">
				<div class="addrTitle">배송지 정보</div>
				<div class="addrContents">
					<div class="addrName">이지은</div>
					<div class="addr">
						(06173) 서울특별시 강남구 테헤란로103길 17
					</div>
					<div class="addrPhone">
						010-0001-0001
					</div>
					<div class="addrselect">
						<select name="request" id="request" onchange="selectFn(this)">
							<option value="배송시 요청사항 선택하기">배송시 요청사항 선택하기</option>
							<option value="직접 수령하겠습니다">직접 수령하겠습니다</option>
							<option value="문 앞에 놓아주세요">문 앞에 놓아주세요</option>
							<option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
							<option value="배송 전 휴대폰으로 연락주세요">배송 전 휴대폰으로 연락주세요</option>
							<option value="파손위험이 있는 상품이니 조심히 다뤄주세요">파손위험이 있는 상품이니 조심히 다뤄주세요</option>
							<option value="option01" id="option01">직접입력</option>
						</select><br>
						<input type="text" name="requestInput" id="requestInput">
					</div>
				</div>
			</div>
			
			<!-- 주문 상품 정보 -->
			<!-- ============================================================================================================= -->
			<div class="orderList">
				<div class="orderListTitle">
					<span class="bold orderTitle">주문 상품</span>
					<span class="orderSub">상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다.</span>
				</div>
				<div class="productArea">
					<div class="brand">위닉스</div>
					<div class="productDetail row">
						<div class="productImgDiv col-4 col-md-4 col-lg-3">
							<img src="/controller/image/product01.jpg" class="productImg" alt="" onclick="">
						</div>
						<div class="col-8 col-md-8 col-lg-9">
							<div class="row">
								<div class="productName col-12 col-md-12 col-lg-6">
									<span class="productLink" onclick="">[1공식인증점] 위닉스 공기청정기 타워프라임 APRM833-JWK 85.8㎡ 1등급</span>
									<div class="schedule"><span class="blue">3/22(화) 이내</span> 도착예정</div>
								</div>
								<div class="productCnt col-4 col-md-4 col-lg-2">
									<input type="text" id="proCnt1" class="proCnt" value="1" disabled>개
								</div>
								<div class="productPrice col-4 col-md-4 col-lg-2">
									<input type="text" id="proPrice1" class="proPrice" value="11342630" disabled>원
								</div>
								<div class="productDelivery col-4 col-md-4 col-lg-2">
									<input type="text" id="deliCharge1" class="deliCharge" value="무료배송" disabled>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="productArea">
					<div class="brand">위닉스</div>
					<div class="productDetail row">
						<div class="productImgDiv col-4 col-md-4 col-lg-3">
							<img src="/controller/image/product01.jpg" class="productImg" alt="" onclick="">
						</div>
						<div class="col-8 col-md-8 col-lg-9">
							<div class="row">
								<div class="productName col-12 col-md-12 col-lg-6">
									<span class="productLink" onclick="">[1공식인증점] 위닉스 공기청정기 타워프라임 APRM833-JWK 85.8㎡ 1등급</span>
									<div class="schedule"><span class="blue">3/22(화) 이내</span> 도착예정</div>
								</div>
								<div class="productCnt col-4 col-md-4 col-lg-2">
									<input type="text" id="proCnt2" class="proCnt" value="1" disabled>개
								</div>
								<div class="productPrice col-4 col-md-4 col-lg-2">
									<input type="text" id="proPrice2" class="proPrice" value="11342630" disabled>원
								</div>
								<div class="productDelivery col-4 col-md-4 col-lg-2">
									<input type="text" id="deliCharge2" class="deliCharge" value="무료배송" disabled>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="productArea">
					<div class="brand">위닉스</div>
					<div class="productDetail row">
						<div class="productImgDiv col-4 col-md-4 col-lg-3">
							<img src="/controller/image/product01.jpg" class="productImg" alt="" onclick="">
						</div>
						<div class="col-8 col-md-8 col-lg-9">
							<div class="row">
								<div class="productName col-12 col-md-12 col-lg-6">
									<span class="productLink" onclick="">[1공식인증점] 위닉스 공기청정기 타워프라임 APRM833-JWK 85.8㎡ 1등급<span>
									<div class="schedule"><span class="blue">3/22(화) 이내</span> 도착예정</div>
								</div>
								<div class="productCnt col-4 col-md-4 col-lg-2">
									<input type="text" id="proCnt3" class="proCnt" value="1" disabled>개
								</div>
								<div class="productPrice col-4 col-md-4 col-lg-2">
									<input type="text" id="proPrice3" class="proPrice" value="11342630" disabled>원
								</div>
								<div class="productDelivery col-4 col-md-4 col-lg-2">
									<input type="text" id="deliCharge3" class="deliCharge" value="무료배송" disabled>
								</div>
							</div>
						</div>
					</div>
				</div>				
			</div>	
		</div>
		
		<!-- 결제 금액 -->
		<div class="paymentArea">
			<div class="amountArea">
				<input type="text" id="productAmount" value="12,000,000" disabled>원 +
				<input type="text" id="deliveryCharge" value="무료 배송" disabled> = 
				<input type="text" id="amount" value="12,000,000" disabled>원
			</div>
			<div class="agreement">
				위 내용을 확인하였으며 결제에 동의합니다.
			</div>
			<div class="payButtonArea">
				<input type="button" id="payButton" value="결제하기" onclick="">
			</div>
		</div>
		
	</section>

	<script src="/controller/js/mypage/payment2.js"></script>
	
	<%@ include file="../footer.jsp" %>
	<!-- 부트스트랩 -->	

	<!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	-->
</body>
</html>

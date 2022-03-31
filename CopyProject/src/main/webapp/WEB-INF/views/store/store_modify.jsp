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
	
	<title>상품 수정 - Home Friends</title>
	
	
	<!-- 부트스트랩 -->
	<!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	-->
	
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/store/store_insert.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/store/store_insert.js"></script>
	<script src="/controller/js/footer.js"></script>
	
	
	<!-- 썸머노트 -->
	<script src="/controller/js/summernote/summernote-lite.js"></script>
	<script src="/controller/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/controller/css/summernote/summernote-lite.css">

</head>


<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		
		<form id="insertFrm" name="insertFrm" method="post">
			<iuput type="hidden" name="midx" value="">
			
			<div class="center">
				<label for="imgUpload" id="imgLabel">
					<div id="imgArea">
						<label for="imgUpload" id="imgLabel">
							<span id="imgText">커버 사진을 추가해주세요.<br>(1:1 비율 권장)</span>
						</label><br>
						<label for="imgUpload" id="imgLabel">
							<span id="imgButton">커버 사진 등록</span>
							
						</label>
					</div>
				</label>
			</div>
			
			<label for="imgUpload">
				<div id="imgUploadInfo" class="info">필수 입력 항목입니다.</div>
			</label>
			<div id="imgUploadArea" class="area">
				<input type="file" id="imgUpload" name="imgUpload">
			</div>
			
			<div id="titleArea">
				<input type="text" id="title" name="title" placeholder="제목을 입력해주세요.">
				<label for="title">
					<div id="titleInfo">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="productNameArea" class="area">
				<input type="text" id="productName" name="productName" class="placeholderInput" placeholder="상품명을 입력해주세요.">
				<label for="productName">
					<div id="productNameInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="originPriceArea" class="area">
				<input type="text" id="originPrice" name="originPrice" class="placeholderInput" placeholder="할인 전 가격을 입력해주세요.">
				<label for="originPrice">
					<div id="originPriceInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="salePriceArea" class="area">
				<input type="text" id="salePrice" name="salePrice" class="placeholderInput" placeholder="할인 후 판매 가격을 입력해주세요.">
				<label for="salePrice">
					<div id="salePriceInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="discountArea" class="area">
				<input type="text" id="discount" name="discount" class="placeholderInput" placeholder="할인율을 입력해주세요.">
				<label for="discount">
					<div id="discountInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="brandArea" class="area">
				<input type="text" id="brand" name="brand" class="placeholderInput" placeholder="브랜드를 입력해주세요.">
			</div>
			
			<div id="freeDeliveryArea" class="area">
				<select id="freeDelivery" class="select" onchange="selectFn2(this)">
					<option name="freeDelivery" value="0">무료 배송 여부를 선택해주세요</option>
					<option name="freeDelivery" value="Y">무료 배송</option>
					<option name="freeDelivery" value="N">유료 배송</option>
				</select>
				<label for="freeDelivery">
					<div id="freeDeliveryInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="deliveryChargeArea" class="area">
				<input type="text" id="deliveryCharge" name="deliveryCharge" class="placeholderInput" placeholder="배송비를 입력해주세요.">
				<label for="deliveryCharge">
					<div id="deliveryChargeInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="categorySelectArea" class="area">
				<select id="categorySelect" class="select" onchange="selectFn(this)">
					<option name="categorySelect" value="0">상품 분류를 선택하세요</option>
					<option name="categorySelect" value="10">가구</option>
					<option name="categorySelect" value="20">조명</option>
					<option name="categorySelect" value="30">침구</option>
					<option name="categorySelect" value="40">가전 제품</option>
					<option name="categorySelect" value="50">주방 용품</option>
					<option name="categorySelect" value="60">생활 용품</option>
				</select>
				<label for="categorySelect">
					<div id="categorySelectInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea1" class="detailArea area">
				<select id="detailSelect1" class="detailSelect select">
					<option name="detailSelect" value="0">상품 분류를 선택하세요</option>
					<option name="detailSelect" value="11">소파</option>
					<option name="detailSelect" value="12">수납장</option>
					<option name="detailSelect" value="13">의자</option>
					<option name="detailSelect" value="14">침대</option>
					<option name="detailSelect" value="15">테이블</option>
					<option name="detailSelect" value="16">화장대</option>
				</select>
				<label for="detailSelect1">
					<div id="detailSelect1Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea2" class="detailArea area">
				<select id="detailSelect2" class="detailSelect select">
					<option name="detailSelect" value="0">상품 분류를 선택하세요</option>
					<option name="detailSelect" value="21">LED</option>
					<option name="detailSelect" value="22">단 스텐드</option>
					<option name="detailSelect" value="23">장 스텐드</option>
					<option name="detailSelect" value="24">무드등</option>
					<option name="detailSelect" value="25">천장등</option>	
				</select>
				<label for="detailSelect2">
					<div id="detailSelect2Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea3" class="detailArea area">
				<select id="detailSelect3" class="detailSelect select">
					<option name="detailSelect" value="0">상품 분류를 선택하세요</option>
					<option name="detailSelect" value="31">베개</option>
					<option name="detailSelect" value="32">이불</option>
					<option name="detailSelect" value="33">각종 커버</option>
					<option name="detailSelect" value="34">커튼</option>
					<option name="detailSelect" value="35">쿠션 & 방석</option>	
				</select>
				<label for="detailSelect3">
					<div id="detailSelect3Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea4" class="detailArea area">
				<select id="detailSelect4" class="detailSelect select">
					<option name="detailSelect" value="0">상품 분류를 선택하세요</option>
					<option name="detailSelect" value="41">냉장고</option>
					<option name="detailSelect" value="42">TV</option>
					<option name="detailSelect" value="43">세탁기</option>
					<option name="detailSelect" value="44">에어컨</option>
					<option name="detailSelect" value="45">청소기</option>	
				</select>
				<label for="detailSelect4">
					<div id="detailSelect4Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea5" class="detailArea area">
				<select id="detailSelect5" class="detailSelect select">
					<option name="detailSelect" value="0">상품 분류를 선택하세요</option>
					<option name="detailSelect" value="51">그릇 & 접시</option>
					<option name="detailSelect" value="52">냄비 & 팬</option>
					<option name="detailSelect" value="53">보관 용기</option>
					<option name="detailSelect" value="54">수저</option>
					<option name="detailSelect" value="55">식기건조대</option>
					<option name="detailSelect" value="56">컵</option>
				</select>
				<label for="detailSelect5">
					<div id="detailSelect5Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea6" class="detailArea area">
				<select id="detailSelect6" class="detailSelect select">
					<option name="detailSelect" value="0">상품 분류를 선택하세요</option>
					<option name="detailSelect" value="61">욕실 용품</option>
					<option name="detailSelect" value="62">수건</option>
					<option name="detailSelect" value="63">청소 용품</option>
					<option name="detailSelect" value="64">세탁 용품</option>
					<option name="detailSelect" value="65">생활 잡화</option>
				</select>
				<label for="detailSelect6">
					<div id="detailSelect6Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			
			<textarea id="summernote" name="content"></textarea>
			<div id="contentInfo">필수 입력 항목입니다.</div>
			
			<div id="butttonArea">
				<input type="button" id="submitButton" value="저장" onclick="submitFn()">
				<input type="button" id="calcelButton" value="취소" onclick="">
			</div>
		</form>
		
	</section>
	
	<%@ include file="../footer.jsp" %>
	
</body>
</html>

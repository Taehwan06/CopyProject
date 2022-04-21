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
	
	<title>상품 등록 - 홈프렌즈</title>
	
	
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
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/store/store_insert.js"></script>
	<script src="/controller/js/footer.js"></script>
	<!-- kakao SDK -->
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <!-- facebook SDK -->
   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
   <!-- naver SDK -->
   <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
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
		
		<form name="uploadForm" id="uploadForm" enctype="multipart/form-data">
			<div id="imgUploadArea" class="area">
				<input type="file" id="imgUpload" name="imgFile">
			</div>
		</form>
				
		<form id="insertFrm" name="insertFrm" action="store_insert.do" method="post" enctype="multipart/form-data">	
			
			<iuput type="hidden" name="midx" value="">
			<input type="hidden" name="img_origin" id="img_origin" value="">
			<input type="hidden" name="img_system" id="img_system" value="">
			<input type="hidden" name="detail" id="detail" value="">
			<div id="titleArea">
				<input type="text" id="title" name="title" placeholder="제목을 입력해주세요.">
				<label for="title">
					<div id="titleInfo">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="productNameArea" class="area">
				<input type="text" id="productName" name="product_name" class="placeholderInput" placeholder="상품명을 입력해주세요.">
				<label for="productName">
					<div id="productNameInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="originPriceArea" class="area">
				<input type="text" id="originPrice" name="origin_price" class="placeholderInput" placeholder="할인 전 가격을 입력해주세요.">
				<label for="originPrice">
					<div id="originPriceInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="salePriceArea" class="area">
				<input type="text" id="salePrice" name="sale_price" class="placeholderInput" placeholder="할인 후 판매 가격을 입력해주세요.">
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
				<select id="freeDelivery" name="free_delivery" class="select" onChange="selectFn2(this)">
					<option value="0">무료 배송 여부를 선택해주세요</option>
					<option value="Y">무료 배송</option>
					<option value="N">유료 배송</option>
				</select>
				<label for="freeDelivery">
					<div id="freeDeliveryInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="deliveryChargeArea" class="area">
				<input type="text" id="deliveryCharge" name="delivery_charge" class="placeholderInput" placeholder="배송비를 입력해주세요.">
				<label for="deliveryCharge">
					<div id="deliveryChargeInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="categorySelectArea" class="area">
				<select id="categorySelect" name="category" class="select" onChange="selectFn(this)">
					<option value="0">상품 분류를 선택하세요</option>
					<option value="10">가구</option>
					<option value="20">조명</option>
					<option value="30">침구</option>
					<option value="40">가전 제품</option>
					<option value="50">주방 용품</option>
					<option value="60">생활 용품</option>
				</select>
				<label for="categorySelect">
					<div id="categorySelectInfo" class="info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea1" class="detailArea area">
				<select id="detailSelect1" name="detail_temp" class="detailSelect select">
					<option value="0">상품 분류를 선택하세요</option>
					<option value="11">소파</option>
					<option value="12">수납장</option>
					<option value="13">의자</option>
					<option value="14">침대</option>
					<option value="15">테이블</option>
					<option value="16">화장대</option>
				</select>
				<label for="detailSelect1">
					<div id="detailSelect1Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea2" class="detailArea area">
				<select id="detailSelect2" name="detail_temp" class="detailSelect select">
					<option value="0">상품 분류를 선택하세요</option>
					<option value="21">LED</option>
					<option value="22">단 스텐드</option>
					<option value="23">장 스텐드</option>
					<option value="24">무드등</option>
					<option value="25">천장등</option>	
				</select>
				<label for="detailSelect2">
					<div id="detailSelect2Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea3" class="detailArea area">
				<select id="detailSelect3" name="detail_temp" class="detailSelect select">
					<option value="0">상품 분류를 선택하세요</option>
					<option value="31">베개</option>
					<option value="32">이불</option>
					<option value="33">각종 커버</option>
					<option value="34">커튼</option>
					<option value="35">쿠션 & 방석</option>	
				</select>
				<label for="detailSelect3">
					<div id="detailSelect3Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea4" class="detailArea area">
				<select id="detailSelect4" name="detail_temp" class="detailSelect select">
					<option value="0">상품 분류를 선택하세요</option>
					<option value="41">냉장고</option>
					<option value="42">TV</option>
					<option value="43">세탁기</option>
					<option value="44">에어컨</option>
					<option value="45">청소기</option>	
				</select>
				<label for="detailSelect4">
					<div id="detailSelect4Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea5" class="detailArea area">
				<select id="detailSelect5" name="detail_temp" class="detailSelect select">
					<option value="0">상품 분류를 선택하세요</option>
					<option value="51">그릇 & 접시</option>
					<option value="52">냄비 & 팬</option>
					<option value="53">보관 용기</option>
					<option value="54">수저</option>
					<option value="55">식기건조대</option>
					<option value="56">컵</option>
				</select>
				<label for="detailSelect5">
					<div id="detailSelect5Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			<div id="detailArea6" class="detailArea area">
				<select id="detailSelect6" name="detail_temp" class="detailSelect select">
					<option value="0">상품 분류를 선택하세요</option>
					<option value="61">욕실 용품</option>
					<option value="62">수건</option>
					<option value="63">청소 용품</option>
					<option value="64">세탁 용품</option>
					<option value="65">생활 잡화</option>
				</select>
				<label for="detailSelect6">
					<div id="detailSelect6Info" class="detailInfo info">필수 입력 항목입니다.</div>
				</label>
			</div>
			
			
			<textarea id="summernote" name="content"></textarea>
			<div id="contentInfo">필수 입력 항목입니다.</div>
			
			<div id="butttonArea">
				<input type="button" id="submitButton" value="저장" onClick="submitFn()">
				<input type="button" id="calcelButton" value="취소" onClick="cancelFn()">
			</div>
		</form>
		
	</section>
	
	<%@ include file="../footer.jsp" %>
	
</body>
</html>

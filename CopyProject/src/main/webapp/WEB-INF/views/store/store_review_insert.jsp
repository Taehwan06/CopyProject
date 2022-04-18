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
	
	<title>리뷰 등록 - 홈프렌즈</title>
	
	
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
	<link href="/controller/css/store/store_review_insert.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/store/store_review_insert.js"></script>
	<script src="/controller/js/footer.js"></script>
	
	
	<!-- 썸머노트 -->
	<script src="/controller/js/summernote/summernote-lite.js"></script>
	<script src="/controller/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/controller/css/summernote/summernote-lite.css">
	<script>
		var spidx = ${vo.spidx};
	</script>
</head>

<body>
	
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		<div id="product_page">
			<div id="product_information" class="row">
				<img id="product_img" class="col-3 col-md-3" alt="" src="${vo.img_origin}">
				<div id="product_title" class="col-8 col-md-8"><c:out value="${vo.product_name}"/></div>
			</div>
			<h2 id="page_sub_title">상품리뷰</h2>
		</div>
		<div class="center">
			<label for="imgUpload" id="imgLabel">
				<div id="imgArea">
					<label for="imgUpload" id="imgLabel">
						<span id="imgText">사진을 추가해주세요.<br>(1:1 비율 권장)</span>
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
				
		
		
		<form class="mb-3" name="myform" id="myform" method="post">
			<fieldset>
				<span class="text-bold">별점을 선택해주세요</span>
				<input type="radio" name="score" value="5" id="rate1"><label
					for="rate1">★</label>
				<input type="radio" name="score" value="4" id="rate2"><label
					for="rate2">★</label>
				<input type="radio" name="score" value="3" id="rate3"><label
					for="rate3">★</label>
				<input type="radio" name="score" value="2" id="rate4"><label
					for="rate4">★</label>
				<input type="radio" name="score" value="1" id="rate5"><label
					for="rate5">★</label>
			</fieldset>
			<div id="starInfo">필수 입력 항목입니다.</div>
			<div>
				<textarea name="content" class="col-auto form-control" type="text" id="reviewContents" onkeydown="resize(this)" onkeyup="resize(this)"
						  placeholder="상품평을 남겨주세요."></textarea>
			</div>
			<div id="contentInfo">필수 입력 항목입니다.</div>
			
			<div id="butttonArea">
				<input type="button" id="submitButton" value="저장" onClick="submitFn()">
				<input type="button" id="cancelButton" value="취소" onClick="cancelFn()">
			</div>
		</form>	
		
	</section>
	
	<%@ include file="../footer.jsp" %>
	
</body>
</html>

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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
	
	<title>상품 문의</title>
	
	
	<!-- 부트스트랩 -->
	<!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	-->
	
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/store/store_qna_insert.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/footer.js"></script>
	<script src="/controller/js/store/store_qna_insert.js"></script>
	
	<!-- 썸머노트 -->
	<script src="/controller/js/summernote/summernote-lite.js"></script>
	<script src="/controller/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/controller/css/summernote/summernote-lite.css">
	<script>
		var spidx = "${param.spidx}";
	</script>
	

</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		
		<form id="insertFrm" name="insertFrm" action="home_insert.do" method="post" enctype="multipart/form-data">
			<div id="product_information" class="row">
				<img id="product_img" class="col-3 col-md-3" alt="" src="${vo.img_origin}">
				<div id="product_title" class="col-8 col-md-8"><c:out value="${vo.product_name}"/></div>
			</div>
			
			<h2 id="page_sub_title">상품문의</h2>
			
			<div id="textArea">
				<textarea name="content" class="col-auto form-control" type="text" id="reviewContents" onkeydown="resize(this)" onkeyup="resize(this)"
						  placeholder="상품평을 남겨주세요."></textarea>
			</div>
			
			<div id="contentInfo">필수 입력 항목입니다.</div>
			
			<div id="butttonArea">
				<input type="button" id="submitButton" value="저장" onclick="submitFn()">
				<input type="button" id="calcelButton" value="취소" onclick="cancelFn()">
			</div>
		</form>
		
	</section>
	
	<%@ include file="../footer.jsp" %>
	
</body>
</html>

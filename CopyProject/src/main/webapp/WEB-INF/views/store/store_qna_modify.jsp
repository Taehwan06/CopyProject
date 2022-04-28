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
	
	<title>상품 문의 수정 - 홈프렌즈</title>
	
	
	<!-- 부트스트랩 -->
	<!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	-->
	<!-- kakao SDK -->
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <!-- facebook SDK -->
   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
   <!-- naver SDK -->
   <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
   <!-- sweet alert SDK -->
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/store/store_qna_insert.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js"></script>
	<script src="${pageContext.request.contextPath}/js/store/store_qna_modify.js"></script>
	
	<!-- 썸머노트 -->
	<script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/summernote/summernote-lite.css">
	
   
   <!-- 페이지 경로가져오기 -->
   <script>var contextPath = "${pageContext.request.contextPath}"</script>
	<script>
		var spidx = "${param.spidx}";
		var sqidx = "${qna_vo.sqidx}";
		
		var content = "${qna_vo.content}"
		content = content.replace(/(<br>|<brV>|<br V>)/g,'\r\n');
		
	</script>

</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		
		<form id="insertFrm" name="insertFrm" action="home_insert.do" method="post" enctype="multipart/form-data">
			<div id="product_information" class="row">
				<div class="col-12 col-sm-4"><img id="product_img" alt="" src="${pageContext.request.contextPath}/image/${vo.img_system}"></div>
				<div id="product_title" class="col-12 col-sm-8"><c:out value="${vo.product_name}"/></div>
			</div>
			
			<h2 id="page_sub_title">상품 문의 수정</h2>
			
			<div id="textArea">
				<textarea name="content" class="col-auto form-control" type="text" id="reviewContents" onkeydown="resize(this)" onkeyup="resize(this)">
				
				</textarea>
			</div>
			
			<div id="contentInfo">필수 입력 항목입니다.</div>
			
			<div id="butttonArea">
				<input type="button" id="submitButton" value="저장" onclick="submitFn()">
				<input type="button" id="calcelButton" value="취소" onclick="cancelFn()">
			</div>
		</form>
		
	</section>
	
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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Bootstrap icon CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <!-- kakao SDK -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- naver SDK -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <!-- facebook SDK -->
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
    <!-- sweet alert SDK -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>

	<title>나의 리뷰 - 홈프렌즈</title>

	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/mypage/my_review.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/mypage/my_review.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	
	<!-- 본문 영역 -->	
	<section>
	<div class="container-fluid align-items-center" >
		<div class="row">
			<%@ include file="./mypage_nav.jsp" %>
		
			<div class="col-12 col-lg-9 mydiv2">
				<div class="mydivtitle mydiv2-2">나의 리뷰</div>
				<div class="count">
						총 <strong>${review_cnt}</strong>개의 리뷰를 등록하셨습니다
				</div>	
				<div class="mydivVacant"></div>
				<c:set var="length" value="${fn:length(Reviewlist)}" />
				<c:forEach items="${Reviewlist}" var="vo" varStatus="cnt">
				<div id="mycomment">	
					<div class="row">
					<div class="col-8">
						<p class="p1"><a href="${pageContext.request.contextPath}/store/store_view.do?spidx=${vo.spidx}">${vo.title}</a></p>
						<p class="p2"><!-- ★ 평점 -->
							<c:set var="star" value="${vo.score}" />
							<c:forEach begin="0" end="4" varStatus="status">
								<c:if test="${status.index < star}">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>	
								</c:if>
								<c:if test="${status.index >= star}">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									<path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
								</svg>
								</c:if>
							</c:forEach>
						</p>
						<p class="p3">
							<strong>${vo.write_date}&nbsp;에 남긴 리뷰</strong>
							<br><br>
							<a href="${pageContext.request.contextPath}/store/store_view.do?spidx=${vo.spidx}#review_area_header">${vo.content}</a>&nbsp;
							<a id="pinky" style="color:#87ceeb;" href="${pageContext.request.contextPath}/store/store_review_modify.do?spidx=${vo.spidx}&sridx=${vo.sridx}">수정&nbsp;&#183; </a>
							<span class="del_review" style="color:#87ceeb;" onclick="R_delFn(${vo.sridx},${vo.spidx},${vo.midx})">삭제</span>
						</p>	
					</div>
					<div class="col-4 comment2">
						<a href="${pageContext.request.contextPath}/store/store_view.do?spidx=${vo.spidx}"><img src="${pageContext.request.contextPath}/image/${vo.img_system}"></a>
					</div>
					<div class="mydivVacant"></div>
					</div>
				</div>	
				</c:forEach>
			</div>
		</div><!-- row -->
		<br><br><br><br>
	</div><!-- container -->
	</section>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	

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
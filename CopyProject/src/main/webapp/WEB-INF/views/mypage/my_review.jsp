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

	<title>나의 리뷰 - 홈프렌즈</title>

	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/mypage/my_review.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	
	<!-- 본문 영역 -->	
	<section>
	<div class="container-fluid align-items-center" >
		<div class="row">
			<div class="col-12 col-lg-3 mydiv1">
				<div id="mypage_profile_box" class="row">
					<div class="col-3 col-lg-12" id="profile_image">
						<img src="/controller/image/${vo.profile_system}">
					</div>
					<div class="col-9 col-lg-12" id="profile_id">
						<div id="profile_name">
							${vo.nick_name}
						</div>
						<div id="profile_follow">
							<p>팔로워 <strong>100</strong> | 
							   팔로잉 <strong>110</strong></p>
						</div>
						<div id="profile_btn">
							<button onclick="location.href='${pageContext.request.contextPath}/mypage/member_modify.do'">설정</button>
						</div>
					</div>
					<hr>
					<div class="col-12 col-lg-12" id="profile_etc">
						<div class="profile_icon">
							<i class="bi bi-bookmark icon-pointer"></i><br>스크랩<br>
							<strong>10</strong>
						</div>
						<div class="profile_icon">
							<i class="bi bi-heart icon-pointer"></i><br>좋아요<br>
							<strong>20</strong>
						</div> 
					</div>
				</div>
			</div>
<!-- ===============================================================프로필영역================================================================ -->
<!-- ==================================================================================================================================== -->
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
							<p class="p1">${vo.title}</p>
							<p class="p2"><!-- ★ 평점 -->
								<c:set var="star" value="${vo.score}" />
								<c:forEach begin="0" end="4" varStatus="status">
									<c:if test="${status.index < star}">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
										<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									</c:if>
								</c:forEach>
							</p>
							<p class="p3">
								<strong>${vo.write_date}&nbsp;에 남긴 리뷰</strong>
								<br><br>
								<a href="/controller/store/store_view.do?spidx=${vo.spidx}#review_area_header">${vo.content}</a>
							</p>	
						</div>
						<div class="col-4 comment2">
							<a href="/controller/store/store_view.do?spidx=${vo.spidx}"><img src="${vo.img_origin}"></a>
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
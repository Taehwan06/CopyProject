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

	<title>마이페이지 - 홈프렌즈</title>

	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/mypage/mypage.css" rel="stylesheet">
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
			<div class="col-12 col-lg-9 mydiv2">
				<div class="mydivtitle">주문배송조회</div>
				<div id="mydiv2-1" class="row">
					<div class="delivery col-4">
						결제완료<br>
						<a href='${pageContext.request.contextPath}/mypage/order_list.do'><i class="bi bi-credit-card delivery-icons"></i></a><br>
						<strong>${count1}</strong>
					</div>
					<div class="delivery col-4">
						배송중<br>
						<a href='${pageContext.request.contextPath}/mypage/order_list.do'><i class="bi bi-truck delivery-icons"></i></a><br>
						<strong>${count3}</strong>
					</div>
					<div class="delivery col-4">
						배송완료<br>	
						<a href='${pageContext.request.contextPath}/mypage/order_list.do'><i class="bi bi-bag-check-fill delivery-icons"></i></a><br>
						<strong>${count4}</strong>
					</div>
					<!-- <div class="delivery col-4">
						취소/반품/교환<br>
						<a href="#"><i class="bi bi-arrow-counterclockwise delivery-icons"></i></a><br>
						<strong>0</strong>
					</div> -->
				</div>
				<div class="mydivtitle mydiv2-2">내 홈스토리</div>
				<div id="mydiv2-2">	
					<div>
					<c:set var="length" value="${fn:length(Storylist)}" />
					<c:choose>
						<c:when test="${length eq 0}">
							<div class="no_story">
								<button onclick="location.href='${pageContext.request.contextPath}/community/home_insert.do'"><i class="bi bi-plus-lg"></i>&nbsp; 첫 번째 홈스토리를 올려보세요</button>
							</div>
						</c:when>
						
						<c:when test="${length ne 0}">
							<c:forEach items="${Storylist}" end="3" var="vo" varStatus="cnt">
								<div class="my_homestroy" id="mystory${cnt.count}" >
									<input type="hidden" value="${vo.cbidx}">
									<a href="/controller/community/home_view.do?cbidx=${vo.cbidx}&nowPage=1"><img class="my_homestroy_img" src="/controller/upload/${vo.img_system}"></a>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
					</div>
					<br>
					<div id="mystory_btn">
						<button onclick="location.href='${pageContext.request.contextPath}/mypage/mypage_allStory.do'">내가 쓴 글</button>
						<button onclick="location.href='${pageContext.request.contextPath}/mypage/my_comment.do'">나의 댓글</button>
						<button onclick="location.href='${pageContext.request.contextPath}/mypage/my_review.do'">나의 리뷰</button>
						<button onclick="location.href='${pageContext.request.contextPath}/mypage/my_QnA.do'">나의 문의</button>
					</div>
				</div>
			</div>
		</div>
	</div>
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
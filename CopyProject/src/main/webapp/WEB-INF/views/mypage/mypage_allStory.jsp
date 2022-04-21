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

	<title>나의 홈스토리 - 홈프렌즈</title>

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
			<%@ include file="./mypage_nav.jsp" %>
			<div class="col-12 col-lg-9 mydiv2">
				<div class="mydivtitle mydiv2-2">나의 홈스토리</div>
				<br><br>
				<c:set var="length" value="${fn:length(Storylist)}" />
				<c:choose>
					<c:when test="${length eq 0}">
					<div id="AllstoryDiv">	
						<div class="row">
							<p class="no">아직 등록된 글이 없습니다.</p>
						</div>
					</div>
					</c:when>
					<c:when test="${length ne 0}">
					<div id="AllstoryDiv">	
						<c:forEach items="${Storylist}" var="vo" varStatus="cnt">
							<div id ="myStoryDiv">
								<input type="hidden" value="${vo.cbidx}">
								<a href="/controller/community/home_view.do?cbidx=${vo.cbidx}&fmidx=${vo.midx}&nowPage=1"><img class="all_homestroy_img" src="/controller/upload/${vo.img_system}"><br><span>${vo.title} </span></a>
							</div>	
						</c:forEach>	
					</div>
					</c:when>
				</c:choose>
			</div>
			
		<!-- 페이징 처리 -->
		<div class="col-12 col-lg-3"></div>
		<div class="paging col-12 col-lg-9">
			<ul class="list-paginator">
			<c:if test="${Storylist.size() ne 0}">
				<li>
					<a class="list-paginator_first" href="mypage_allStory.do?nowPage=${pvo.startPage}">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
						  <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
						</svg>
					</a>
				</li>
			</c:if>
			
			<!-- 페이지 블럭 처음부터 마지막 블럭까지 1씩 증가하는 페이지 출력 -->
			<c:forEach var="num" begin="${pvo.startPage }" end="${pvo.endPage }">
				<c:choose>
					<c:when test="${num == pvo.nowPage }">
						<li>
							<button class="list-paginator_page sm selected" type="button">${num }</button>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="mypage_allStory.do?nowPage=${num}#reply_area" class="list-paginator_page sm">${num }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${Storylist.size() ne 0}">
			<li>
				<a class="list-paginator_last" href="mypage_allStory.do?nowPage=${pvo.lastPage }">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
					  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
					</svg>
				</a>
			</li>
			</c:if>
		</ul>
		</div><!-- 페이징 -->
		</div><!-- row -->
		<br><br><br><br>
	</div>	
	</section>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<%@ include file="../footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
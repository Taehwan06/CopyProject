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
    <!-- kakao SDK -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<title>회원 목록</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/management/stats_view.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/management/stats_view.js"></script>
	<script src="/controller/js/nav.js"></script>
	
	<script src="/controller/js/footer.js"></script>

</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		
		<div class="sectionTitle">
			회원 구매 상세 통계
		</div>
		
		<div id="sectionContent" class="row">
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">회원번호</div>
					<div class="col-8 data right">${mvo.midx }</div>
				</div>
			</div>
						
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">아이디</div>
					<div class="col-8 data right">${mvo.id }</div>
				</div>
			</div>
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">닉네임</div>
					<div class="col-8 data right">${mvo.nick_name }</div>
				</div>
			</div>
						
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">이름</div>
					<div class="col-8 data right">${mvo.membername }</div>
				</div>
			</div>
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">생년월일</div>
					<div class="col-8 data right">${mvo.birthday }</div>
				</div>
			</div>
		
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">가입일</div>
					<div class="col-8 data right">${mvo.join_date }</div>
				</div>
			</div>
		</div>
		
		<table class="table table-responsive statsTable">
			<thead>
				<tr>
					<th>주문 번호</th>
					<th>아이디</th>
					<th>구매 금액</th>
					<th>수량</th>
					<th class="spidx">상품 등록 번호</th>
					<th class="detailNum">구매일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderList}" var="list" varStatus="cnt">
					<tr>
						<td>${list.ordernumber}</td>
						<td>${list.id}</td>
						<td>${list.price}</td>
						<td>${list.cnt}</td>
						<td class="spidx">${list.spidx}</td>
						<td class="detailNum">${list.buying_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<!-- 페이징 처리 -->
		<ul class="list-paginator">
			<li>
				<a class="list-paginator_first" href="stats.do?nowPage=1&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
						<path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					</svg>
				</a>
			</li>
			<c:if test="${memberPagingvo.startPage != 1}">
				<li>
					<a class="list-paginator_prev" href="stats.do?nowPage=${memberPagingvo.startPage - 1}&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
						</svg>
					</a>
				</li>
			</c:if>
			
			<!-- 페이지 블럭 처음부터 마지막 블럭까지 1씩 증가하는 페이지 출력 -->
			<c:forEach var="num" begin="${memberPagingvo.startPage }" end="${memberPagingvo.endPage }">
				<c:choose>
					<c:when test="${num == memberPagingvo.nowPage }">
						<li>
							<button class="list-paginator_page sm selected" type="button">${num }</button>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="stats.do?nowPage=${num}&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}" class="list-paginator_page sm">${num }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${memberPagingvo.endPage != memberPagingvo.lastPage}">
				<li>
					<a class="list-paginator_next" href="stats.do?nowPage=${memberPagingvo.endPage + 1}&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
						</svg>
					</a>
				</li>
			</c:if>
			<li>
				<a class="list-paginator_last" href="stats.do?nowPage=${memberPagingvo.lastPage }&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
						<path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
					</svg>
				</a>
			</li>
		</ul>
		
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

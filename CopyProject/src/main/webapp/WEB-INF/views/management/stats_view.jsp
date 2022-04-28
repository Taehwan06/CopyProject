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
	<!-- facebook SDK -->
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
	<!-- naver SDK -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	<title>회원별 주문 상세 - 홈프렌즈</title>
	
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/management/stats_view.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/management/stats_view.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>

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
					<th>구매 금액</th>	
					<th class="detailNum">상품 분류</th>
					<th class="spidx">상품 등록 번호</th>
					<th class="buyingDate">구매일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderList}" var="list" varStatus="cnt">
					<tr>
						<td>${list.ordernumber}</td>
						<td>${list.view_price}</td>
						<td class="detailNum">${list.detail}</td>
						<td class="spidx">${list.spidx}</td>
						<td class="buyingDate">${list.buying_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div id="buttonArea">
			<input type="button" name="listButton" id="listButton" class="button" value="목록" 
			onclick="location.href='stats.do?nowPage=${memberPagingvo.nowPage}&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}&period=${memberPagingvo.period}&cntPerPage=${memberPagingvo.cntPerPage}'">
		</div>

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

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
	
	<title>회원 목록 - 홈프렌즈</title>
	
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/management/member_list.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/management/member_list.js"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>

</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		
		<div class="sectionTitle">
			회원 목록
		</div>
		
		<form name="sectionSearchFrm" id="sectionSearchFrm" action="member_list.do" method="get">
			<select id="sectionSearchType" name="searchType">
				<option value="id" <c:if test="${memberPagingvo.searchType eq 'id'}">selected</c:if>>아이디</option>
				<option value="nick" <c:if test="${memberPagingvo.searchType eq 'nick'}">selected</c:if>>닉네임</option>
				<option value="membername" <c:if test="${memberPagingvo.searchType eq 'membername'}">selected</c:if>>성명</option>
				<option value="midx" <c:if test="${memberPagingvo.searchType eq 'midx'}">selected</c:if>>회원번호</option>
				<option value="phone" <c:if test="${memberPagingvo.searchType eq 'phone'}">selected</c:if>>연락처</option>
				<option value="delyn" <c:if test="${memberPagingvo.searchType eq 'delyn'}">selected</c:if>>탈퇴여부</option>
			</select>
			<input type="text" name="searchValue" id="sectionSearchValue" size="20" value="${memberPagingvo.searchValue}">
			<input type="submit" id="sectionSearchButton" value="검색">
			
			<div id="cntPerPageArea">
				<select id="cntPerPage" name="cntPerPage" onchange="selChange(${memberPagingvo.nowPage})">
					<option value="5"
						<c:if test="${memberPagingvo.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
					<option value="10"
						<c:if test="${memberPagingvo.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
					<option value="15"
						<c:if test="${memberPagingvo.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
					<option value="20"
						<c:if test="${memberPagingvo.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
				</select>
			</div> <!-- 옵션선택 끝 -->
			
		</form>
		
		
		
		<table class="table table-responsive memberTable">
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th class="birth">생년월일</th>
					<th class="delyn">탈퇴여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${memberPagingList}" var="list" varStatus="cnt">
					<tr onclick="location.href='member_view.do?midx=${list.midx}&nowPage=${memberPagingvo.nowPage}&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}&cntPerPage=${memberPagingvo.cntPerPage}'">
						<td>${list.midx}</td>
						<td>${list.id}</td>
						<td>${list.membername}</td>
						<td>${list.nick_name}</td>
						<td class="birth">${list.birthday}</td>
						<td class="delyn">${list.del_yn}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<!-- 페이징 처리 -->
		<ul class="list-paginator">
			<li>
				<a class="list-paginator_first" href="member_list.do?nowPage=1&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}&cntPerPage=${memberPagingvo.cntPerPage}">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
						<path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					</svg>
				</a>
			</li>
			<c:if test="${memberPagingvo.startPage != 1}">
				<li>
					<a class="list-paginator_prev" href="member_list.do?nowPage=${memberPagingvo.startPage - 1}&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}&cntPerPage=${memberPagingvo.cntPerPage}">
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
							<a href="member_list.do?nowPage=${num}&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}&cntPerPage=${memberPagingvo.cntPerPage}" class="list-paginator_page sm">${num }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${memberPagingvo.endPage != memberPagingvo.lastPage}">
				<li>
					<a class="list-paginator_next" href="member_list.do?nowPage=${memberPagingvo.endPage + 1}&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}&cntPerPage=${memberPagingvo.cntPerPage}">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
						</svg>
					</a>
				</li>
			</c:if>
			<li>
				<a class="list-paginator_last" href="member_list.do?nowPage=${memberPagingvo.lastPage }&searchType=${memberPagingvo.searchType}&searchValue=${memberPagingvo.searchValue}&cntPerPage=${memberPagingvo.cntPerPage}">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
						<path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
					</svg>
				</a>
			</li>
		</ul>
		
		<div id="buttonArea">
			<input type="button" name="modifyButton" id="modifyButton" class="button" value="뒤로" 
			onclick="location.href='management.do'">
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

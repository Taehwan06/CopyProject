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
	
	<title>신고 목록</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/management/report_list.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/nav.js"></script>


</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		
		<div class="sectionTitle">
			신고 목록
		</div>
		
		<form name="sectionSearchFrm" id="sectionSearchFrm" action="">
			<select name="sectionSearchType" id="sectionSearchType">
				<option value="id">아이디</option>
				<option value="nick">닉네임</option>
				<option value="membername">성명</option>
				<option value="midx">회원번호</option>
				<option value="phone">연락처</option>
				
			</select>
			<input type="text" name="sectionSearchValue" id="sectionSearchValue" size="20">
			<input type="button" name="sectionSearchButton" id="sectionSearchButton" value="검색">
		</form>
		
		<table class="table table-responsive reprotTable">
			<thead>
				<tr>
					<th>제목</th>
					<th>신고자</th>
					<th>신고날짜</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href="">신고 합니다</a></td>
					<td>아이유</td>
					<td class="">2022년 3월 19일</td>
					<td class="">완료</td>
				</tr>
				<tr>
					<td><a href="">신고 합니다</a></td>
					<td>아이유</td>
					<td class="">2022년 3월 19일</td>
					<td class="">확인중</td>
				</tr>
			</tbody>
		</table>
		
		
		<nav aria-label="Page navigation example pagingArea">
		  <ul class="pagination pagination-sm justify-content-center pink">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">4</a></li>
		    <li class="page-item"><a class="page-link" href="#">5</a></li>
		    <li class="page-item"><a class="page-link" href="#">6</a></li>
		    <li class="page-item"><a class="page-link" href="#">7</a></li>
		    <li class="page-item"><a class="page-link" href="#">8</a></li>
		    <li class="page-item"><a class="page-link" href="#">9</a></li>
		    <li class="page-item"><a class="page-link" href="#">10</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		
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

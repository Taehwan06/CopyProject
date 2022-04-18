<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 부트스트랩 -->
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- Bootstrap icon CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
	
	<title>회원탈퇴 - 홈프렌즈</title>

	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/mypage/member_delete.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/mypage/member_delete.js"></script>
	<script src="/controller/js/login/join1.js"></script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %> 
	
	<!-- 본문 영역 -->	
	<section>
	<div class="container">
			<div class="row">
				<div class="col-12 coll-pull-12 coll-md-12 col-lg-12 col-xl-12 deleteWrap">
					<div class="del memberdelete_title">
						회원탈퇴 신청
					</div>
					<form name ="OutFrm"><!-- form start -->
					<div class="del delete_subtitle">
						 회원 탈퇴 신청에 앞서 아래 내용을 반드시 확인해주세요
					</div>
					<div class="del deleteBox">
							<p class="liTitle">회원탈퇴 시 처리내용</p>
								<ul>
									<li>홈프렌즈 마일리지는 소멸되며 환불되지 않습니다.</li>
									<li>홈프렌즈 구매 정보가 삭제됩니다.</li>
									<li>소비자보호에 관한 법률 제6조에 의거,계약 또는 청약철회 등에 관한 기록은 5년, 대금결제 및 재화등의 공급에 관한 기록은 5년, 소비자의 불만 또는 분쟁처리에 관한 기록은 3년 동안 보관됩니다. 동 개인정보는 법률에 의한 보유 목적 외에 다른 목적으로는 이용되지 않습니다.</li>
								</ul>
							
							<p class="liTitle">회원탈퇴 시 게시물 관리</p>
								<ul>
									<li>회원탈퇴 후 홈프렌즈 서비스에 입력한 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로 게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다. 게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후, 탈퇴를 신청하시기 바랍니다.</li>
								</ul>
							
							<p  class="liTitle">회원탈퇴 후 재가입 규정</p> 
								<ul>
									<li>탈퇴 회원이 재가입하더라도 기존의 마일리지는 이미 소멸되었기 때문에 양도되지 않습니다.</li>
								</ul>
					</div>
					<div class="del deleteConfirm">
						  <input type="checkbox" id="check1" name="del_yn" value="Y">
        					<label for="check1"></label>
							&nbsp;위 내용을 모두 확인하였습니다		
					</div>
					<div class="del delete_subtitle">
						 홈프렌즈 이용중 어떤 부분이 불편하셨나요?
					</div>
					<div class="del delete_uncofortable">
						홈프렌즈를 떠나는 이유를 자세히 알려주시겠어요? 여러분의 소중한 의견을 반영해 더 좋은 서비스로 꼭 찾아뵙겠습니다.
					</div>
					<div class="del deleteBox">
						<textarea name="del_cause" placeholder="자세한 내용을 남겨주시면 서비스 개선에 큰 도움이 됩니다."></textarea>
					</div>
					<div class="del deleteBtn">
						<button id="delApply" onclick = "goOutFn()">탈퇴하기</button>
						<button type="button" id="delCancel" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage.do'">취소하기</button>
					</div>
					</form>
				</div>
			</div>
	</div>
					
	
	</section>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/controller/js/login/join2.js"></script>

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
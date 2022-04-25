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
	<script>var contextPath = "${pageContext.request.contextPath}"</script>

	<title>나의 문의 - 홈프렌즈</title>

	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/mypage/my_QnA.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
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
				<div class="mydivtitle mydiv2-2">나의 문의</div>
				<div class="mydivVacant"></div>
				<c:set var="length" value="${fn:length(QnAlist)}" />
				<c:choose>
					<c:when test="${length eq 0}">
					<div id="mycomment">	
						<div class="row">
							<p class="no">아직 등록된 문의글이 없습니다.</p>
						</div>
					</div>
					</c:when>
					
					<c:when test="${length ne 0}">
						<c:forEach items="${QnAlist}" var="vo" varStatus="cnt">
						<div id="mycomment">	
						<div class="row">
							<div class="col-8">
								<p class="p1">
									<i class="bi bi-question-circle-fill chat"></i>
									<a href="${pageContext.request.contextPath}/store/store_view.do?spidx=${vo.spidx}#QnAwrite">${vo.content}</a>
								</p>
								<p class="p3">
									<strong>${vo.brand}</strong>&nbsp;
									${vo.title} &nbsp;&#183;&nbsp;
									${vo.write_date} 
								</p>
								<p class="p4">
									<c:set var="state" value="${vo.answer}"/>
									<c:choose>
										<c:when test="${state eq 'Y'}">
											<strong style="color:#87ceeb;">답변완료</strong>&nbsp;
											<a href="${pageContext.request.contextPath}/store/store_view.do?spidx=${vo.spidx}#QnAwrite">${vo.answer_content}</a>
										</c:when>
										<c:when test="${state eq 'N'}">
											<strong style="color:#ff8da1;">답변예정</strong>&nbsp;
										</c:when>
									</c:choose>
								</p>	
							</div>
							<div class="col-4 comment2">
								<a href="${pageContext.request.contextPath}/store/store_view.do?spidx=${vo.spidx}"><img src="${pageContext.request.contextPath}/image/${vo.img_system}"></a>
							</div>
							<div class="mydivVacant"></div>
						</div>
						</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div><!-- mydiv2 -->
		</div><!-- row -->
		<br><br><br><br>
	</div><!-- container -->
	</section>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	

	<%@ include file="../footer.jsp" %>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
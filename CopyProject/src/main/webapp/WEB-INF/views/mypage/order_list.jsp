<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <!-- SweetAlert  -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- kakao SDK -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- naver SDK -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <!-- facebook SDK -->
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>
    
	<title>주문배송조회 - 홈프렌즈</title>
	
		
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/mypage/order_list.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script> 
	<script src="${pageContext.request.contextPath}/js/mypage/order_list.js"></script>
	
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %> 
	
	<!-- 본문 영역 -->	
	<section>
	<div class="container">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12 col-xl-12">
					<form>
					<div class="row">
						<div id="OList1">
							<div class="sbox state col-2" id="payOk">
								<i class="bi bi-credit-card listIcon"></i><br>
								결제완료<br>
								<span class="pinkNum">${count1}</span>
							</div>
							<div class="sbox direction">
								<i class="bi bi-caret-right"></i>
							</div>
							<div class="sbox state col-2">
								<i class="bi bi-box-seam listIcon"></i><br>
								배송준비중<br>
								<span class="pinkNum">${count2}</span>
							</div>
							<div class="sbox direction">
								<i class="bi bi-caret-right"></i>
							</div>
							<div class="sbox state col-2">
								<i class="bi bi-truck listIcon"></i><br>
								배송중<br>
								<span class="pinkNum">${count3}</span>
							</div>
							<div class="sbox direction">
								<i class="bi bi-caret-right"></i>
							</div>
							<div class="sbox state col-2">
								<i class="bi bi-house listIcon"></i><br>
								배송완료<br>
								<span class="pinkNum">${count4}</span>
							</div>
						</div>
					</div>
						<div id="OList2"><!-- 주문 배송 조회 박스 -->
				<!-- =============================================== -->
							<div class="filter"><!-- 필터 -->
								<!-- <select name="day" class="selectgood">
									<option value="not">----</option>
									<option value="month">한달</option>
									<option value="3months">3개월</option>
									<option value="6months">6개월</option>
									<option value="1year">1년</option>
								</select> -->
								<select id ="stateBar" name="stateBar" class="selectgood" onchange="stateFn()">
									<option value="default">----</option>
									<option value="pay">결제완료</option>
									<option value="ready">배송준비중</option>
									<option value="ing">배송중</option>
									<option value="complete">배송완료</option>
								</select>
								<input type="button" id="Go_reset" value="초기화" onclick="location.href='${pageContext.request.contextPath}/mypage/order_list.do'">
							</div>
				<!-- =============================================== -->		
							<div class="product">
							<c:forEach items="${orderList2}" var="orderList2" varStatus="cnt">
								<div class="row">
									<div class="col-6 buyDate">
										${orderList2.buying_date}
										<%-- 주문번호:${orderList2.ordernumber} (${orderList2.buying_date}) --%>
									</div>
									<div class="col-6 goDatail">
										<a href="${pageContext.request.contextPath}/mypage/detailOrder.do?spidx=${orderList2.spidx}&ordernumber=${orderList2.ordernumber}" id="goDetail">상세보기 <i class="bi bi-chevron-right detailIcon"></i></a>
									</div>
									<hr>
								</div>
								<div class="row odrNdelBox">
									<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3 productPic">
										<a href="${pageContext.request.contextPath}/store/store_view.do?spidx=${orderList2.spidx}"><img src="${pageContext.request.contextPath}/image/${orderList2.img_system}"></a>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6 productInfo">
										<a href="${pageContext.request.contextPath}/store/store_view.do?spidx=${orderList2.spidx}">${orderList2.title}&nbsp;</a>| ${orderList2.cnt} 개 <br>
										<span class="producSpan">${orderList2.progress} | 일반택배</span>
									</div>
									
									<div id="price${cnt.count}" class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3 productInfo">
                        		    </div> 
                         			  <script>$("#price${cnt.count}").text((${orderList2.price}).toLocaleString()+" 원");</script>
									
									<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12 productBtn">
										<button type="button" id="delTrack" onclick= "javascript:window.open('https://www.cjlogistics.com/ko/tool/parcel/tracking');void(0)">배송추적</button>
										<c:choose>
											<c:when test = "${orderList2.review_registration eq 'N' && orderList2.progress eq '배송완료'}">
												<input type="button" class="goReview" onclick="location.href='${pageContext.request.contextPath}/store/store_review_insert.do?spidx=${orderList2.spidx}'" value="리뷰작성">
											</c:when>
											<c:when test = "${orderList2.review_registration eq 'N' && orderList2.progress ne '배송완료'}">
												<input type="button" class="goReview" onclick="yet();" value="리뷰작성">
											</c:when>
											<c:when test = "${orderList2.review_registration eq 'Y'}">
												<input type="button" class="goReview"  onclick="already();" value="리뷰완료">
											</c:when>
										</c:choose>
									</div> 
								</div> 
								<div class="row">
									<div class="col-12 delState">
									  <c:set var = "delMoney" value = "${orderList2.delivery_charge}"/>
									  <c:choose>
										   <c:when test = "${delMoney eq '0'}">
										   	 무료배송
										   </c:when>
										   <c:when test="${delMoney =! '0'}">
										   	 유료배송(${orderList2.delivery_charge}원)
										   </c:when>
									 </c:choose>
									</div>
								</div>
								<br><br>
							</c:forEach>
							</div>
				<!-- =============================================== -->
				<!-- =============================================== -->
						</div><!-- 주문 배송 조회 박스 닫힘 -->
					</form>
				</div><!-- col tag 닫힘 -->
			</div><!-- row 닫힘 -->
	</div><!-- container 닫힘 -->
	</section>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/join2.js"></script>

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
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
	
	<title>홈프렌즈 상품 상세보기 페이지 입니다.</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/home.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<link href="/controller/css/store/view.css" rel="stylesheet">
	<script src="/controller/js/store/store_view.js"></script>
	<script src="/controller/js/footer.js"></script>
	
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section id="Shop_area">
		<div class="row" id="store_category">
			<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">가구>소파</div>
		</div>
		<div class="row" id="shop_content">
			<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
				<img src= "/controller/image/shop05.webp" class="shopImg" onclick="">
			</div>
			<div class="col-sm-11 col-md-5 col-lg-5 col-xl-5 content">
				<div class="row">
					<div class="col-sm-2 col-md-2 brand">${vo.brand}</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 col-md-10 shop_subject">${vo.title}</div>
					<div class="col-sm-1 col-md-1"></div>
				</div>
				<div class="row price">
					<div class="col-sm-4 col-md-4 col-lg-3 discount">${vo.discount}%</div>
					<div class="col-sm-7 col-md-7 original_price">${vo.sale_price}원</div>
				</div>
				<div class="row delivery">
					<div class="col-sm-2 col-md-2 delivery_">배송</div>
					<div class="col-sm-4 col-md-4 delivery__">배송 상품정보 참고</div>
				</div>
				<div class="row selectbox">
					<select class="form-select form-select-lg">
						<option value="00" selected>상품을 선택하세요.</option>
						<option value="01" data-image="/shop05.webp">${vo.product_name}</option>
					</select>
				</div>
				<div class="row order_price">
					<div class="col-sm-6 col-md-6 order_price_">주문금액</div>
					<div class="col-sm-6 col-md-6 order_price__"><span>0</span>원</div>
				</div>
				<div class="row btn_area">
					<div class="col-6 col-sm-6 col-md-6"><button id="basket_btn" onclick="">장바구니</button></div>
					<div class="col-6 col-sm-6 col-md-6"><button id="buy_btn" onclick="location.href=''">바로구매</button></div>
				</div>
			</div>
		</div>
	</section>
		<article>
			<div class="row information">
				<div class="col-md-1 col-lg-1 col-xl-1" id="hiddenDiv"></div>
				<div class="col-3 col-sm-3 col-md-2 col-lg-2 col-xl-1 _product" onclick="locationFn('product')">상품정보</div>
				<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-2 _review" onclick="locationFn('review')">리뷰<span>${vo.review_cnt}</span></div>
				<div class="col-3 col-sm-3 col-md-2 col-lg-3 col-xl-2 _QnA" onclick="locationFn('QnA')">문의<span>6,109</span></div>
				<div class="col-3 col-sm-3 col-md-2 col-lg-2 col-xl-2 _change" onclick="locationFn('change')">배송/환불</div>
			</div>
		</article>
	<section id="Com_area">
		<div class="row">
			<div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8 information_area">
				<div id="shop_information_area_header">
					상품정보
				</div>
				<div id="shop_information_area"><!-- 사이즈지정필요 -->
					${vo.content}
				</div>
				<div id="review_area_header">
					<div>리뷰 <span>${vo.review_cnt}</span></div>
					<div id="reviewwrite">리뷰쓰기</div>
				</div>
				<div id="review_area">
					<img src= "/controller/image/review01.PNG">
					<img src= "/controller/image/review02.PNG">
				</div>
				<div id="QnA_area_header">
					<div>문의 <span>6,106</span></div>
					<div id="QnAwrite">문의하기</div>
				</div>
				<div id="QnA_area">
					<img src= "/controller/image/QnA.PNG">
				</div>
				<div id="delivery_area_header">
					<div>배송</div>
				</div>
				<div id="delivery_area">
					<table id="delivery_table">
						<tbody>
							<tr>
								<td>배송</td>
								<td>일반택배</td>
							</tr>
							<tr>
								<td>배송비</td>
								<td>
									<c:choose>
									    <c:when test="${vo.free_delivery eq 'Y'}">
									        무료배송
									    </c:when>
									    <c:otherwise>
									        ${vo.delivery_charge}
									    </c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td>도서산간 추가 배송비</td>
								<td>5,000원</td>
							</tr>
							<tr>
								<td>배송불가 지역</td>
								<td>배송불가 지역이 없습니다.</td>
							</tr>
							<tr>
								<td>지역별 차등 배송비</td>
								<td>제주도5,000원, 그 외 도서산간 10,000원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="change_area_header">
					<div>교환/환불</div>
				</div>
				<div id="change_area">
					<table id="change_table">
						<tr>
							<td>반품배송비</td>
							<td>5,000원 (최초 배송비가 무료인 경우 10,000원 부과)</td>
						</tr>
						<tr>
							<td>교환배송비</td>
							<td>10,000원</td>
						</tr>
						<tr>
							<td>보내실 곳</td>
							<td>전라북도 전주시 덕진구 금암1동 667-52 전주 이젠컴퓨터학원</td>
						</tr>
					</table>
				</div>
				<div id="change_content">
					<div id="change_content_header1">
						반품/교환 사유에 따른 요청 가능 기간
					</div>
					<div id="change_content_">
						반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.
					</div>
					<div id="change_content__">
						<ul>
							<li>
								구매자 단순 변심은 상품 수령 후 7일 이내 <span>(구매자 반품배송비 부담)</span>
							</li>
							<li>
								표시/광고와 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내.<br>
								둘 중 하나 경과 시 반품/교환 불가 <span>(판매자 반품배송비 부담)</span>
							</li>
						</ul>
					</div>
					<div id="change_content_header2">
						반품/교환 불가능 사유
					</div>
					<div id="change_impossible_">
						아래와 같은 경우 반품/교환이 불가능합니다.
					</div>
					<div id="change_impossible__">
						<ul>
							<li>
								반품요청기간이 지난 경우
							</li>
							<li>
								구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 <span>(단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</span>
							</li>
							<li>
								포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우 <span>(예: 식품, 화장품)</span>
							</li>
							<li>
								구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 <span>(라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)</span>
							</li>
							<li>
								시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우 <span>(예: 식품, 화장품)</span>
							</li>
							<li>
								고객주문 확인 후 상품제작에 들어가는 주문제작상품
							</li>
							<li>
								복제가 가능한 상품 등의 포장을 훼손한 경우 <span>(CD/DVD/GAME/도서의 경우 포장 개봉 시)</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="buy_area">
				<div class="buy_area_">
					<div class="selectbox_">
						<select class="form-select form-select-lg">
							<option value="00" selected>상품을 선택하세요.</option>
							<option value="01"">마스 3인용 헤드틸팅 아쿠아텍스 소파</option>
						</select>
					</div>
					<div class="hidden_area"></div>
					<div class="price___">
						주문금액<span>0원</span>
					</div>
					<div class="buy_btn_area">
						<button id="basket_btn2">장바구니</button>
						<button id="buy_btn2">바로구매</button>
					</div>
				</div>
			</div>
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
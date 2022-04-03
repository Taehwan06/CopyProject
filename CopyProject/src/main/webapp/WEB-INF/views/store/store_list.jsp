<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL사용하기위한 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/home.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<link href="/controller/css/store/store_list.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/home.js"></script>
	<script src="/controller/js/store/store_list.js"></script>
	
	<title>store_list</title>
	
</head>
<body>

	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	<!-- 본문내용 -->
	<section>
		<div class="row">

			<!-- 좌측 카테고리바 -->
			<div class="col-12 col-md-2 store_list_side-bar">
				<div class="accordion accordion-flush" id="accordionFlushExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        <span class="category_link" id="furniture">가구</span>
				      </button>
				    </h2>
				    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body">
				      	<ul class="category_ul">
							<li class="category_link2" id="11">소파</li>
							<li class="category_link2" id="12">수납장</li>
							<li class="category_link2" id="13">의자</li>
							<li class="category_link2" id="14">침대</li>
							<li class="category_link2" id="15">테이블</li>
							<li class="category_link2" id="16">화장대</li>
						</ul>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        <span class="category_link" id="light">조명</span>
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body">
				      	<ul class="category_ul">
							<li class="category_link2" id="21">LED</li>
							<li class="category_link2" id="22">단스텐드</li>
							<li class="category_link2" id="23">장스텐드</li>
							<li class="category_link2" id="24">무드등</li>
							<li class="category_link2" id="25">천장등</li>
						</ul>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
				        <span class="category_link" id="bedding">침구</span>
				      </button>
				    </h2>
				    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body">
				      	<ul class="category_ul">
							<li class="category_link2" id="31">베게</li>
							<li class="category_link2" id="32">이불</li>
							<li class="category_link2" id="33">커버</li>
							<li class="category_link2" id="34">커튼</li>
							<li class="category_link2" id="35">쿠션 & 방석</li>
						</ul>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingFour">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
				        <span class="category_link" id="appliances">가전제품</span>
				      </button>
				    </h2>
				    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body">
				      	<ul class="category_ul">
							<li class="category_link2" id="41">냉장고</li>
							<li class="category_link2" id="42">TV</li>
							<li class="category_link2" id="43">세탁기</li>
							<li class="category_link2" id="44">에어컨</li>
							<li class="category_link2" id="45">청소기</li>
						</ul>
					</div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingFive">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
				        <span class="category_link" id="kitchen">주방용품</span>
				      </button>
				    </h2>
				    <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body">
				      	<ul class="category_ul">
							<li class="category_link2" id="51">그릇 & 접시</li>
							<li class="category_link2" id="52">냄비 & 팬</li>
							<li class="category_link2" id="53">보관 용기</li>
							<li class="category_link2" id="54">수저</li>
							<li class="category_link2" id="55">식기건조대</li>
							<li class="category_link2" id="56">컵</li>
						</ul>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingSix">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
				        <span class="category_link" id="daily">생활용품</span>
				      </button>
				    </h2>
				    <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body">
				      	<ul class="category_ul">
							<li class="category_link2" id="61">욕실</li>
							<li class="category_link2" id="62">수건</li>
							<li class="category_link2" id="63">청소</li>
							<li class="category_link2" id="64">세탁</li>
							<li class="category_link2" id="65">생활잡화</li>
						</ul>
				      </div>
				    </div>
				  </div>
				</div>
			</div>

			<!-- 컨텐츠영역 -->
			<div class="store_list_content col-12 col-md-9 margin_auto padding_0">
				<!-- 해당 카테고리 -->
				<div id="store_main_Title" class="storeTitle">
					
					<c:if test="${not empty param.category}">
						<script>
							var title = match[${param.category}];
							$("#store_main_Title").text(title);
						</script>
					</c:if>
					<c:if test="${not empty param.detail}">
						<script>
							var title = match[${param.detail}];
							$("#store_main_Title").text(title);
						</script>
					</c:if>
					<c:if test="${not empty param.type}">
						<script>
							var title = match["${param.type}"];
							$("#store_main_Title").text(title);
						</script>
					</c:if>
				</div><!-- 카테고리타입 가져올것 --><!-- ---------------- -->
				<!-- 정렬방식 -->
				<!-- home_list에서 가져옴 -->
				<div class="row" id="sectionDiv">
					<ul class="col-3 col-sm-2 col-md-2 col-lg-2 col-xl-2 list_">
						<li>
							<button id="free" class="list_btn" onClick="listFn(this)">무료배송</button>
						</li>
					</ul>
					<ul class="col-3 col-sm-2 col-md-2 col-lg-2 col-xl-2 list_">
						<li>
							<button class="price_btn">가격지정</button>
						</li>
					</ul>
					<ul class="col-2 col-sm-5 col-md-5 col-lg-6 col-xl-6"></ul>
					<ul class="col-3 col-sm-2 col-md-2 col-lg-2 col-xl-2 list_">
						<li>
							<select class="sort">
								<option>구매순</option>
								<option class="">별점순</option>
								<option>가격높은순</option>
								<option>가격낮은순</option>
							</select>
						</li>
					</ul>
					
				</div>
				
				<div id="pricePopup" class="popout popout--prepared popout--axis-1 popout--dir-0 popout--cross-dir-0"
					 data-popout="true">
					<div class="animated-popout drop-down__content panel-drop-down__content property-filter-bar-drop-down open open-active">
						<div class="drop-down-panel" data-panel-title="가격" data-panel-parents="">
							<section class="property-filter-panel-range-control">
								<div class="property-filter-panel-range-control__input-row">
									<span class="property-filter-panel-range-control__input-row__cell">
										<span class="property-filter-panel-range-control__input-row__input-wrap">
											<input id="priceStart" type="text" width="5" placeholder="0" class="numberOnly property-filter-panel-range-control__input-row__input" value="">
										</span>
										<span class="property-filter-panel-range-control__input-row__footer">원</span>
									</span>
									<span class="property-filter-panel-range-control__input-row__separator">~</span>
									<span class="property-filter-panel-range-control__input-row__cell">
										<span class="property-filter-panel-range-control__input-row__input-wrap">
											<input id="priceEnd"  type="text" width="5" placeholder="69,930,000" class="numberOnly property-filter-panel-range-control__input-row__input" value="">
										</span>
										<span class="property-filter-panel-range-control__input-row__footer">원</span>
									</span>
									<button id="priceSelected"  class="property-filter-panel-range-control__input-row__button" type="button">적용</button>
								</div>

							</section>
						</div>
					</div>
				</div>
				
				<!-- 컨텐츠 선택카테고리 물품 -->
				<div id="deal">
					<div class="row shopList">
						<c:forEach items="${list}" var="vo" varStatus="cnt">
						<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop" onClick="location.href='/controller/store/store_view.do?spidx=${vo.spidx}'">
							<img src="${vo.img_origin}" class="shopImg">
							<div class="shopText">
								<div class="shopTitle">
									<div class="brand">${vo.brand}</div>
									${vo.title}
								</div>
								<div class="shopPrice">
									<span class="red">${vo.discount}%</span> ${vo.sale_price}
								</div>
								<span class="sky">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
										<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
								</span>
								<b>${vo.score}</b> <span class="gray">리뷰 ${vo.review_cnt}</span>
							</div>
						</div>
						</c:forEach>
						
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
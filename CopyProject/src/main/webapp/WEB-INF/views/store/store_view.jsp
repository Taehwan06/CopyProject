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
	
	<title>${vo.title} - 홈프렌즈</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/home.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<link href="/controller/css/store/view.css" rel="stylesheet">
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/store/view.js"></script>
	<script src="/controller/js/footer.js"></script>
	<script>
		var spidx=${vo.spidx};
		var price=${vo.sale_price};
		var loginYN=${!empty loginUser};
		var midx = "${loginUser.midx}";
		
	</script>
	
	<style>
	
	</style>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	<c:if test="${loginUser.grade eq null}">
		<c:set var="midx" value="${loginUser.midx}" />
	</c:if>
	<c:set var="spidx" value="${vo.spidx}" />
	<c:set var="title" value="${vo.title}" />
	<c:set var="delivery_charge" value="${vo.delivery_charge}" />
	<c:set var="free_delivery" value="${vo.free_delivery}" />
	<c:set var="img_origin" value="${vo.img_origin}" />
	
	
	

	<!-- 본문 영역 -->
	<section id="Shop_area">
		<c:if test="${loginUser.grade eq 'A'}">
			<div id="sv_md">
				<button onClick="location.href='/controller/store/store_modify.do?spidx=${vo.spidx}'">상품수정</button>
				<button onClick="delFn()">상품삭제</button>
			</div>
		</c:if>
		<div class="row" id="store_category">
			<div id="store_main_Title" class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
				<c:if test="${not empty vo.detail}">
					<script>
						var title = match[${vo.detail}];
						$("#store_main_Title").text(title);
					</script>
				</c:if>
			</div>
		</div>
		<div class="row" id="shop_content">
			<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
				<img src= "${vo.img_origin}" class="shopImg" onClick="">
			</div>
			<div class="col-sm-11 col-md-5 col-lg-5 col-xl-5 content">
				<div class="row">
					<div class="col-sm-2 col-md-2 brand">${vo.brand}</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-10 col-md-10 shop_subject">${vo.title}</div>
					<div class="col-sm-2 col-md-2 like">
						<div onclick="likeFn(${islikey})">
							<c:choose>
								<c:when test="${islikey eq 0}">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
									  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
									</svg>
								</c:when>
								<c:otherwise>
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
									</svg>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="row price">
					<div class="col-sm-4 col-md-4 col-lg-3 discount">${vo.discount}%</div>
					<div class="col-sm-7 col-md-7 original_price"> ${vo.sale_price}원</div>
				</div>
				<div class="row delivery">
					<div class="col-sm-2 col-md-2 delivery_">배송</div>
					<div class="col-sm-4 col-md-4 delivery__">
						<c:choose>
						    <c:when test="${vo.free_delivery eq 'Y'}">
						        무료배송
						    </c:when>
						    <c:otherwise>
						        ${vo.delivery_charge}원
						    </c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="row selectbox">
					<select class="form-select form-select-lg">
						<option value="00" selected>상품을 선택하세요.</option>
						<option value="01" data-image="/shop05.webp" onClick="">${vo.product_name}</option>
					</select>
				</div>
				
				<div class="row order_price">
					<div class="col-sm-6 col-md-6 order_price_">
						<select id="selectCnt" class="form-control" style="width: 70px; text-align: center;" onChange="cntFn()">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10+</option>
						</select>
						<input class="hiddenCnt" type="number" value="1" style="width: 70px; text-align: center;" onChange="cntFn2()">
					</div>
					<div class="col-sm-6 col-md-6 order_price__">주문금액:<span class="sum_price">${vo.sale_price}</span>원</div>
				</div>
				<div class="row btn_area">
					<div class="col-6 col-sm-6 col-md-6"><button id="basket_btn" onClick="basketInFn()">장바구니</button></div>
					<div class="col-6 col-sm-6 col-md-6"><button id="buy_btn" onClick="paymentInFn()">바로구매</button></div>
				</div>
			</div>
		</div>
	</section>
		<article>
			<div class="row information">
				<div class="col-md-1 col-lg-1 col-xl-1" id="hiddenDiv"></div>
				<div class="col-3 col-sm-3 col-md-2 col-lg-2 col-xl-1 _product" onClick="locationFn('product')">상품정보</div>
				<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-2 _review" onClick="locationFn('review')">리뷰<span>${vo.review_cnt}</span></div>
				<div class="col-3 col-sm-3 col-md-2 col-lg-3 col-xl-2 _QnA" onClick="locationFn('QnA')">문의<span>${vo.qna_cnt}</span></div>
				<div class="col-3 col-sm-3 col-md-2 col-lg-2 col-xl-2 _change" onClick="locationFn('change')">배송/환불</div>
			</div>
		</article>
	<section id="Com_area">
		<div class="row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-8 information_area">
				<div id="shop_information_area_header">
					상품정보
				</div>
				<div id="shop_information_area"><!-- 사이즈지정필요 -->
					${vo.content}
					<button id="moreview_button" class="moreview" onclick="moreview()">더보기</button>
				</div>
				<div id="review_area_header">
					<div>리뷰 <span>${vo.review_cnt}</span></div>
					<!-- <div id="reviewwrite" onclick="location.href='store_review_insert.do?spidx=${vo.spidx}'">리뷰쓰기</div> -->
				</div>
				<div id="review_area">							
					<section id="reply_area">
						<ul class="reply_list">
							<c:forEach items="${rvo}" var="rvo">
								<li class="reply_list_item">
									<article class="reply_item_">
										<p class="reply_item_content">
											<a class="reply_item_content_writer" href="">${rvo.nick_name}
												<img class="reply_item_content_writer_image" src="/controller/image/${rvo.profile_system }">
											</a>
											<time class="reply_item_footer_time">
												<c:if test="${rvo.modify_yn == 'N' }">
													${rvo.write_date}
												</c:if>
												<c:if test="${rvo.modify_yn == 'Y'}">
													${rvo.modify_date}(수정됨)
												</c:if>
											</time>
											<c:if test="${loginUser.midx eq rvo.midx}">
												<span class="A_write" onclick="R_modifyFn(${rvo.sridx})">수정하기</span>
												<span class="A_write" onclick="R_delFn(${rvo.sridx})">삭제하기</span>
											</c:if>
										</p>
										<footer class="reply_item_footer">
											<div style="position: absolute;top: 0px;">
											<c:set var="star" value="${rvo.score}" />
											<span class="sky">
											<c:forEach begin="0" end="4" varStatus="status">
												<c:if test="${status.index < star}">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
													<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
												</c:if>
											</c:forEach>
											</span>
											</div>
										</footer>
										
									</article>
									<div style="margin:30px 0px 0 20px;">
									<c:if test="${not empty rvo.img_origin && rvo.img_origin ne ''}">
										<div style="padding: 5px; width: 150px; height: 150px;"><img alt="" src="${rvo.img_origin}" style="width: 100%; height: 100%;border-radius: 5px;"> </div>
									</c:if>
										<div style="padding: 10px;">${rvo.content}</div>
									</div>
								</li>
							</c:forEach>
						</ul>
						
						<!-- 페이징 처리 -->
						<ul class="list-paginator">
							<li>
								<a class="list-paginator_first" href="store_view.do?spidx=${vo.spidx }&nowPage=${pvo.startPage}#review_area_header">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
									  <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
									</svg>
								</a>
							</li>
							<c:if test="${pvo.nowPage != pvo.startPage}">
								<li>
									<a class="list-paginator_prev" href="store_view.do?spidx=${vo.spidx }&nowPage=${pvo.nowPage-1}#review_area_header">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
										</svg>
									</a>
								</li>
							</c:if>
							<!-- 페이지 블럭 처음부터 마지막 블럭까지 1씩 증가하는 페이지 출력 -->
							<c:forEach var="num" begin="${pvo.startPage }" end="${pvo.endPage }">
								<c:choose>
									<c:when test="${num == pvo.nowPage }">
										<li>
											<a class="list-paginator_page sm selected" type="button">${num }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="store_view.do?spidx=${vo.spidx }&nowPage=${num}#review_area_header" class="list-paginator_page sm">${num }</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pvo.nowPage != pvo.lastPage}">
								<li>
									<a class="list-paginator_next" href="store_view.do?spidx=${vo.spidx }&nowPage=${pvo.nowPage+1}#review_area_header">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
										</svg>
									</a>
								</li>
							</c:if>
							<li>
								<a class="list-paginator_last" href="store_view.do?spidx=${vo.spidx }&nowPage=${pvo.lastPage }#review_area_header">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
									  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
									</svg>
								</a>
							</li>
						</ul>
					</section>
				</div>
				<div id="QnA_area_header">
					<div>문의 <span>${vo.qna_cnt}</span></div>
					<div id="QnAwrite" onClick="qnaInFn()">문의하기</div>
				</div>
				<div id="QnA_area">
					<ul class="qna_list">
						<c:forEach items="${qavo}" var="qna">
							<li class="qna_list_item">
								<div>
									<div>
										<span class="qna_qa">Q</span> ${qna.writer} <span class="qna_day">${qna.write_date}</span>
										<c:if test="${loginUser.grade eq 'A' && qna.answer eq 'N'}">
											<span class="A_write" onclick="A_writeFn(this,${qna.sqidx})">답변하기</span>
										</c:if>
										<c:if test="${loginUser.midx eq qna.midx}">
											<span class="A_write" onclick="Q_modifyFn(${qna.sqidx})">수정하기</span>
											<span class="A_write" onclick="Q_delFn(${qna.sqidx})">삭제하기</span>
										</c:if>
									</div>
									<div class="qna_content_font qna_q_back">${qna.content}</div>
								</div>
								<c:if test="${qna.answer ne 'N'}">
								<div class="qna_a_area">
									<div>
										<span class="qna_qa">A</span> ${qna.answer_writer} <span class="qna_day">${qna.answer_date}</span>
										<c:if test="${loginUser.grade eq 'A'}">
											<span class="A_write" onclick="A_modifyFn(this,${qna.sqidx})">수정하기</span>
											<span class="A_write" onclick="A_delFn(${qna.sqidx})">삭제하기</span>
										</c:if>
									</div>
									<div class="qna_content_font qna_a_back">${qna.answer_content}</div>
								</div>
								</c:if>
							</li>
						</c:forEach>
					</ul>
					<!-- 페이징 처리 -->
					<c:if test ="${vo.qna_cnt ne 0}">
						<ul class="list-paginator">
							<li>
								<a class="list-paginator_first" href="store_view.do?spidx=${vo.spidx }&qanowPage=${qapvo.startPage}#QnA_area_header">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
									  <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
									</svg>
								</a>
							</li>
							<c:if test="${qapvo.nowPage != qapvo.startPage}">
								<li>
									<a class="list-paginator_prev" href="store_view.do?spidx=${vo.spidx }&qanowPage=${qapvo.nowPage-1}#QnA_area_header">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
										</svg>
									</a>
								</li>
							</c:if>
							<!-- 페이지 블럭 처음부터 마지막 블럭까지 1씩 증가하는 페이지 출력 -->
							<c:forEach var="num" begin="${qapvo.startPage }" end="${qapvo.endPage }">
								<c:choose>
									<c:when test="${num == qapvo.nowPage }">
										<li>
											<a class="list-paginator_page sm selected" type="button">${num }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="store_view.do?spidx=${vo.spidx }&qanowPage=${num}#QnA_area_header" class="list-paginator_page sm">${num }</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${qapvo.nowPage != qapvo.lastPage}">
								<li>
									<a class="list-paginator_next" href="store_view.do?spidx=${vo.spidx }&qanowPage=${qapvo.nowPage+1}#QnA_area_header">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
										</svg>
									</a>
								</li>
							</c:if>
							<li>
								<a class="list-paginator_last" href="store_view.do?spidx=${vo.spidx }&qanowPage=${qapvo.lastPage }#QnA_area_header">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
									  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
									</svg>
								</a>
							</li>
						</ul>
						</c:if>
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
							<option value="01">${vo.product_name}</option>
						</select>
					</div>
					<div class="hidden_area"></div>
					<div class="price___">
						주문금액<span>0원</span>
					</div>
					<div class="buy_btn_area">
						<button id="basket_btn2" onClick="basketInFn()">장바구니</button>
						<button id="buy_btn2" onClick="">바로구매</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../footer.jsp" %>
	
	<script>
		var cnt=1;
		function basketInFn(){
			if(${!empty loginUser}){
				$.ajax({
					type : "GET",
					url : "basketIn.do",
					data : "midx="+${vo.midx}+"&spidx="+${vo.spidx}+"&cnt="+cnt,
					success : function(result) {
						if(result > 0){
							alert("장바구니에 담겼습니다.");
						}else{
							alert("장바구니에 담기지 못했습니다.");
						}
						
					}
				});
			}else{
				alert("로그인 후 이용가능 합니다.");
			}
		}
		
		function paymentInFn(){
			console.log(${spidx});
			if(${!empty loginUser}){
				location.href="/controller/mypage/directPayment.do"+"?midx="+"${loginUser.midx}"+"&spidx="+${vo.spidx}+"&cnt="+cnt;
			}else{
				alert("로그인 후 이용가능 합니다.");
			}
		}
	
	</script>
	
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
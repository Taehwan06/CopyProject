<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 모달 영역 -->
<!-- ====================================================================================== -->
<!-- ====================================================================================== -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">
					<img class="col-4" id="modalLogo" src="/controller/image/mainLogo.png" alt="메인 로고" 
					onclick="location.href='${pageContext.request.contextPath}'">
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body row">
			
				<form class="col-12" id="modalSearchFrm" name="modalSearchFrm">
		 			<input type="text" id="modalSearchInput" name="search_value">
		 			<button id="modalSearchButton" name="searchValue" onclick="modalSearchFn()">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
						</svg>
					</button>
				</form>
			
				<div class="col-4 modalMenu iconMenu">
					<button class="modalIconBtn" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage.do'">
						<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-person col-md-1 headerMenu" viewBox="0 0 16 16" id="modalMypage">
							
							<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
						</svg>
					</button>
				</div>

				<div class="col-4 modalMenu iconMenu">
					<button class="modalIconBtn" onclick="location.href='${pageContext.request.contextPath}/mypage/order_list.do'">
						<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-truck headerMenu" viewBox="0 0 16 16" id="modalDelivery">
							
							<path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
						</svg>
					</button>
				</div>

				<div class="col-4 modalMenu iconMenu">
					<button class="modalIconBtn" onclick="location.href='${pageContext.request.contextPath}/mypage/basket.do'">
						<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-cart2 headerMenu" viewBox="0 0 16 16" id="modalBasket">
							
							<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
						</svg>
					</button>
				</div>
				
				<div class="col-6 modalMenu modalLoginButton">
					<c:if test="${loginUser == null}">
						<input type="button" id="loginBtn" class="modalMenuBtn" onclick="location.href='${pageContext.request.contextPath}/login/login.do'" value="로그인">
					</c:if>
					<c:if test="${loginUser != null}">
						<input type="button" id="loginBtn" class="modalMenuBtn" onclick="location.href='${pageContext.request.contextPath}/login/logout.do'" value="로그아웃">
					</c:if>
				</div>
				<div class="col-6 modalMenu modalLoginButton">
					<c:if test="${loginUser == null}">
						<input type="button" id="joinBtn" class="modalMenuBtn" onclick="location.href='${pageContext.request.contextPath}/login/join.do'" value="회원가입">
					</c:if>
					<c:if test="${loginUser != null}">
						<div class="" id="modalProfile" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage.do'">
							<img id="modalProfileImg" src="/controller/image/${loginUser.profile_system}"> ${loginUser.nick_name}
						</div>
					</c:if>		
				</div>



				<!-- 아코디언 영역 -->
				<!-- ====================================================================================== -->
				<!-- ====================================================================================== -->
				<div class="accordion" id="accordionExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button modalTextMenu" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								스토어
							</button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<ul class="list-unstyled">
									<li class="detailMenu" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">카테고리</li>
									<li class="detailMenu" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do?type=sell_cnt'">베스트</li>
									<li class="detailMenu" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do?type=Discount'">핫딜</li>
									<li class="detailMenu" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do?type=review_cnt'">추천 상품</li>
									<li class="detailMenu" onclick="location.href='${pageContext.request.contextPath}/store/likey.do'">좋아요</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button collapsed modalTextMenu" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								홈 스토리
							</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<ul class="list-unstyled">
									<li class="detailMenu" onclick="location.href='${pageContext.request.contextPath}/community/home_story.do'">홈 스토리</li>
									<li class="detailMenu" onclick="location.href='${pageContext.request.contextPath}/community/following.do'">팔로잉</li>
									<li class="detailMenu" onclick="location.href='${pageContext.request.contextPath}/community/home_story.do'">스크랩</li>
									<li class="detailMenu" onclick="location.href='${pageContext.request.contextPath}/community/home_story.do'">질문 & 답변</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-8 modalTextMenu eventMenu" onclick="location.href='${pageContext.request.contextPath}/store/event.do'">
					이벤트
				</div>

			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>

<!-- 헤더 영역 -->
<!-- ====================================================================================== -->
<!-- ====================================================================================== -->
<header>
	<div class="row" id="headerDiv">
		
		<div class="col-4" id="spaceDiv"></div>
		<img class="col-4 col-pull-4 col-md-2 col-sm-3" id="logo" src="/controller/image/mainLogo.png" alt="메인 로고" 
		onclick="location.href='${pageContext.request.contextPath}'">
		<div class="col-2" id="spaceDiv"></div>
		
		<form class="col-md-6 col-sm-7" id="searchFrm" name="searchFrm">
 			<input type="text" id="searchInput" name="search_value">
 			<button id="searchButton" name="searchButton" onclick="searchFn()">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg>
			</button>
		</form>
		
		<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-list col-1 col-sm-1 headerMenu" data-bs-toggle="modal" data-bs-target="#exampleModal" viewBox="0 0 16 16" id="smallMenu" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
			<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
		</svg>
		

		<button class="iconBtn col-md-1" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage.do'">
			<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-person headerMenu" viewBox="0 0 16 16" id="mypage">
				<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
			</svg>
		</button>

		<button class="iconBtn col-md-1" onclick="location.href='${pageContext.request.contextPath}/mypage/order_list.do'">
			<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-truck headerMenu" viewBox="0 0 16 16" id="delivery">
				<path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
			</svg>
		</button>

		<button class="iconBtn col-md-1" onclick="location.href='${pageContext.request.contextPath}/mypage/basket.do'">
			<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-cart2 headerMenu" viewBox="0 0 16 16" id="basket">
				<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
			</svg>
		</button>

		<button class="iconBtn col-md-1" onclick="#">
			<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-tv headerMenu" 
			viewBox="0 0 16 16" id="viewList">
				<path d="M2.5 13.5A.5.5 0 0 1 3 13h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zM13.991 3l.024.001a1.46 1.46 0 0 1 .538.143.757.757 0 0 1 .302.254c.067.1.145.277.145.602v5.991l-.001.024a1.464 1.464 0 0 1-.143.538.758.758 0 0 1-.254.302c-.1.067-.277.145-.602.145H2.009l-.024-.001a1.464 1.464 0 0 1-.538-.143.758.758 0 0 1-.302-.254C1.078 10.502 1 10.325 1 10V4.009l.001-.024a1.46 1.46 0 0 1 .143-.538.758.758 0 0 1 .254-.302C1.498 3.078 1.675 3 2 3h11.991zM14 2H2C0 2 0 4 0 4v6c0 2 2 2 2 2h12c2 0 2-2 2-2V4c0-2-2-2-2-2z"/>
			</svg>
		</button>
	</div>

</header>
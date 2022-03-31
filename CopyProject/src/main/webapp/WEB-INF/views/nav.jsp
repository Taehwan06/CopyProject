<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav>
	<div id="mainNav">
		<ul class="row navbar list-unstyled" id="mainNavbar">
			<li class="col-sm-3 col-md-2 mainMenu" id="menuStore">
				<ul class="list-unstyled">
					<li onclick="location.href='${pageContext.request.contextPath}/store/store.do'">스토어</li>
					<li class="navSpaceLi"></li>
				</ul>
			</li>
			<li class="col-sm-3 col-md-2 mainMenu" id="menuComm">
				<ul class="list-unstyled">
					<li onclick="location.href='${pageContext.request.contextPath}/community/home_story.do'">커뮤니티</li>
					<li class="navSpaceLi"></li>
				</ul>		
			</li>
			<li class="col-sm-6 col-md-4 mainMenu" id="menuSearchlist">
				<ul class="list-unstyled">
					<li class="" id="searchListHover relative">
						<ul class="list-unstyled searchListUl absolute">
							<li class="searchListLi" id="searchListLiTitle">
								실시간 인기 검색어 순위<i class="bi bi-chevron-down listDown"></i>
							</li>
							<li class="">
								<ul class="list-unstyled" id="searchListUlHidden">
									<c:forEach items="${searchList}" var="searchListvo" varStatus="cnt">
										<li class="searchListLi"  
										onclick="location.href='${pageContext.request.contextPath}/search.do?search_value=${searchListvo.search_value}'">
											<span class="searchRank">${cnt.count}</span>${searchListvo.search_value}
										</li>															
									</c:forEach>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
			</li>
			<c:if test="${loginUser == null}">
				<li class="col-md-2 mainMenu" id="menuLogin" onclick="location.href='${pageContext.request.contextPath}/login/login.do'">로그인</li>
			</c:if>
			<c:if test="${loginUser != null}">
				<li class="col-md-2 mainMenu" id="menuLogout" onclick="location.href='${pageContext.request.contextPath}/login/logout.do'">로그아웃</li>
			</c:if>
			<c:if test="${loginUser == null}">
				<li class="col-md-2 mainMenu" id="menuJoin" onclick="location.href='${pageContext.request.contextPath}/login/join.do'">회원가입</li>
			</c:if>
			<c:if test="${loginUser != null}">
				<li class="col-md-2 mainMenu" id="navProfile" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage.do'">
					<img id="navProfileImg" src="/controller/image/${loginUser.profile_system}"> ${loginUser.nick_name}
				</li>
			</c:if>
		</ul>
	</div>
	<div id="subNav">
		<ul class="row navbar list-unstyled" id="subNavbar">
			<li class="col-sm-2 col-md-2" id="category" onclick="">
				<ul class="list-unstyled">
					<li id="categoryLi" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">카테고리</li>
					<li class="navSpaceLi"></li>
					<div class="categoryDiv">
						<ul class="list-unstyled categoryUl" id="">
							<li class="detailTitle" id="furniture" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">가구</li>
							<li class="detail" id="sofa" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">소파</li>
							<li class="detail" id="storage" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">수납장</li>
							<li class="detail" id="chair" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">의자</li>
							<li class="detail" id="bed" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">침대</li>
							<li class="detail" id="table" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">테이블</li>
							<li class="detail" id="dresser" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">화장대</li>
						</ul>
						<ul class="list-unstyled categoryUl" id="">
							<li class="detailTitle" id="light" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">조명</li>
							<li class="detail" id="led" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">LED 조명</li>
							<li class="detail" id="short_stand" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">단스텐드</li>
							<li class="detail" id="long_stand" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">장스텐드</li>
							<li class="detail" id="mood" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">무드등</li>
							<li class="detail" id="ceil" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">천장등</li>
							<li class="detail hidden" id="" onclick="">공란</li>
						</ul>
						<ul class="list-unstyled categoryUl" id="">
							<li class="detailTitle" id="bedding" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">침구</li>
							<li class="detail" id="pillow" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">배개</li>
							<li class="detail" id="bedclothes" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">이불</li>
							<li class="detail" id="cover" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">각종 커버</li>
							<li class="detail" id="curtain" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">커튼</li>
							<li class="detail" id="cushion" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">쿠션 & 방석</li>
							<li class="detail hidden" id="">공란</li>
						</ul>
						<ul class="list-unstyled categoryUl" id="">
							<li class="detailTitle" id="appliances" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">가전 제품</li>
							<li class="detail" id="fridge" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">냉장고</li>
							<li class="detail" id="tv" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">TV</li>
							<li class="detail" id="washer" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">세탁기</li>
							<li class="detail" id="airconditioner" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">에어컨</li>
							<li class="detail" id="vacuum" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">청소기</li>
							<li class="detail hidden" id="">공란</li>
						</ul>
						<ul class="list-unstyled categoryUl" id="">
							<li class="detailTitle" id="kitchen" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">주방 용품</li>
							<li class="detail" id="plate" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">그릇 & 접시</li>
							<li class="detail" id="pan" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">냄비 & 팬</li>
							<li class="detail" id="container" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">보관 용기</li>
							<li class="detail" id="spoon" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">수저</li>
							<li class="detail" id="dryer" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">식기건조대</li>
							<li class="detail" id="cup" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">컵 & 잔</li>
						</ul>
						<ul class="list-unstyled categoryUl" id="dailyUl">
							<li class="detailTitle" id="daily" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">생활 용품</li>
							<li class="detail" id="bath" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">욕실 용품</li>
							<li class="detail" id="towel" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">수건</li>
							<li class="detail" id="cleaning" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">청소 용품</li>
							<li class="detail" id="laundry" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">세탁 용품</li>
							<li class="detail" id="living" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do'">생활 잡화</li>
							<li class="detail hidden" id="">공란</li>
						</ul>
					</div>
				</ul>
			</li>
			<li class="col-sm-2 col-md-2 subMenu" id="best" onclick="location.href='${pageContext.request.contextPath}/store/store.do'">베스트</li>
			<li class="col-md-2 subMenu" id="hotdil" onclick="location.href='${pageContext.request.contextPath}/store/store.do'">핫딜</li>
			<li class="col-md-2 subMenu" id="recommend" onclick="location.href='${pageContext.request.contextPath}/store/store.do'">추천 상품</li>
			<li class="col-sm-2 col-md-2 subMenu" id="like" onclick="location.href='${pageContext.request.contextPath}/store/store.do'">좋아요</li>
			<li class="col-sm-2 col-md-2 subMenu" id="event" onclick="location.href='${pageContext.request.contextPath}/store/event_list.do'">이벤트</li>
		</ul>
	</div>
	<div id="subNav2">
		<ul class="row navbar list-unstyled" id="subNavbar2">
			<li class="col-sm-2 col-md-2 subMenu" id="community" onclick="location.href='${pageContext.request.contextPath}/community/home_story.do'">홈 스토리</li>
			<li class="col-sm-2 col-md-2 subMenu" id="following" onclick="location.href='${pageContext.request.contextPath}/community/following.do'">팔로잉</li>
			<li class="col-md-2 subMenu" id="scrab" onclick="location.href='${pageContext.request.contextPath}/community/home_story.do'">스크랩</li>
			<li class="col-md-2 subMenu" id="QnA" onclick="location.href='${pageContext.request.contextPath}/community/home_story.do'">질문 &amp; 답변</li>
			<li class="col-sm-2 col-md-2 subMenu"></li>
			<li class="col-sm-2 col-md-2 subMenu"></li>
		</ul>
	</div>
</nav>
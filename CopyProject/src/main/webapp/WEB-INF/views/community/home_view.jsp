<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
	
	<!-- sweet alert SDK -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- kakao SDK -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- facebook SDK -->
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
    <!-- naver SDK -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	<script>var contextPath = "${pageContext.request.contextPath}"</script>
	
	<title>홈 스토리 글 상세보기 - 홈프렌즈</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/community/home_view.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/community/home_story.js"></script>
	<script src="${pageContext.request.contextPath}/js/community/home_view.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js"></script>
	
	
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	
	<!-- 본문 영역 -->
	<div class="row MainImg">
		<img src="${pageContext.request.contextPath}/upload/${vo.img_system }">
	</div>
	<section id="story_area">
		<div class="comm_area col-10 col-sm-10 col-md-8 col-lg-8">
			<input type="hidden" id="cbidx" name="cbidx" value="${vo.cbidx }">
			<input type="hidden" name="fmidx" value="${vo.midx }">
			<div class="row comm_area_">
				<div class="comm_category">홈 스토리</div>
				<div class="comm_title">${vo.title }</div>
				<div class="col-8 col-sm-8 storyWriter">
					<div class="profile" onclick="location.href='${pageContext.request.contextPath}/mypage/Member_page.do?midx=${vo.midx}'">
						<div class="profile_img">
							<img class="writerImg" src="${pageContext.request.contextPath}/image/${vo.profile_system }">
						</div>
						<div class="profile_name">
							${vo.writer }
						</div>
						<div class="writedate">
							<c:if test="${vo.modify_yn == 'N' }">
								${vo.write_date }
							</c:if>
							<c:if test="${vo.modify_yn == 'Y' }">
								${vo.modify_date }(수정됨)
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-4 follow_btn">
					<c:if test="${isFollow == 0 && loginUser.midx != vo.midx && loginUser != null}">
						<button onclick="follow(${vo.midx})">+ 팔로우</button>
					</c:if>
					<c:if test="${loginUser == null}">
						<button onclick="ReNot()">+ 팔로우</button>
					</c:if>
					<c:if test="${isFollow != 0}">
						<button onclick="unfollow(${vo.midx})">- 언팔로우</button>
					</c:if>
					<c:if test="${loginUser.midx == vo.midx }">
					</c:if>
				</div>
			</div>
		</div>
		<div class="row content_area col-10 col-sm-10 col-md-8 col-lg-8">
			<div class="row content_img">
				${vo.content }
				<div id="footer_img_">
					<img src="${pageContext.request.contextPath}/image/footer_img.PNG">
				</div>
			</div>
		</div>
		<div class="btn_area col-11 col-sm-10 col-md-8 col-lg-8">
			<button type="button" onclick="location.href='home_list.do?&sort=recent'">목록</button>
		<c:if test="${loginUser.midx == vo.midx }">
			<button type="button" onclick="location.href='home_modify.do?cbidx='+${vo.cbidx}">수정</button>
			<button type="button" onclick="del()">삭제</button>
			<form name="delfrm" action="home_delete.do" method="post">
				<input type="hidden" id="cbidx" name="cbidx" value="${vo.cbidx }">
			</form>
		</c:if>
			
		</div>
		<div class="content_stats col-10 col-sm-10 col-md-8 col-lg-8">
			<div>스크랩<span>${vo.scrap_cnt }</span></div>
			<div>댓글<span>${vo.reply_cnt }</span></div>
			<div>조회<span>${vo.hit_cnt }</span></div>
		</div>
		<div class="footer_profile col-10 col-sm-10 col-md-8 col-lg-8">
			<div class="footer_profile_img">
				<img class="footer_writerImg" src="${pageContext.request.contextPath}/image/${vo.profile_system }" onclick="location.href='${pageContext.request.contextPath}/mypage/Member_page.do?midx=${vo.midx}'">
				<span id="footer_writerImg_span" onclick="location.href='${pageContext.request.contextPath}/mypage/Member_page.do?midx=${vo.midx}'">${vo.writer }</span>
				<c:if test="${isFollow == 0 && loginUser.midx != vo.midx && loginUser != null}">
					<button onclick="follow(${vo.midx})">팔로우</button>
				</c:if>
				<c:if test="${loginUser == null}">
					<button onclick="ReNot()">팔로우</button>
				</c:if>
				<c:if test="${isFollow != 0}">
					<button onclick="unfollow(${vo.midx})">언팔로우</button>
				</c:if>
				<c:if test="${loginUser.midx == vo.midx }">
				</c:if>
			</div>
		</div>
	</section>
	<!-- 댓글 영역 -->
	<section id="reply_area" class="col-10 col-sm-10 col-md-8 col-lg-6">
		<h1 class="reply_area">
			댓글&nbsp;<span>${vo.reply_cnt }</span>
		</h1>
		<!-- 댓글 등록 -->
		<c:if test="${loginUser != null}">
			<form id="replyFrm" name="replyFrm" method="post">
				<input type="hidden" id="origin_cbridx" name="origin_cbridx" value="0">
				<input type="hidden" id="cbidx" name="cbidx" value="${vo.cbidx }">
				<input type="hidden" id="midx" name="midx" value="${loginUser.midx }">
				<input type="hidden" name="writer" value="${loginUser.nick_name }">
				<div class="reply_writer">
					<img src="${pageContext.request.contextPath}/image/${loginUser.profile_system }">
				</div>
				<div class="reply_input">
					<div class="reply_content">
						<div class="reply_content_input">
							<textarea name="content" class="reply_content_input_text reply_content_form_text" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)" onkeyup="adjustHeight()"></textarea>
						</div>
					</div>
					<div class="reply_action">
						<button class="reply_submit" aria-label="등록" type="button">등록</button>
					</div>
				</div>
			</form>
		</c:if>
		<!-- 비로그인시 -->
		<c:if test="${loginUser == null }">
			<form id="replyFrm_">
				<input type="hidden" id="origin_cbridx" name="origin_cbridx" value="${orincbridx}">
				<input type="hidden" id="cbidx" name="cbidx" value="${vo.cbidx }">
				<div class="reply_writer">
					<img src="${pageContext.request.contextPath}/image/kakao_profile_basic.png">
				</div>
				<div class="reply_input" onclick="ReNot()">
					<div class="reply_content">
						<div class="reply_content_input">
							<textarea name="content" class="reply_content_input_text reply_content_form_text" placeholder="로그인 후 이용 가능합니다." readonly></textarea>
						</div>
					</div>
					<div class="reply_action">
						<button class="reply_submit_" aria-label="등록" type="button">등록</button>
					</div>
				</div>
			</form>
		</c:if>
		<!-- 댓글 조회 -->
		<ul class="reply_list">
			<c:forEach items="${reply }" var="reply">
				<input type="hidden" name="origin_cbridx" value="${reply.cbridx }">
				<input type="hidden" name="cbridx" value="${reply.cbridx }">
				<c:if test="${reply.depth != 0 }">
					<div class="reply reply${reply.depth } " style="margin-left : calc(${reply.depth-1}*65px + 15px);">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
						</svg>
					</div>
				</c:if>
				<li class="reply_list_item reply_list_item${reply.depth }" style="margin-left : calc(${reply.depth}*65px);">
					<article class="reply_item_">
						<p class="reply_item_content reply_item_content${reply.cbridx }">
							<a class="reply_item_content_writer" href="${pageContext.request.contextPath}/mypage/Member_page.do?midx=${reply.midx }">${reply.writer }
								<img class="reply_item_content_writer_image" src="${pageContext.request.contextPath}/image/${reply.profile_system }">
							</a>
							<c:if test="${reply.del_yn == 'N' || loginUser.grade == 'A' }">
								<span class="reply_item_content_content reply_item_content_content${reply.cbridx}">${reply.content }</span>
							</c:if>
							<c:if test="${reply.del_yn == 'Y' && loginUser.grade != 'A' }">
								<span class="reply_item_content_content reply_item_content_content${reply.cbridx}">삭제된 글 입니다.</span>
							</c:if>
						</p>
						<footer class="reply_item_footer reply_item_footer${reply.depth } reply_item_footer${reply.cbridx }">
							<time class="reply_item_footer_time">
								<c:if test="${reply.modify_yn == 'N' && reply.del_yn == 'N' && reply.del_date == null}">
									${reply.write_date }
								</c:if>
								<c:if test="${reply.modify_yn ==  'Y' && reply.del_yn == 'N'}">
									${reply.modify_date }(수정됨)
								</c:if>
								<c:if test="${reply.del_yn == 'Y' }">
									${reply.del_date }(삭제됨)
								</c:if>
								<c:if test="${reply.del_yn == 'N' && reply.del_date != null }">
									${reply.del_date }(복구됨)
								</c:if>
							</time>
							<c:if test="${loginUser == null && reply.del_yn == 'N'}">
								<button class="reply_item_footer_reply-btn reply_item_footer_reply-btn${reply.depth }" type="button" onclick="ReNot()">답글 달기</button>
							</c:if>
							<c:if test="${loginUser != null && reply.del_yn == 'N'}">
								<button class="reply_item_footer_reply-btn reply_item_footer_reply-btn${reply.depth }" type="button" onclick="Re('${reply.cbridx}')">답글 달기</button>
							</c:if>
							<c:if test="${loginUser.midx == reply.midx}">
								<div class="mfdel">
									<c:if test="${reply.del_yn == 'N' }">
										<button class="replyUpdate" type="button" onclick="replymodify('${reply.cbridx}','${reply.profile_system }')">수정</button>
										<button class="replyDelete" type="button" onclick="replydel('${reply.cbridx}')">삭제</button>
									</c:if>
								</div>
								<!-- 댓글 삭제 -->
								<form id="replydelfrm${reply.cbridx }" name="replydelfrm" method="post">
									<input type="hidden" name="cbridx" value="${reply.cbridx }">
									<input type="hidden" name="cbidx" value="${vo.cbidx }">
								</form>
							</c:if>
							<c:if test="${loginUser.grade == 'A' }">
								<div class="mfdel">
									<c:if test="${reply.del_yn == 'N' }">
										<button class="replyDelete" type="button" onclick="replydel('${reply.cbridx}')">삭제</button>
									</c:if>
									<c:if test="${reply.del_yn == 'Y' }">
										<button class="replyRedistribution" onclick="replyRedistribution('${reply.cbridx}')">복구</button>
									</c:if>
								</div>
								<!-- 댓글 삭제 -->
								<form id="replydelfrm${reply.cbridx }" name="replydelfrm" method="post">
									<input type="hidden" name="cbridx" value="${reply.cbridx }">
									<input type="hidden" name="cbidx" value="${vo.cbidx }">
								</form>
							</c:if>
						</footer>
						<!-- 댓글의 답글 -->
						
						<!-- 답글 작성 -->
						<form class="reply_Frm" id="reply_Frm${reply.cbridx}" name="reply_Frm" method="post">
							<input type="hidden" name="origin_cbridx" value="${reply.cbridx}">
							<input type="hidden" name="cbidx" value="${vo.cbidx }">
							<input type="hidden" name="midx" value="${loginUser.midx }">
							<input type="hidden" name="writer" value="${loginUser.nick_name }">
							<input type="hidden" name="depth" value="${reply.depth }">
							<input type="hidden" name="lvl" value="${reply.lvl }">
							<div class="reply_writer">
								<img src="${pageContext.request.contextPath}/image/${loginUser.profile_system }">
							</div>
							<div class="reply_input_">
								<div class="reply_content">
									<div class="reply_content_input">
										<div class="reply_writer_ reply_writer_${reply.depth }">@${reply.writer }</div><textarea name="content" class="reply_content_input_text_ reply_content_form_text_${reply.cbridx}" onkeyup="adjust_Height('${reply.cbridx}')"></textarea>
									</div>
								</div>
								<div class="reply_action">
									<button class="Rereply_submit" aria-label="등록" type="button" onclick="Reinsert('${reply.cbridx}')">등록</button>
									</div>
								</div>
							</form>
					</article>
				</li>
			</c:forEach>
		</ul>
		<c:if test="${vo.reply_cnt != 0 }">
		<!-- 페이징 처리 -->
		<ul class="list-paginator">
			<li>
				<a class="list-paginator_first" href="home_view.do?cbidx=${vo.cbidx }&fmidx=${vo.midx }&nowPage=1#reply_area">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					  <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					</svg>
				</a>
			</li>
			<c:if test="${pvo.nowPage != 1 && pvo.nowPage > 5}">
				<li>
					<a class="list-paginator_prev" href="home_view.do?cbidx=${vo.cbidx }&fmidx=${vo.midx }&nowPage=${pvo.startPage-5}#reply_area">
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
							<button class="list-paginator_page sm selected" type="button">${num }</button>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="home_view.do?cbidx=${vo.cbidx }&fmidx=${vo.midx }&nowPage=${num}#reply_area" class="list-paginator_page sm">${num }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pvo.nowPage != pvo.lastPage && pvo.endPage != pvo.lastPage}">
				<li>
					<a class="list-paginator_next" href="home_view.do?cbidx=${vo.cbidx }&fmidx=${vo.midx }&nowPage=${pvo.endPage+1}#reply_area">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
						</svg>
					</a>
				</li>
			</c:if>
			<li>
				<a class="list-paginator_last" href="home_view.do?cbidx=${vo.cbidx }&fmidx=${vo.midx }&nowPage=${pvo.lastPage }#reply_area">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
					  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
					</svg>
				</a>
			</li>
		</ul>
		</c:if>
		<c:if test="${loginUser.midx != vo.midx && loginUser != null}">
			<div class="slide_bar off" id="off" onclick="scrap(${vo.cbidx})">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bookmark sideMenu" viewBox="0 0 16 16">
				  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
				</svg>
			</div>
		</c:if>
		<c:if test="${isScrap != 0}">
			<div class="slide_bar on" onclick="unscrap(${vo.cbidx})">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bookmark-fill" viewBox="0 0 16 16">
				  <path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"/>
				</svg>
			</div>
		</c:if>
		<c:if test="${loginUser == null }">
			<div class="slide_bar" onclick="ReNot()">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bookmark sideMenu" viewBox="0 0 16 16">
				  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
				</svg>
			</div>
		</c:if>
		<div class="slide_bar_" onclick="focusOn()">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
			  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
			  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
			</svg>
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
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
	
	<title>홈프렌즈 커뮤니티 상세보기 페이지 입니다.</title>
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/home.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<link href="/controller/css/community/home_view.css" rel="stylesheet">
	<script src="/controller/js/community/home_story.js"></script>
	<script src="/controller/js/community/home_view.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/footer.js"></script>
	
</head>
<body>
	<input type="hidden" value="${replyvo}">
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	
	<!-- 본문 영역 -->
	<div class="row MainImg">
		<img src="/controller/upload/${vo.img_system }">
	</div>
	<section id="story_area">
		<div class="comm_area">
			<input type="hidden" id="cbidx" name="cbidx" value="${vo.cbidx }">
			<div class="row comm_area_">
				<div class="comm_category">홈 스토리</div>
				<div class="comm_title">${vo.title }</div>
				<div class="col-xl-4 storyWriter">
					<div class="profile">
						<div class="profile_img">
							<img class="writerImg" src="/controller/image/${vo.profile_system }">
						</div>
						<div class="profile_name">
							${vo.writer }
						</div>
						<div class="writedate">
							${writeDate }
						</div>
					</div>
				</div>
				<div class="col-xl-5">
				</div>
				<div class="col-xl-3 follow_btn">
					<button>+ 팔로우</button>
				</div>
			</div>
		</div>
		<div class="row content_area">
			<div class="row content_img">
				${vo.content }
				<div id="footer_img_">
					<img src="/controller/image/footer_img.PNG">
				</div>
			</div>
		</div>
		<div class="btn_area">
			<button type="button" onclick="location.href='home_list.do'">목록</button>
		<c:if test="${loginUser.midx == vo.midx }">
			<button type="button" onclick="location.href='home_modify.do?cbidx='+${vo.cbidx}">수정</button>
			<button type="button" onclick="del()">삭제</button>
			<form name="delfrm" action="home_delete.do" method="post">
				<input type="hidden" id="cbidx" name="cbidx" value="${vo.cbidx }">
			</form>
		</c:if>
			
		</div>
		<div class="content_stats">
			<div>스크랩<span>${vo.scrap_cnt }</span></div>
			<div>댓글<span>${count }</span></div>
			<div>조회<span>${vo.hit_cnt }</span></div>
		</div>
		<div class="footer_profile">
			<div class="footer_profile_img">
				<img class="footer_writerImg" src="/controller/image/${vo.profile_system }">
				${vo.writer }
				<button>팔로우</button>
			</div>
		</div>
	</section>
	<!-- 댓글 영역 -->
	<section id="reply_area">
		<h1 class="reply_area">
			댓글&nbsp;<span>${count }</span>
		</h1>
		<!-- 댓글 등록 -->
		<c:if test="${loginUser != null}">
			<form id="replyFrm" name="replyFrm" method="post">
				<input type="hidden" id="origin_cbridx" name="origin_cbridx" value="${orincbridx}">
				<input type="hidden" id="cbidx" name="cbidx" value="${vo.cbidx }">
				<input type="hidden" id="midx" name="midx" value="${loginUser.midx }">
				<input type="hidden" name="writer" value="${loginUser.nick_name }">
				<div class="reply_writer">
					<img src="/controller/image/${loginUser.profile_system }">
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
				<input type="hidden" id="midx" name="midx" value="">
				<input type="hidden" name="writer" value="">
				<div class="reply_writer">
					<img src="/controller/image/kakao_profile_basic.png">
				</div>
				<div class="reply_input">
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
				<li class="reply_list_item reply_list_item${reply.depth }">
					<article class="reply_item_">
						<p class="reply_item_content reply_item_content${reply.cbridx }">
							<a class="reply_item_content_writer" href="">${reply.writer }
								<img class="reply_item_content_writer_image" src="/controller/image/${reply.profile_system }">
							</a>
							<span class="reply_item_content_content reply_item_content_content${reply.cbridx}">${reply.content }</span>
						</p>
						<footer class="reply_item_footer reply_item_footer${reply.depth } reply_item_footer${reply.cbridx }">
							<%@ include file="time.jsp" %>
							<c:if test="${loginUser == null }">
								<button class="reply_item_footer_reply-btn" type="button" onclick="ReNot()">답글 달기</button>
							</c:if>
							<c:if test="${loginUser != null }">
								<button class="reply_item_footer_reply-btn" type="button" onclick="Re('${reply.cbridx}')">답글 달기</button>
							</c:if>
							<c:if test="${loginUser.midx == reply.midx }">
								<div class="mfdel">
									<button class="replyUpdate" type="button" onclick="replymodify('${reply.cbridx}','${reply.profile_system }')">수정</button>
									<button class="replyDelete" type="button" onclick="replydel('${reply.cbridx}')">삭제</button>
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
							<input type="hidden" name="lvl" value="${reply.lvl }">
							<div class="reply_writer">
								<img src="/controller/image/${loginUser.profile_system }">
							</div>
							<div class="reply_input_">
								<div class="reply_content">
									<div class="reply_content_input">
										<span>@${reply.writer }</span><textarea name="content" class="reply_content_input_text_ reply_content_form_text_${reply.cbridx}" onkeyup="adjust_Height('${reply.cbridx}')"></textarea>
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
		<ul class="list-paginator">
			<li>
				<button class="list-paginator_page sm selected" type="button">1</button>
			</li>
			<li>
				<button class="list-paginator_page sm" type="button">2</button>
			</li>
			<li>
				<button class="list-paginator_next" type="button">
					<svg width="26" height="26" viewBox="0 0 26 26" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd" transform="matrix(-1 0 0 1 26 0)"><rect width="25" height="25" x=".5" y=".5" stroke="#DCDCDC" rx="4"></rect><g stroke="#424242" stroke-linecap="square" stroke-width="2"><path d="M14.75 8.263L10.25 13M10.25 13l4.5 4.737"></path></g></g></svg>
				</button>
			</li>
		</ul>
		<div class="slide_bar">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bookmark sideMenu" viewBox="0 0 16 16">
			  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
			</svg>
		</div>
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
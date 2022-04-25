<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<div class="col-12 col-lg-3 mydiv1">
	<div id="mypage_profile_box" class="row">
		<div class="col-3 col-lg-12" id="profile_image">
			<img src="${pageContext.request.contextPath}/image/${vo.profile_system}">
		</div>
		<div class="col-9 col-lg-12" id="profile_id">
			<div id="profile_name">
				${vo.nick_name}
			</div>
			<div id="profile_follow">
				<p>	
				<a href='${pageContext.request.contextPath}/mypage/myFollowing.do'>
				   팔로워 <strong>${follower}</strong> | 
				   팔로잉 <strong>${following}</strong>
				</a>
				</p> 
			</div>
			<div id="profile_btn">
				<button onclick="location.href='${pageContext.request.contextPath}/mypage/member_modify.do'">설정</button>
			</div>
		</div>
		<hr>
		<div class="col-12 col-lg-12" id="profile_etc">
			<div class="profile_icon">
				<a href='${pageContext.request.contextPath}/community/scrap.do'>
				<i class="bi bi-bookmark icon-pointer"></i><br>스크랩<br>
				<strong>${stroyCnt}</strong>
				</a>
			</div>
			<div class="profile_icon">
				<a href='${pageContext.request.contextPath}/store/likey.do'>
				<i class="bi bi-heart icon-pointer"></i><br>좋아요<br>
				<strong>${likeCnt}</strong>
				</a>
			</div> 
		</div>
	</div>
</div>

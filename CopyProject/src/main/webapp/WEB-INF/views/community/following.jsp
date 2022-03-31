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
	
	<title>팔로잉</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/community/following.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/footer.js"></script>
	
	

</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
	
		<div class="followingTitle">
			<span class="bold">홈프렌즈 유저를 팔로우해보세요!</span><br>
			유저의 최신 소식을 한눈에 모아볼 수 있습니다.
		</div>
	
		<div class="followingUserList row">
			<div class="followingUser col-12 col-lg-6">
				<div class="row">
					<div class="followingTextArea col-12">
						<div class="row">
							<div class="profile col-2">
								<img src="/controller/image/iu.png" class="profileImg" alt="팔로잉 유저 프로필 사진" onclick="">
							</div>
							<div class="userName col-7" onclick="">
								<span class="nick" onclick="">IU</span><span class="hashtag">#아이유 #U&I #겨울잠</span><br>
								내 이십대의 그 사이사이 조각들
							</div>
							<div class="followingButtonArea col-3">
								<input type="button" name="followingButton" class="followingButton" value="팔로잉" onclick="">
							</div>
						</div>
					</div>
					<div class="followingImgArea col-12">
						<div class="row">
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story01.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story02.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story03.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story04.png" alt="" class="followingImg" onclick="">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="followingUser col-12 col-lg-6">
				<div class="row">
					<div class="followingTextArea col-12">
						<div class="row">
							<div class="profile col-2">
								<img src="/controller/image/iu.png" class="profileImg" alt="팔로잉 유저 프로필 사진" onclick="">
							</div>
							<div class="userName col-7" onclick="">
								<span class="nick" onclick="">IU</span><span class="hashtag">#아이유 #U&I #겨울잠</span><br>
								내 이십대의 그 사이사이 조각들
							</div>
							<div class="followingButtonArea col-3">
								<input type="button" name="followingButton" class="followingButton" value="팔로잉" onclick="">
							</div>
						</div>
					</div>
					<div class="followingImgArea col-12">
						<div class="row">
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story01.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story02.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story03.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story04.png" alt="" class="followingImg" onclick="">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="followingUser col-12 col-lg-6">
				<div class="row">
					<div class="followingTextArea col-12">
						<div class="row">
							<div class="profile col-2">
								<img src="/controller/image/iu.png" class="profileImg" alt="팔로잉 유저 프로필 사진" onclick="">
							</div>
							<div class="userName col-7" onclick="">
								<span class="nick" onclick="">IU</span><span class="hashtag">#아이유 #U&I #겨울잠</span><br>
								내 이십대의 그 사이사이 조각들
							</div>
							<div class="followingButtonArea col-3">
								<input type="button" name="followingButton" class="followingButton" value="팔로잉" onclick="">
							</div>
						</div>
					</div>
					<div class="followingImgArea col-12">
						<div class="row">
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story01.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story02.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story03.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story04.png" alt="" class="followingImg" onclick="">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="followingUser col-12 col-lg-6">
				<div class="row">
					<div class="followingTextArea col-12">
						<div class="row">
							<div class="profile col-2">
								<img src="/controller/image/iu.png" class="profileImg" alt="팔로잉 유저 프로필 사진" onclick="">
							</div>
							<div class="userName col-7" onclick="">
								<span class="nick" onclick="">IU</span><span class="hashtag">#아이유 #U&I #겨울잠</span><br>
								내 이십대의 그 사이사이 조각들
							</div>
							<div class="followingButtonArea col-3">
								<input type="button" name="followingButton" class="followingButton" value="팔로잉" onclick="">
							</div>
						</div>
					</div>
					<div class="followingImgArea col-12">
						<div class="row">
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story01.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story02.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story03.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story04.png" alt="" class="followingImg" onclick="">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="followingUser col-12 col-lg-6">
				<div class="row">
					<div class="followingTextArea col-12">
						<div class="row">
							<div class="profile col-2">
								<img src="/controller/image/iu.png" class="profileImg" alt="팔로잉 유저 프로필 사진" onclick="">
							</div>
							<div class="userName col-7" onclick="">
								<span class="nick" onclick="">IU</span><span class="hashtag">#아이유 #U&I #겨울잠</span><br>
								내 이십대의 그 사이사이 조각들
							</div>
							<div class="followingButtonArea col-3">
								<input type="button" name="followingButton" class="followingButton" value="팔로잉" onclick="">
							</div>
						</div>
					</div>
					<div class="followingImgArea col-12">
						<div class="row">
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story01.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story02.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story03.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story04.png" alt="" class="followingImg" onclick="">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="followingUser col-12 col-lg-6">
				<div class="row">
					<div class="followingTextArea col-12">
						<div class="row">
							<div class="profile col-2">
								<img src="/controller/image/iu.png" class="profileImg" alt="팔로잉 유저 프로필 사진" onclick="">
							</div>
							<div class="userName col-7" onclick="">
								<span class="nick" onclick="">IU</span><span class="hashtag">#아이유 #U&I #겨울잠</span><br>
								내 이십대의 그 사이사이 조각들
							</div>
							<div class="followingButtonArea col-3">
								<input type="button" name="followingButton" class="followingButton" value="팔로잉" onclick="">
							</div>
						</div>
					</div>
					<div class="followingImgArea col-12">
						<div class="row">
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story01.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story02.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story03.webp" alt="" class="followingImg" onclick="">
							</div>
							<div class="followingImgDiv col-3">
								<img src="/controller/image/story04.png" alt="" class="followingImg" onclick="">
							</div>
						</div>
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

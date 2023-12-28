<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
	<div class="header">

		<!-- 헤더 네비게이션-->
		<div class="header-nav">

			<!-- 헤더 로고-->
			<div class="header-nav-img">
				<a href=""> <!-- 이미지 누르면 메인 화면으로 이동하도록 .. 나중에 링크 추가하기--> <img
					id="hugo-logo" src="./images/hucarlogo2.png" alt="hugo logo">
				</a>
			</div>

			<!-- 네비게이션 버튼-->
			<div class="header-nav-btn">
				<a href="./reservation.jsp"> <!-- 예약 페이지 연결-->
					<div id="resevation-pg" class="hearder-nav-btn-item">예약</div>
				</a> <a href=""> <!-- 결제 페이지 연결-->
					<div id="payment-pg" class="hearder-nav-btn-item">결제</div>
				</a> <a href=""> <!-- 마이 페이지 연결-->
					<div id="my-pg" class="hearder-nav-btn-item">마이페이지</div>
				</a> <a href=""> <!-- 관리자 전용 페이지 연결-->
					<div id="management-pg" class="hearder-nav-btn-item">관리자전용</div>
				</a>
			</div>

		</div>

		<!-- 헤더 로그인 쪽-->
		<div class="header-nav-login">

			<!-- 상담 연결-->
			<div class="header-nav-login-call">
				<i class="fa-solid fa-phone"></i>
				<div>친절상담</div>
				<div>1544-3333</div>
			</div>
			<div class="header-nav-login-slash">|</div>
			<!-- 로그인 버튼-->
			<a href=""> <!-- 로그인 / 회원가입 페이지 연결하기-->
				<div class="header-nav-login-btn">
					<i class="fa-regular fa-circle-user"></i>
					<div id="login">로그인</div>
				</div>
			</a>

		</div>

	</div>
</body>
</html>
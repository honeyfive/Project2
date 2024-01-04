<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.dao.MemberInfoDAO"%>
<%@ page import="db.dto.MemberInfoDTO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<link rel="stylesheet" href="css/header2.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

	<%
	String headerId = (String) session.getAttribute("id");
	System.out.println("아이디 세션 잘 됏나 !! " + headerId);

	MemberInfoDAO memberInfoHeaderDAO = new MemberInfoDAO();
	MemberInfoDTO memberInfoHeaderDTO = memberInfoHeaderDAO.findMemberById(headerId); // 아이디로 회원 정보 찾기
	%>
	<div class="header">

		<!-- 헤더 네비게이션-->
		<div class="header-nav">

			<!-- 헤더 로고-->
			<div class="header-nav-img">
				<a href="./mainpage.jsp"> <!-- 이미지 누르면 메인 화면으로 이동하도록 .. 나중에 링크 추가하기-->
					<img id="hugo-logo" src="./images/hucarlogo2.png" alt="hugo logo">
				</a>
			</div>

			<!-- 네비게이션 버튼-->
			<!-- 로그인이 안 되어 있으면 다른 페이지 이동 막기 -->
			<%
			if (headerId == null || memberInfoHeaderDTO == null) {
			%>
			<div class="header-nav-btn">
			<% if (headerId == null || memberInfoHeaderDTO == null){ %>
				 <!-- 로그인 되어 있지 않은 경우 -->
				 <a href="./login.jsp">
				 	<div id="resevation-pg" class="hearder-nav-btn-item logout_status">예약</div>
				 </a>
			<%}else{%>
				 <!-- 로그인 되어 있는 경우 -->
				 <a href="./reservation.jsp"> <!-- 예약 페이지 연결-->
					<div id="resevation-pg" class="hearder-nav-btn-item">예약</div>
				 </a>
			<% } %>
			<% if (headerId == null || memberInfoHeaderDTO == null){ %>
				 <!-- 로그인 되어 있지 않은 경우 -->
				 <a href="./login.jsp">
				 	<div id="payment-pg" class="hearder-nav-btn-item logout_status">결제</div>
				 </a>
			<%}else{%>
				 <!-- 로그인 되어 있는 경우 -->
				 <a href="./payment.jsp"> <!-- 결제 페이지 연결-->
					<div id="payment-pg" class="hearder-nav-btn-item">결제</div>
				</a> 
			<% } %>
			<% if (headerId == null || memberInfoHeaderDTO == null){ %>
				 <!-- 로그인 되어 있지 않은 경우 -->
				 <a href="./login.jsp">
				 	<div id="my-pg" class="hearder-nav-btn-item logout_status">마이페이지</div>
				 </a>
			<%}else{%>
				<!-- 로그인 되어 있는 경우 -->
				<a href="./mypage.jsp"> <!-- 마이 페이지 연결-->
					<div id="my-pg" class="hearder-nav-btn-item">마이페이지</div>
				</a> 
			<% } %>
			</div>

			<!-- 로그인이 성공하면 이동 가능 -->
			<%
			} else {
			%>
			<div class="header-nav-btn">
				<!-- 예약 페이지 연결-->
				<a href="./reservation.jsp">
					<div id="resevation-pg" class="hearder-nav-btn-item">예약</div>
				</a>
				<!-- 결제 페이지 연결-->
				<a href="./payment.jsp">
					<div id="payment-pg" class="hearder-nav-btn-item">결제</div>
				</a>
				<!-- 마이 페이지 연결-->
				<a href="./mypage.jsp">
					<div id="my-pg" class="hearder-nav-btn-item">마이페이지</div>
				</a>
			</div>
			<%
			}
			%>

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
			 <% if (headerId == null || memberInfoHeaderDTO == null) {%>
		        <!-- 로그인 되어 있지 않은 경우 -->
		        <a href="./login.jsp">
		            <div class="header-nav-login-btn">
		                <i class="fa-regular fa-circle-user"></i>
		                <div id="login">로그인</div>
		            </div>
		        </a>
		    <% } else { %>
		        <!-- 로그인 되어 있는 경우 -->
		            <div class="header-nav-login-btn">
		                <i class="fa-regular fa-circle-user"></i>
		                <div id="login_after"><%= memberInfoHeaderDTO.getName() %>님</div>
		            </div>
    		<% } %>

		</div>

	</div>
	
	<script src="./js/logout.js"></script>
	<script>
		function loginPlzAlert(){
			alert("로그인 이후 이용하실 수 있습니다.");
			location.href="./login.jsp";
		}
	</script>
</body>
</html>
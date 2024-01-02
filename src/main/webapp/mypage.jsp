<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="db.dao.MemberInfoDAO"%>
<%@ page import="db.dto.MemberInfoDTO"%>
<%@ page import="db.dao.PaymentInfoDAO"%>
<%@ page import="db.dto.PaymentInfoDTO"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="css/mypage.css">
</head>
<body>
	<%
	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	List<MemberInfoDTO> memberInfoDTO = memberInfoDAO.findMemberList();
	PaymentInfoDAO paymentInfoDAO = new PaymentInfoDAO();
	List<PaymentInfoDTO> paymentInfoDTO = paymentInfoDAO.findPaymentTypeInfoList();

	String id = (String) session.getAttribute("id");
	MemberInfoDTO loginMemberDTO = memberInfoDAO.findMemberById(id);

	System.out.println(loginMemberDTO);

	String myLevel = loginMemberDTO.getMembership_level();
	System.out.println(myLevel);
	%>

	<!--헤더-->

	<%@ include file="header2.jsp"%>

	<!-- 마이페이지 메인 -->
	<div class="mypage_container">
		<div class="my_info_box">
			<div class="my_info">
				<!-- 이름 -->
				<%
				if (id != null) {
				%>
				<div class="my_name"><%=loginMemberDTO.getName()%>님
				</div>

				<%
				} else {
				%>
				<div class="my_name">000님</div>
				<%
				}
				%>
				<!-- 이메일 -->
				<div class="my_email"><%=loginMemberDTO.getEmail()%></div>
			</div>

			<div class="member_rent_use">
				<div class="memeber_rating_box">
					<i class="fa-regular fa-star-half-stroke"></i>

					<!-- 등급 -->
					<span class="member_rent_use_text" id="rate">my 등급</span>
					
					<!-- 회원등급 보여주는 곳 -->
				</div>
				<div class="use_count_box">
					<i class="fa-solid fa-list-check"></i> <span
						class="member_rent_use_text">이용 횟수</span>
					<!-- 회원 렌트 이용횟수 보여주는 곳 -->
				</div>
				<div class="overdue_history_box">
					<i class="fa-solid fa-triangle-exclamation"></i> <span
						class="member_rent_use_text">연체 횟수</span>
					<!-- 회원 연체 횟수 보여주는 곳 -->
				</div>
			</div>
			<div class="member_level"></div>

		</div>
		<div class="rent_progress_box">
			<!-- 진행중인 렌트내역 -->
			<div class="rent_progress"></div>

			<!-- 진행중인 렌트내역이 없을때 -->
			<div class="not_rent_progress">
				<i class="fa-regular fa-face-flushed"></i>
				<p class="not_rent_progress_ment">진행중인 렌트 내역이 없습니다</p>
				<p class="not_rent_progress_ment"
					style="color: #0D6FFC; font-weight: bold;">지금 고객님이 원하는 렌트카를 빌리고
					신나게 떠나볼까요?</p>
				<button class="go_to_reservation_btn"
					onclick="location.href='./reservation.jsp'">렌트하러 가기</button>
			</div>
		</div>
		<div class="member_payment_type_proc_box">
			<div class="payment_proc">
				<div class="payment_proc_text">결제수단 수정</div>
				<div class="payment_proc_option">
					<select class="payment_option">
						<%
						String[] arr = { "카드 결제", "휴대폰 결제", "실시간 계좌이체" };
						//dto 안에 결제수단 값에 따라서 어떤 option이 selected 되어야하는가를 결정
						//화면에 보이는 출력 목록은 고정
						//사용자 기본 결제수단 정보 읽어와서 C P T
						%>
						<option value="C" selected>카드결제</option>
						<option value="P">휴대폰 결제</option>
						<option value="T">실시간 계좌이체</option>
					</select>
				</div>

			</div>
		</div>
		<!-- 개인정보 수정 페이지 -->
		<a href="./myinfoproc.jsp" class="my_info_proc_box">
			<div class="my_info_proc">
				<p class="my_info_proc_text">내 정보 관리</p>
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</a>
		<div class="customer_service_box">
			<div class="customer_service">
				<p class="customer_service_center">고객 센터</p>
				<p class="customer_service_info">매일(공휴일 포함) 오전 9시 ~ 오후 6시</p>
				<p class="customer_service_info">점심시간 오후 12시30분 ~ 1시30분 (1시간)</p>
			</div>
			<div class="go_to_service_center">
				<i class="fa-solid fa-angle-right"></i>
			</div>
			<!-- 고객센터로 가는 경로 -->
		</div>

	</div>


	<!-- 푸터 -->
	<%@ include file="footer.jsp"%>


<script type="text/javascript" scr="./js/mypage.js"></script>
</body>
</html>
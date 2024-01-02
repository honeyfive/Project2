<%@page import="db.dao.HistoryInfoDAO"%>
<%@page import="db.dto.HistoryInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="db.dao.MemberInfoDAO"%>
<%@ page import="db.dto.MemberInfoDTO"%>
<%@ page import="db.dao.PaymentInfoDAO"%>
<%@ page import="db.dto.PaymentInfoDTO"%>
<%@page import="db.dao.ReservationHistoryDAO"%>
<%@page import="db.dto.ReservationHistoryDTO"%>


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

<link rel="stylesheet" href="css/mypage.css?v=1">
</head>
<body>
	<%
	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	List<MemberInfoDTO> memberInfoDTO = memberInfoDAO.findMemberList();
	PaymentInfoDAO paymentInfoDAO = new PaymentInfoDAO();
	List<PaymentInfoDTO> paymentInfoDTO = paymentInfoDAO.findPaymentTypeInfoList();

	String id = (String) session.getAttribute("id"); // 세션으로 아이디 가져오기
	MemberInfoDTO loginMemberDTO = memberInfoDAO.findMemberById(id); // 아이디로 회원 정보 찾기

	System.out.println(loginMemberDTO);

	int membershipNumber = loginMemberDTO.getMembership_number(); // 아이디로 찾은 회원 정보에서 회원 번호 가져오기
	System.out.println(membershipNumber);

	HistoryInfoDAO historyInfoDAO = new HistoryInfoDAO();
	List<HistoryInfoDTO> useMemberInfoDTO = historyInfoDAO.findHistoryInfoListByMembershipNumber(membershipNumber);
	// 아이디로 찾은 회원 정보에서 가져온 회원 번호로 이용 내역이 있나 확인하려고 만들었삼
	System.out.println(useMemberInfoDTO);

	ReservationHistoryDAO reservationHistoryDAO = new ReservationHistoryDAO();
	List<ReservationHistoryDTO> reservationHistoryDTO = reservationHistoryDAO
			.findReservationHistoryListByMembershipNumber(membershipNumber);
	// 아이디로 찾은 회원 정보에서 가져온 회원 번호로 새로 만든 내역 찾기
	System.out.println(reservationHistoryDTO);
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

			<!-- 등급, 이용횟수, 연체횟수 -->
			<div class="member_rent_use">
				<!-- 등급 -->
				<div class="memeber_rating_box">
					<i class="fa-regular fa-star-half-stroke"></i>
					<div class="member_rent_use_div">
						<span class="member_rent_use_text" id="rate"><%=loginMemberDTO.getMembership_level()%>등급</span>
					</div>
				</div>

				<!-- 이용횟수 -->
				<div class="use_count_box">
					<i class="fa-solid fa-list-check"></i>
					<div class="member_rent_use_div">
						<span class="member_rent_use_text"><%=loginMemberDTO.getUse_count()%>회
							이용</span>
					</div>
				</div>
				<!-- 연체횟수 -->
				<div class="overdue_history_box">
					<i class="fa-solid fa-triangle-exclamation"></i>
					<div class="member_rent_use_div">
						<span class="member_rent_use_text"><%=loginMemberDTO.getOverdue_history()%>회
							연체 </span>
					</div>
				</div>
			</div>
			<div class="member_level"></div>
		</div>

		<!-- 진행중인 렌트내역 -->
		<div class="rent_progress_box">
			<div class="rent_progress"></div>


			<%
			if (useMemberInfoDTO.size() == 0) {
			%>
			<div class="not_rent_progress">
				<i class="fa-regular fa-face-flushed"></i>
				<p class="not_rent_progress_ment">진행중인 렌트 내역이 없습니다</p>
				<p class="not_rent_progress_ment"
					style="color: #0D6FFC; font-weight: bold;">지금 고객님이 원하는 렌트카를 빌리고
					신나게 떠나볼까요?</p>
				<button class="go_to_reservation_btn"
					onclick="location.href='./reservation.jsp'">렌트하러 가기</button>
			</div>
			<%
			} else {
			%>
			<div class="not_rent_progress rent_progress">
				<div class="rent_title">렌트 내역</div>
			</div>
			<table>
				<tr>
					<th>대여날짜</th>
					<th>대여장소</th>
					<th>반납날짜</th>
					<th>반납장소</th>
					<th>연체시간(분)</th>
					<th>총대여시간</th>
					<th>차량번호</th>
				</tr>

				<%
		for (ReservationHistoryDTO reservationHistoryDTO: reservaionHistoryList) {
		%>
				<tr>
					<td><%=reservationHistoryDTO.getRental_date()%>
					<td><%=reservationHistoryDTO.getRental_place()%> <td><%=reservationHistoryDTO.getReal_return_date()%>
					
					<td><%=reservationHistoryDTO.getReturn_place()%>
					<td><%=reservationHistoryDTO.getOverdue_history()%>
					<td><%=reservationHistoryDTO.getTotal_rental_date()%>
					<td><%=reservationHistoryDTO.getCar_number()%>
				</tr>
				<%
		}
		%>

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

				<!-- 등급 모달창 -->
				<div class="modal modal_rating">
					<div class="modal_body">
						<div class="modal_title">회원 등급 기준</div>
						<table>
							<tr>
								<th>회원등급</th>
								<th>실제등급</th>
								<th>이용횟수</th>
							</tr>
							<tr>
								<td>N</td>
								<td>New 등급</td>
								<td>0회 (신규회원)</td>
							</tr>
							<tr>
								<td>S</td>
								<td>Silver 등급</td>
								<td>1회</td>
							</tr>
							<tr>
								<td>G</td>
								<td>Gold 등급</td>
								<td>2~4회</td>
							</tr>
							<tr>
								<td>D</td>
								<td>Diamond 등급</td>
								<td>5회 이상</td>
							</tr>
							<tr>
								<td>B</td>
								<td>BlackList 등급</td>
								<td style="color: red">이용횟수와 상관 없이 연체 3회 시</td>
							</tr>
						</table>
						<div class="caution">회원 등급은 이용횟수, 연체횟수에 따라 자동으로 변경됩니다!</div>
						<div class="modal_close">
							<button class="modal_close_btn modal_rating_close_btn">닫기</button>
						</div>
					</div>
				</div>

				<!-- 이용내역 모달창 -->
				<div class="modal modal_use">
					<div class="modal_body">
						<div class="modal_title">이용 내역</div>
						<div class="modal_close">
							<button class="modal_close_btn modal_use_close_btn">닫기</button>
						</div>
					</div>
				</div>



				<!-- 푸터 -->
				<%@ include file="footer.jsp"%>


				<script src="./js/mypage.js"></script>
</body>
</html>
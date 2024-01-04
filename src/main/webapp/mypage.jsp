<%@page import="oracle.jdbc.dcn.RowChangeDescription"%>
<%@page import="javax.swing.Scrollable"%>
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
<link rel="shortcut icon" href="./images/favicon.png" type="image/png" sizes="32x32">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="css/mypage.css?v=2">
<link rel="shortcut icon" href="./images/favicon.png" type="image/png"
	sizes="32x32">
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<%
	MemberInfoDAO memberInfoMyDAO = new MemberInfoDAO();
	List<MemberInfoDTO> memberInfoMyDTO = memberInfoMyDAO.findMemberList();
	PaymentInfoDAO paymentInfoMyDAO = new PaymentInfoDAO();
	List<PaymentInfoDTO> paymentInfoMyDTO = paymentInfoMyDAO.findPaymentTypeInfoList();

	String id = (String) session.getAttribute("id"); // 세션으로 아이디 가져오기
	MemberInfoDTO memberinfoMyDTO = memberInfoMyDAO.findMemberById(id); // 아이디로 회원 정보 찾기
	System.out.println("아이디로 찾은 회원 정보 " + memberinfoMyDTO);

	int membershipNumber = memberinfoMyDTO.getMembership_number(); // 아이디로 찾은 회원 정보에서 회원 번호 가져오기

	HistoryInfoDAO historyInfoMyDAO = new HistoryInfoDAO();
	List<HistoryInfoDTO> useMemberInfoDTO = historyInfoMyDAO.findHistoryInfoListByMembershipNumber(membershipNumber);
	// 아이디로 찾은 회원 정보에서 가져온 회원 번호로 이용 내역이 있나 확인하려고 만들었삼
	System.out.println("이력 정보 " + useMemberInfoDTO);

	ReservationHistoryDAO reservationHistoryDAO = new ReservationHistoryDAO();
	List<ReservationHistoryDTO> reservationHistoryDTO = reservationHistoryDAO
			.findReservationHistoryListByMembershipNumber(membershipNumber);
	// 아이디로 찾은 회원 정보에서 가져온 회원 번호로 새로 만든 내역 찾기
	System.out.println("렌트 내역 " + reservationHistoryDTO);
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
				<div class="my_name"><%=memberinfoMyDTO.getName()%>님
				</div>

				<%
				} else {
				%>
				<div class="my_name">000님</div>
				<%
				}
				%>
				<!-- 이메일 -->
				<div class="my_email"><%=memberinfoMyDTO.getEmail()%></div>
			</div>

			<!-- 등급, 이용횟수, 연체횟수 -->
			<div class="member_rent_use">
				<!-- 등급 -->
				<div class="memeber_rating_box">
					<i class="fa-regular fa-star-half-stroke"></i>
					<div class="member_rent_use_div">
						<span class="member_rent_use_text" id="rate"><%=memberinfoMyDTO.getMembership_level()%>등급</span>
					</div>
				</div>

				<!-- 이용횟수 -->
				<div class="use_count_box">
					<i class="fa-solid fa-list-check"></i>
					<div class="member_rent_use_div">
						<span class="member_rent_use_text"><%=memberinfoMyDTO.getUse_count()%>회
							이용</span>
					</div>
				</div>
				<!-- 연체횟수 -->
				<div class="overdue_history_box">
					<i class="fa-solid fa-triangle-exclamation"></i>
					<div class="member_rent_use_div">
						<span class="member_rent_use_text"><%=memberinfoMyDTO.getOverdue_history()%>회
							연체 </span>
					</div>
				</div>
			</div>
			<div class="member_level"></div>

			<div class="rating_level">등급을 누르면 휴카의 등급 기준을 확인하실 수 있습니다</div>
		</div>

		<!-- 진행중인 렌트내역 -->
		<div class="rent_progress_box">
			<div class="rent_progress"></div>
			<%
			if (useMemberInfoDTO.size() == 0) { // 렌트 내역이 없으면
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
			} else { // 렌트 내역 있으면
			%>
			<div class="not_rent_progress rent_progress">
				<div class="rent_title">렌트 내역</div>
			</div>
			<table class="rent_table">
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
				for (ReservationHistoryDTO reservationHistoryList : reservationHistoryDTO) {
					String textColor = (reservationHistoryList.getReal_return_date() == null) ? "red" : "black";
					String backgroundColor = (reservationHistoryList.getOverdue_history() < 0) ? "yellow" : "white";
				%>
				<tr
					style="color: <%=textColor%>; background-color: <%=backgroundColor%>;">
					<td><%=reservationHistoryList.getRental_date()%></td>
					<td><%=reservationHistoryList.getRental_place()%></td>
					<td><%=reservationHistoryList.getReal_return_date()%></td>
					<td><%=reservationHistoryList.getReturn_place()%></td>
					<td><%=reservationHistoryList.getOverdue_history()%></td>
					<td><%=reservationHistoryList.getTotal_rental_date()%></td>
					<td><%=reservationHistoryList.getCar_number()%></td>
				</tr>
				<%
				}
				%>

			</table>
			<div class="rating_level" style="color:#0D6FFC">빨간글씨 : 예약취소 건</div>
			<div class="rating_level" style="color:#0D6FFC">노란배경 : 연체 건</div>

		</div>
		<%
		}
		%>
		<!-- 결제수단은 보완사항으로 .. -->
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

	<!-- 푸터 -->
	<%@ include file="footer.jsp"%>

	<script src="./js/mypage.js"></script>
	<script type="text/javascript">
	 window.history.forward();
	 function noBack(){window.history.forward();}
	</script>
</body>
</html>
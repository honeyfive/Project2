<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.ReservationInfoDTO"%>
<%@page import="db.dao.ReservationInfoDAO"%>
<!DOCTYPE html>
<html>
<head>

<style>
	@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Roboto", helvetica, arial, sans-serif;
}
.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24
}

.side_bar {
	margin-right: 1%;
	width: 10%;
	height: 1700px;
	float: left;
	background-color: #0D6FFC;
	font-weight: bold;
	text-align: center;
}

body {
	font-family: "Roboto", helvetica, arial, sans-serif;
	text-rendering: optimizeLegibility;
	overflow-x: hidden;
}

table {
	margin-top: 1%;
	border-collapse: separate;
	border-spacing: 0;
	width: 88%;
	border-collapse: separate;
	font-size: 0.85rem;
}

th, td {
	padding: 8px 4px;
}

th {
	background: #0D6FFC;
	color: #fff;
	text-align: left;
	border-right: 1px solid #c2c2c2;
}

tr:first-child th:first-child {
	border-top-left-radius: 6px;
}

tr:first-child th:last-child {
	border-top-right-radius: 6px;
}

td {
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
}

td:first-child {
	border-left: 1px solid #c6c9cc;
}

tr:nth-child(even) td {
	background: #eaeaed;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 6px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 6px;
}

#input_membership_number {
	margin-top: 20px;
}

.manage {
	margin: 0 auto;
	font-size: 1.2rem;
	margin-top: 15%;
	color: white;
}

a {
	text-decoration-line: none;
	color: gray;
}

fieldset {
	margin-top: 5px;
	padding: 10px;
	width: 88%;
    border-radius: 5px;
}

input[type="text"] {
	width: 100px;
	padding: 2px;
}

.membermodifybutton {
	float: right;
}

h1 {
	color: #0D6FFC;
	margin-top: 15px;
}

.carAddClass {
	float: right;
}

</style>
<meta charset="UTF-8">
<title>휴카</title>
<link rel="shortcut icon" href="./images/favicon.png" type="image/png" sizes="32x32">
</head>
<body>
	<% 	ReservationInfoDAO reservationInfoDAO = new ReservationInfoDAO();
		List<ReservationInfoDTO> reservationInfoList = reservationInfoDAO.findReservationInfoList();
		%>

		<%@ include file="header3.jsp"%>
		<div class="side_bar">
			<a href="./manage_main.jsp"><div class="manage">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
	  <path
							d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z" />
	</svg>
					메인 화면
				</div></a> <a href="./Member.jsp"><div class="manage">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
	  <path
							d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664z" />
	</svg>
					고객 관리
				</div></a> <a href="./carInfo_check.jsp"><div class="manage">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-car-front" viewBox="0 0 16 16">
	  <path
							d="M4 9a1 1 0 1 1-2 0 1 1 0 0 1 2 0m10 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM4.862 4.276 3.906 6.19a.51.51 0 0 0 .497.731c.91-.073 2.35-.17 3.597-.17 1.247 0 2.688.097 3.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 10.691 4H5.309a.5.5 0 0 0-.447.276" />
	  <path
							d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM4.82 3a1.5 1.5 0 0 0-1.379.91l-.792 1.847a1.8 1.8 0 0 1-.853.904.807.807 0 0 0-.43.564L1.03 8.904a1.5 1.5 0 0 0-.03.294v.413c0 .796.62 1.448 1.408 1.484 1.555.07 3.786.155 5.592.155 1.806 0 4.037-.084 5.592-.155A1.479 1.479 0 0 0 15 9.611v-.413c0-.099-.01-.197-.03-.294l-.335-1.68a.807.807 0 0 0-.43-.563 1.807 1.807 0 0 1-.853-.904l-.792-1.848A1.5 1.5 0 0 0 11.18 3z" />
	</svg>
					차량 관리
				</div></a> <a href="./manage_Reservation.jsp"><div class="manage">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-kanban" viewBox="0 0 16 16">
	  <path
							d="M13.5 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1h-11a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zm-11-1a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h11a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" />
	  <path
							d="M6.5 3a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1zm-4 0a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1zm8 0a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1z" />
	</svg>
					예약 정보
				</div></a> <a href="./login.jsp"><div class="manage">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
	  <path
							d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1z" />
	</svg>
					로그 아웃
				</div></a>
		</div>
		
		<h1>예약 정보</h1>
		<br>
		<a href="javascript:window.history.back();">
		<span>뒤로가기</span>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backspace" viewBox="0 0 16 16">
    	<path d="M5.83 5.146a.5.5 0 0 0 0 .708L7.975 8l-2.147 2.146a.5.5 0 0 0 .707.708l2.147-2.147 2.146 2.147a.5.5 0 0 0 .707-.708L9.39 8l2.146-2.146a.5.5 0 0 0-.707-.708L8.683 7.293 6.536 5.146a.5.5 0 0 0-.707 0z"/>
    	<path d="M13.683 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-7.08a2 2 0 0 1-1.519-.698L.241 8.65a1 1 0 0 1 0-1.302L5.084 1.7A2 2 0 0 1 6.603 1zm-7.08 1a1 1 0 0 0-.76.35L1 8l4.844 5.65a1 1 0 0 0 .759.35h7.08a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1z"/>
		</svg>
	</a>
		
		<table>
	
		<tr>
			<th>예약번호</th>
			<th>회원번호</th>
			<th>대여장소</th>
			<th>반납장소</th>
			<th>대여시간</th>
			<th>반납시간</th>
			<th>총대여시간</th>
			<th>이용시간</th>
			<th>보험번호</th>
			<th>차량번호</th>
			<th>결제번호</th>
		</tr>
		
		<tr>
			
		
		
	<%
		if(reservationInfoList != null) {
			for(ReservationInfoDTO reservationInfo : reservationInfoList){
		%>
		
			<tr>
				<td><%=reservationInfo.getReservation_number()%></td>
				<td><%=reservationInfo.getMembership_number()%></td>
				<td><%=reservationInfo.getRental_place()%></td>
				<td><%=reservationInfo.getReturn_place()%></td>
	  			<td><%=reservationInfo.getRental_date()%> </td>
	  			<td><%=reservationInfo.getReturn_date()%></td>
	  			<td><%=reservationInfo.getTotal_rental_date()%></td>
	  			<td><%=reservationInfo.getTotal_rental_time()%></td>
	  			<td><%=reservationInfo.getInsurance_number()%></td>
	  			<td><%=reservationInfo.getCar_number()%></td>
	  			<td><%=reservationInfo.getPayment_number()%></td>
			</tr>
	<%
			}
		}
	%>	
	</table>
</body>
</html>
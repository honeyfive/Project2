<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.ReservationInfoDTO"%>
<%@page import="db.dao.ReservationInfoDAO"%>
<!DOCTYPE html>
<html>
<head>

<style>
	* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.side_bar {
	margin-right: 2%;
	width: 10%;
	height: 1200px;
	float: left;
	/* border: 3px solid black; */
	/* background-color: #0D6FFC; */
	/* color: white; */
	border-right: 3px solid #0D6FFC;
	font-weight: bold;
}

body {
	color: #666;
	font: 14px/24px "Open Sans", "HelveticaNeue-Light",
		"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
		"Lucida Grande", Sans-Serif;
}

table {
	margin-top: 5%; border-collapse : separate;
	border-spacing: 0;
	width: 88%;
	border-collapse: separate;
}

th, td {
	padding: 8px 4px;
}

th {
	background: #0D6FFC;
	color: #fff;
	text-align: left;
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

h1 {
 color: #0D6FFC;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 	ReservationInfoDAO reservationInfoDAO = new ReservationInfoDAO();
		List<ReservationInfoDTO> reservationInfoList = reservationInfoDAO.findReservationInfoList();
		%>
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
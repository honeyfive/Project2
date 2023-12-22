<%@page import="db.dto.ReservationInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.ReservationInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 	ReservationInfoDAO reservationInfoDAO = new ReservationInfoDAO();
		List<ReservationInfoDTO> reservationInfoList = reservationInfoDAO.findReservationInfoList();  
	%>



	<h1>결제페이지</h1>
	
	<table border="1">
	
		<tr>
			<th>대여장소</th>
			<th>대여시간</th>
			<th>이용시간</th>
			<th>반납장소</th>
			<th>반납시간</th>
		</tr>
		
		<tr>
			
		
		
	<%
		if(reservationInfoList != null) {
			for(ReservationInfoDTO reservationInfo : reservationInfoList){
		%>
		
			<tr>
				<td><%=reservationInfo.getRental_place()%></td>
				<td><%=reservationInfo.getRental_date()%></td>
				<td><%=reservationInfo.getTotal_rental_time()%></td>
	  			<td><%=reservationInfo.getReturn_place()%> </td>
	  			<td><%=reservationInfo.getReturn_date()%></td>
			</tr>
	<%
			}
		}
	 %>	
	
	</table>
	

		
	
	 

	
	

	
	
	
</body>
</html>
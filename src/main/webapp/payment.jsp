<%@page import="java.util.List"%>
<%@page import="db.dto.ReservationInfoDTO"%>
<%@page import="db.dao.ReservationInfoDAO"%>
<%@page import="db.dto.CarInfoDTO"%>
<%@page import="db.dao.CarInfoDAO"%>
<%@page import="db.dto.MemberInfoDTO"%>
<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="db.dto.InsuranceInfoDTO"%>
<%@page import="db.dao.InsuranceInfoDAO"%>
<%@page import="db.dto.PaymentInfoDTO"%>
<%@page import="db.dao.PaymentInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/payment.css">
</head>
<body>


	<% 	ReservationInfoDAO reservationInfoDAO = new ReservationInfoDAO();
		List<ReservationInfoDTO> reservationInfoList = reservationInfoDAO.findReservationInfoList();  

		CarInfoDAO carInfoDAO = new CarInfoDAO();
		List<CarInfoDTO> carInfoList = carInfoDAO.findCarInfoList(); 

		MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		List<MemberInfoDTO> memberList = memberInfoDAO.findMemberList();

		InsuranceInfoDAO insuranceDAO = new InsuranceInfoDAO();
		List<InsuranceInfoDTO> insuranceinfoList = insuranceDAO.findInsuranceInfoList();

		PaymentInfoDAO paymentInfoDAO = new PaymentInfoDAO();
		List<PaymentInfoDTO> paymentInfoList = paymentInfoDAO.findPaymentInfoList();
		
		
		//ReservationInfoDTO rsrv	= reservationInfoDAO.findReservationInfoByRsrvNumber(1140);
		//rsrv.getMembership_number();
		//rsrv.getInsurance_number();
		
		//memberInfoDAO.findMemberById(rsrv.getMembership_number());
		//insuranceDAO.findInsuranceInfoByInsuNumber(rsrv.getInsurance_number());
		
		
	%>
	
	

 <% // @ include file="header.jsp" %>
 
 
		<h1>결제페이지</h1>


	
	<h3>예약정보</h3>
	<table border="1">
	
		<tr>
			<th>차량명</th>
		</tr>
		
	<%
		if(carInfoList != null) {
			for(CarInfoDTO carInfo : carInfoList){
		%>
		
			<tr>
				<td><%=carInfo.getCar_name() %></td>
			</tr>
	<%
			}
		}
	%>	
	
	</table>
	
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
	
	<h3>차량정보</h3>
	<table border="1">
	
		<tr>
			<th>연식</th>
			<th>연료</th>
			<th>승차인원</th>
		</tr>
		
		<tr>
			
		
		
		<%
	if(carInfoList != null){
		for(CarInfoDTO carInfoDTO : carInfoList){
	%>
		
			<tr>
				<td><%=carInfoDTO.getModel_year() %></td>
				<td><%=carInfoDTO.getCar_type() %></td>
				<td><%=carInfoDTO.getPassenger_count() %></td>
			</tr>
	<%
			}
		}
	%>	
	
	</table>
	
	
	<h3>차량옵션</h3>
	<table border="1">
	
		<tr>
			<th>옵션 1</th>
			<th>옵셥 2</th>
		</tr>
		
		<tr>
			
		
		
		<%
	if(carInfoList != null){
		for(CarInfoDTO carInfoDTO : carInfoList){
	%>
		
			<tr>
				<td><%=carInfoDTO.getOption1() %></td>
				<td><%=carInfoDTO.getOption2() %></td>
			</tr>
	<%
			}
		}
	%>	
	
	</table>
	
	
	<h3>운전자정보</h3>
	
	
	<%
	//for(MemberInfoDTO memberInfo : memberList) {
	%>

	<form>
		<label>이름 : </label><input type="text" id="input_name" name="name">
		<label>생년월일 : </label><input type="number" id="input_birthday" name="birthday">
		<label>휴대폰번호 : </label><input type="number" id="input_phoneNumber" name="phoneNumber">
		<label>이메일 : </label><input type="email" id="input_eMail" name="eMail">
	</form>
	
	
	<% //} %>
	
	
	<h3>자동차 보험</h3>
	
	<table>
		
			<%
			if (insuranceinfoList != null) {
				for (InsuranceInfoDTO insuranceinfo : insuranceinfoList) {
			%>
		
		<tr><%=insuranceinfo.getInsurance_type()%><input type="checkbox"></tr>
		<%
		}
		}
		%>
	</table>
	
	
	<h3>결제정보</h3>
	
	
	<table border="1">
	
		<tr>
			<th>총 결제금액</th>
		</tr>
		
		
	<%
		if(paymentInfoList != null) {
			for(PaymentInfoDTO paymentInfo : paymentInfoList){
		%>
		
			<tr>
				<td><%=paymentInfo.getPayment_price() %></td>
			</tr>
	<%
			}
		}
	%>	
	
	</table>
	
	
	<h3>결제하기</h3>
	<button type="submit">결제하기</button>
	
	
	
	
	
	
	
	
	
	

		
	
	 

	
	

	
	
	
</body>
</html>
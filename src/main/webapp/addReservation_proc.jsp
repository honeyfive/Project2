<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.ReservationInfoDAO"%>
<%@ page import="db.dto.ReservationInfoDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	ReservationInfoDAO reservationInfoDAO = new ReservationInfoDAO();
	
	request.setCharacterEncoding("UTF-8");
	String reservation_number = request.getParameter("reservation_number"); //이건 쿼리 짜기
	String rental_place = request.getParameter("rental_place");
	String return_place = request.getParameter("return_place");
	String rental_date = request.getParameter("rental_date");
	String return_date = request.getParameter("return_date");
	String total_rental_date = request.getParameter("total_rental_date");
	String total_rental_time = request.getParameter("total_rental_time");
	String insurance_number = request.getParameter("insurance_number");
	String car_number = request.getParameter("car_number");
	String membership_number = request.getParameter("membership_number");
	String payment_number = request.getParameter("payment_number");
	int intReservation_number = Integer.parseInt(reservation_number);
	int intTotal_rental_date = Integer.parseInt(total_rental_date);
	int intTotal_rental_time = Integer.parseInt(total_rental_time);
	int intInsurance_number = Integer.parseInt(insurance_number);
	int intMembership_number = Integer.parseInt(membership_number);
	int intPayment_number = Integer.parseInt(payment_number);
	
	int result = reservationInfoDAO.saveReservationInfo(intReservation_number, rental_place,
			return_place, rental_date, return_date, intTotal_rental_date, intTotal_rental_time,
			intInsurance_number, car_number, intMembership_number, intPayment_number);
	
	System.out.println(result);
	if(result > 0){
	%>
		<script>
			alert('예약 성공');
			location.href = 'payment.jsp';
		</script>
	<%		
		} else {
	%>
		<script>
			alert('예약 실패');
			history.back();
		</script>
	<%
		}
	%>
</body>
</html>
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
	String rental_place = request.getParameter("rental_place"); 
	String return_place = request.getParameter("return_place"); 
	String rental_date = request.getParameter("rental_date"); //
	String return_date = request.getParameter("return_date"); //여기밑
	
	rental_date = rental_date.replace('T', ' ');
	return_date = return_date.replace('T', ' ');
	
	String insurance_number = request.getParameter("insurance_number"); //
	String car_number = request.getParameter("car_number"); //
	String membership_number = request.getParameter("membership_number"); //
	String payment_number = request.getParameter("payment_number"); //지울예정
	
	if (insurance_number == null || car_number == null || membership_number == null
		|| rental_place == null || return_place== null || rental_date==null || return_date==null) {
        %>
        <script>
            alert('필수 정보를 모두 입력해주세요.');
            history.back();
        </script>
        <%
    } else {
	
	int intInsurance_number = Integer.parseInt(insurance_number);
	int intMembership_number = Integer.parseInt(membership_number);
	int a = 1;
	
	int result = reservationInfoDAO.saveReservationInfo(rental_place,
			return_place, rental_date, return_date, return_date, rental_date,return_date, rental_date,
			intInsurance_number, car_number, intMembership_number, a);
	
	ReservationInfoDTO rsrvDTO = reservationInfoDAO.findReservationByMembershipNumber(intMembership_number);
	int reservation_number = rsrvDTO.getReservation_number(); 
	
	//예약번호 !!!
	//int reservation_number   = 
	System.out.println(Integer.toString(result));
	//System.out.println(result + rental_place + return_place + " " + rental_date + " " + return_date + " " + intInsurance_number + " " + car_number + " " + intMembership_number);
	
	if(insurance_number != null){
	%>
		<script>
			alert('예약 성공');
			location.href = 'payment.jsp?reservation_number=<%=reservation_number%>';
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
    }
	%>
</body>
</html>
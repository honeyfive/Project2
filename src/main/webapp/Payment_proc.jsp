<%@page import="db.dao.PaymentInfoDAO"%>
<%@page import="db.dto.PaymentInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="db.dao.ReservationInfoDAO" %>
    <%@page import="db.dto.ReservationInfoDTO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴카</title>
<link rel="shortcut icon" href="./images/favicon.png" type="image/png" sizes="32x32">
</head>
<body>
   <%
   
      PaymentInfoDAO paymentInfoDAO = new PaymentInfoDAO();
  	  ReservationInfoDAO reservationInfoDAO = new ReservationInfoDAO();
  	  
    
      request.setCharacterEncoding("UTF-8");
      
      String payment_price = request.getParameter("payment_price");
      String payment_type = request.getParameter("payment_type");
      String reservation_number = request.getParameter("reservation_number");
     
      int intPayment_price = Integer.parseInt(payment_price);
      int intReservation_number = Integer.parseInt(reservation_number);
     
      int result = paymentInfoDAO.savePaymentInfo(intPayment_price, payment_type, intReservation_number);
      
      
      ReservationInfoDTO reservationInfo = new ReservationInfoDTO();
      reservationInfo.setReservation_number(intReservation_number);
      
      int result2 = reservationInfoDAO.modifyPaymentNumber(reservationInfo);
      
      
      System.out.println(result + result2);
   
      if(result > 0){
   %>
      <script>
         alert('결제 성공');
         location.href = 'mainpage.jsp'; //해당 경로로 페이지 이동
      </script>
   <%
      } else {
   %>
      <script>
         alert('결제 실패');
         history.back(); //뒤로가기
      </script>
   <%   
      }
   %>

</body>
</html>
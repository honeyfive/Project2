<%@page import="db.dao.PaymentInfoDAO"%>
<%@page import="db.dto.PaymentInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="db.dao.ReservationInfoDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   
      PaymentInfoDAO paymentInfoDAO = new PaymentInfoDAO();
   
      request.setCharacterEncoding("UTF-8"); //문자인코딩 설정
      String payment_price = request.getParameter("payment_price");
      String payment_type = request.getParameter("payment_type");
      String reservation_number = request.getParameter("reservation_number");
      String payment_state = request.getParameter("payment_state");
      
      int intPayment_price = Integer.parseInt(payment_price);
      int intReservation_number = Integer.parseInt(reservation_number);
   
      
      int result = paymentInfoDAO.savePaymentInfo(intPayment_price, payment_type, intReservation_number);
      
      System.out.println(result);
   
      
      if(result > 0){
   %>
      <script>
         alert('저장 성공');
         location.href = 'mainpage.jsp'; //해당 경로로 페이지 이동
      </script>
   <%
      } else {
   %>
      <script>
         alert('저장 실패');
         history.back(); //뒤로가기
      </script>
   <%   
      }
   %>

</body>
</html>
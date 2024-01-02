<%@page import="db.dto.CarRentalManagementDTO"%>
<%@page import="db.dao.CarRentalManagementDAO"%>
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


	<% 	
		//이전 예약 페이지에서 값 전달!!! 
		// 어떻게 전달할건가 어떻게 받을건가!!
		
		// 직접수정 or 이전 담당자 얘기해서 협의 
		//int reservation_number = request.getParameter(""); 
		
		
		ReservationInfoDAO reservationInfoDAO = new ReservationInfoDAO();
		ReservationInfoDTO reservationInfoDTO = reservationInfoDAO.findReservationInfoByRsrvNumber(1140);

	
		InsuranceInfoDAO insuranceDAO = new InsuranceInfoDAO();
		InsuranceInfoDTO insuranceDTO = insuranceDAO.findInsuranceInfoByInsuNumber(reservationInfoDTO.getInsurance_number());
		
		
		CarInfoDAO carInfoDAO = new CarInfoDAO();
		CarInfoDTO carInfoDTO = carInfoDAO.findCarInfoByCarNumber(reservationInfoDTO.getCar_number());
		
		
		CarRentalManagementDAO carRentalManagementDAO = new CarRentalManagementDAO();
		CarRentalManagementDTO carRentalManagementDTO = carRentalManagementDAO.findCarRentalManagementInfoByCarNumber(reservationInfoDTO.getCar_number());
		
		
		double car_price = ((double)carRentalManagementDTO.getRental_costs() / 1440 ) * reservationInfoDTO.getTotal_rental_time();
		double total_price= ((double)carRentalManagementDTO.getRental_costs() / 1440 ) * reservationInfoDTO.getTotal_rental_time() + insuranceDTO.getInsurance_price();
		
		PaymentInfoDAO paymentInfoDAO = new PaymentInfoDAO();
	    List<PaymentInfoDTO> paymentInfoList = paymentInfoDAO.findPaymentInfoList();
	     
	    MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	    MemberInfoDTO memberInfoDTO = memberInfoDAO.findMemberById(reservationInfoDTO.getMembership_number());

%>

	

 <% // @ include file="header.jsp" %>
 
 
		<h1>결제페이지</h1>
	
	<h3>예약정보 확인</h3>
		
		<table border="1">
   
      <tr>
         <th>차량명</th>
      </tr>
      
         <tr>
            <td><%=carInfoDTO.getCar_name() %></td>
         </tr>
         
   </table>
		 

   <table border="1">
   
      <tr>
         <th>대여장소</th>
         <th>대여시간</th>
         <th>사용시간(분)</th>
         <th>반납장소</th>
         <th>반납시간</th>
      </tr>
     
         <tr>
            <td><%=reservationInfoDTO.getRental_place()%></td>
            <td><%=reservationInfoDTO.getRental_date()%></td>
            <td><%=reservationInfoDTO.getTotal_rental_time()%></td>
              <td><%=reservationInfoDTO.getReturn_place()%> </td>
              <td><%=reservationInfoDTO.getReturn_date()%></td>
         </tr>
   
   </table>
		
		
		<h3>차량정보</h3>
   <table border="1">
   
      <tr>
         <th>연식</th>
         <th>연료</th>
         <th>승차인원</th>
      </tr>
        
      
         <tr>
            <td><%=carInfoDTO.getModel_year() %></td>
            <td><%=carInfoDTO.getCar_type() %></td>
            <td><%=carInfoDTO.getPassenger_count() %></td>
         </tr>  
   
   </table>
   
   
   <h3>차량옵션</h3>
   <table border="1">
   
      <tr>
         <th>옵션 1</th>
         <th>옵셥 2</th>
      </tr>
      
      <tr>
      
         <tr>
            <td><%=carInfoDTO.getOption1()%></td>
            <td><%=carInfoDTO.getOption2()%></td>
         </tr>
  
   </table>
   
   <h3>보험정보</h3>
		
		<table border="1">
   
      <tr>
         <th>보험명</th>
         <th>보험료</th>
      </tr>
      
         <tr>
            <td><%=insuranceDTO.getInsurance_type()%></td>
            <td><%=insuranceDTO.getInsurance_price()%></td>
         </tr>
         
   </table>
   
      <h3>운전자정보</h3>

   <form>	
      <label>이름 : </label><input type="text" id="input_name" name="name" value="<%=memberInfoDTO.getName()%>">
      <label>생년월일 : </label><input type="text" id="input_birthday" name="birthday" value="<%=memberInfoDTO.getBirthday()%>">
      <label>휴대폰번호 : </label><input type="text" id="input_phoneNumber" name="phoneNumber" value="<%=memberInfoDTO.getTel()%>">
      <label>이메일 : </label><input type="text" id="input_eMail" name="eMail" value="<%=memberInfoDTO.getEmail()%>">
   </form>
   
 
   
   

	<h3>결제금액</h3>
	<div>총 결제금액 : <%=(int)total_price %> 원 </div>  <%-- if 취소하면 총액*0.1 --%>
	<p>차량 대여 요금 : <%=(int)car_price%> 원 </p>
	<p>보험요금(<%=insuranceDTO.getInsurance_type()%>) : <%=insuranceDTO.getInsurance_price()%> 원 </p>
	
	
 	<h3>결제 수단</h3>
      
  <%--       <%
         if(paymentInfoList != null) {
             for(PaymentInfoDTO paymentInfo : paymentInfoList){
         %>
      
      <tr><%=paymentInfo.getPayment_type()%><input type="checkbox"></tr>
      <%
      }
      }
      %> --%>
	
	

	<h3>결제하기</h3>
	
	<form action="payment_proc.jsp" method="post">
		
		<button type="submit">결제하기</button>
	</form>
	
	
		<%
		//결제하기 버튼 눌렀을때, 테이블에 저장하는 단계 생성
	%>
	
	
	
	
	
	

		
	
	 

	
	

	
	
	
</body>
</html>
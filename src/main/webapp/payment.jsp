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
<title>휴카</title>
<link rel="stylesheet" href="./css/payment.css">
<link rel="stylesheet" href="./css/header2.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="./css/footer.css">
<link rel="shortcut icon" href="./images/favicon.png" type="image/png" sizes="32x32">
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
	
	

 <%@ include file="header.jsp" %>
 
 <div class="payment-topBox">
 <div class="payment-titleBox">결제페이지<div class="payment-titleText"></div></div>
 </div> 
	
	 <div class="payment-container">
        <div class="payment-box1">
	<h3> * 예약정보 확인</h3>
		
<div class="payment-box1-1">

	<h3> <i class="fa-solid fa-car-on"></i> <%=carInfoDTO.getCar_name()%></h3>
  
   <hr/> <br>
   
    <table class="rentReturn-table1">
      <tr>
         <td class="rentReturn-title">대여시간</td>
         <td class="rentReturn-title">사용시간(분)</td>
         <td class="rentReturn-title">반납시간</td>
      </tr>
     
         <tr>
            <th class="rentReturn-body"><%=reservationInfoDTO.getRental_date()%></th>
            <th class="rentReturn-body-time"><%=reservationInfoDTO.getTotal_rental_time()%></th>
            <th class="rentReturn-body"><%=reservationInfoDTO.getReturn_date()%></th>
         </tr>
         
    </table>
         
     <table class="rentReturn-table2">
         
         <tr>
        	<td class="rentReturn-title">대여장소</td> 
            <td class="rentReturn-title"><i class="fa-solid fa-angles-right"></i></td>
            <td class="rentReturn-title">반납장소</td>
      </tr>

         <tr>
            <th class="rentReturn-body"><%=reservationInfoDTO.getRental_place()%></th> 
            <th></th>
            <th class="rentReturn-body"><%=reservationInfoDTO.getReturn_place()%> </th> 
         </tr>
      </table>
         
	</div>
		
	
	<div class="pay-carinfo-box">
        <input type="checkbox" id="pay-carinfo">
        <label for="pay-carinfo" class="pay-carinfo-click" onclick="">차량정보 / 차량옵션 <i class="fa-solid fa-chevron-down"></i>
        </label>
        <ul class="pay-carinfo-body">
        <li>
        차량정보 : 
        <i class="fa-regular fa-calendar-days"></i> <%=carInfoDTO.getModel_year() %>
        <i class="fa-solid fa-gas-pump"></i> <%=carInfoDTO.getCar_type() %>
        <i class="fa-solid fa-user"></i> <%=carInfoDTO.getPassenger_count() %>
        <hr/>
        차량옵션 : 
        <%=carInfoDTO.getOption1()%>  & <%=carInfoDTO.getOption2()%>
    	</li>
    	</ul>
    </div>
  
   <h3> * 보험정보</h3>
   
   	<span>보험명 : <%=insuranceDTO.getInsurance_type()%> </span>
	<span>보험료 : <%=insuranceDTO.getInsurance_price()%>원</span>
	
  
   
   <h4> - 대인/대물/자손 보상한도 및 자기부담금</h4>
   
   <table class="insuInfoTable">
    <thead>
    <tr>
      <th scope="cols">구분</th>
      <th scope="cols">보상한도</th>
      <th scope="cols">자기부담금</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <th scope="row">대인1-2</th>
      <td>무한</td>
      <td>30만원</td>
    </tr>
    <tr>
      <th scope="row">대물</th>
      <td>최대 2,000만원</td>
      <td>50만원</td>
    </tr>
    <tr>
      <th scope="row">자손</th>
      <td>최대 1,500만원</td>
      <td>30만원</td>
    </tr>
    </tbody>
  </table>
  
  <span class="insu-info">보험은 현장에서 작성하는 계약서를 기준으로 적용됩니다. 반드시 계약서를 확인해주시기 바랍니다.</span>
  
   <h3> * 운전자정보</h3>
   <div class="payment-box1-1">
   
      <label>이름</label> <br>
      <input type="text" id="input_name" name="name" value="<%=memberInfoDTO.getName()%>" class="payment-input"> <br>
      <label>생년월일</label> <br>
      <input type="text" id="input_birthday" name="birthday" value="<%=memberInfoDTO.getBirthday()%>" class="payment-input"> <br>
      <label>휴대폰번호</label> <br>
      <input type="text" id="tel" name="tel" value="<%=memberInfoDTO.getTel()%>" class="payment-input"> <br>
      <label>이메일</label>  <br>
      <input type="text" id="input_eMail" name="eMail" value="<%=memberInfoDTO.getEmail()%>" class="payment-input">
   	  
   	  <div class="license-info">
   	   		<div class="license-info-icon"><i class="fa-solid fa-car-rear"></i> <i class="fa-solid fa-plus"></i> <i class="fa-solid fa-id-card"></i></div>
   	  		<div>차량대여 시, 운전자는 운전면허증을 꼭 지참해주세요.</div>
   	  		<div>면허증 확인 및 계약서 작성이 꼭 필요합니다.</div></div>
   	  </div>
    	  
   	  
	<div class="box1-totalPrice"> * 총 결제금액 : <%=(int)total_price %>원 </div>
	<div class="box1-detailPrice1">차량 대여 요금 : <%=(int)car_price%> 원 </div>
	<div class="box1-detailPrice2">보험요금(<%=insuranceDTO.getInsurance_type()%>) : <%=insuranceDTO.getInsurance_price()%> 원 </div>

  
   </div>
   
<div class="payment-box2"> 
	<h3>결제정보</h3>
	<div class="totalPrice">총 결제금액 : <%=(int)total_price %>원 </div>
	<div class="detailPrice1">차량 대여 요금 : <%=(int)car_price%> 원 </div>
	<div class="detailPrice2">보험요금(<%=insuranceDTO.getInsurance_type()%>) : <%=insuranceDTO.getInsurance_price()%> 원 </div>
	
	<form action="Payment_proc.jsp" method="post">
 	<h3>결제수단 선택</h3>
      <select name="payment_type" class="payment-type-select">
      	<option value="T">실시간계좌이체</option>
      	<option value="C">카드결제</option>
      	<option value="P">휴대폰결제</option>
      </select>


		
			
		<input type="hidden" name="reservation_number" value="<%=reservationInfoDTO.getReservation_number()%>">
		<input type="hidden"  name="payment_price" value="<%=(int)total_price %>">
		
		<button type="submit" class="payment-Btn">결제하기</button>
	</form>
	
		<div class="paymentAgree"> * 위 내용을 모두 확인하였으며, 결제에 동의합니다</div>
	
	</div>
</div>
	
	
	 <%@ include file="footer.jsp" %>

		
	
	
</body>
</html>
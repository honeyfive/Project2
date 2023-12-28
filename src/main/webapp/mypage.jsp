<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="db.dao.MemberInfoDAO"  %>
<%@ page import="db.dto.MemberInfoDTO" %>
<%@ page import="db.dao.PaymentInfoDAO" %>
<%@ page import="db.dto.PaymentInfoDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" 
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"/>
    
    <link rel="stylesheet" href="css/mypage.css">
</head> 
<body>
	<%
		MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		List<MemberInfoDTO> memberInfoDTO = memberInfoDAO.findMemberList();
		PaymentInfoDAO paymentInfoDAO = new PaymentInfoDAO();
		List<PaymentInfoDTO> paymentInfoDTO = paymentInfoDAO.findPaymentTypeInfoList();
	%>

    <!--헤더-->
    
    <%@ include file="header.jsp" %>

    <!-- 마이페이지 메인 -->
    <div class="mypage_container">
        <div class="my_info_box">
            <div class="my_info">
                <div class="my_name"> 000님</div>
                <div class="my_email"> 000@gmail.com</div>
            </div>
            <div class="member_rent_use">
                <div class="memeber_rating_box">
                    <i class="fa-regular fa-star-half-stroke"></i>
                    <span class="member_rent_use_text">내 등급</span>
                    <!-- 회원등급 보여주는 곳 -->
                </div>
                <div class="use_count_box">
                    <i class="fa-solid fa-list-check"></i>
                    <span class="member_rent_use_text">이용 횟수</span>
                    <!-- 회원 렌트 이용횟수 보여주는 곳 -->
                </div>
                <div class="overdue_history_box">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                    <span class="member_rent_use_text">연체 횟수</span>
                    <!-- 회원 연체 횟수 보여주는 곳 -->
                </div>
            </div>
            <div class="member_level"></div>
            
        </div>
        <div class="rent_progress_box">
            <!-- 진행중인 렌트내역 -->
            <div class="rent_progress"></div> 
            
            <!-- 진행중인 렌트내역이 없을때 -->
            <div class="not_rent_progress">
                <i class="fa-regular fa-face-flushed"></i>
                <p class="not_rent_progress_ment">진행중인 렌트 내역이 없습니다</p>
                <p class="not_rent_progress_ment" style="color: #0D6FFC; font-weight: bold;">지금 고객님이 원하는 렌트카를 빌리고 신나게 떠나볼까요?</p>
                <button class="go_to_reservation">렌트하러 가기</button>
            </div>
        </div>
        <div class="member_payment_type_proc_box">
            <div class="payment_proc">
                <div class="payment_proc_text">결제수단 수정</div> 
                <div class="payment_proc_option">
                    <select class="payment_option">
                    <% if(paymentInfoDTO != null) {
                    	for(PaymentInfoDTO paymentTypeInfo : paymentInfoDTO){
                    	%>
                        <option><%=paymentTypeInfo.getPayment_type()%></option>
                        <%}
                    	} %>
                    </select>
                </div>
                
            </div>
        </div>
        <div class="my_info_proc_box">
            <div class="my_info_proc">
                <p class="my_info_proc_text"> 내 정보 관리</p>
                <i class="fa-solid fa-angle-right"></i>
                <!-- 개인정보 수정 페이지 -->
            </div>
        </div>
        <div class="customer_service_box">
            <div class="customer_service">
                <p class="customer_service_center">고객 센터</p>
                <p class="customer_service_info">매일(공휴일 포함) 오전 9시 ~ 오후 6시 </p>
                <p class="customer_service_info">점심시간 오후 12시30분 ~ 1시30분 (1시간)</p>
            </div>
            <div class="go_to_service_center"><i class="fa-solid fa-angle-right"></i></div>
            <!-- 고객센터로 가는 경로 -->
        </div>

    </div>


	<!-- 푸터 -->
    <%@ include file="footer.jsp" %>
    
    
    
</body>
</html>
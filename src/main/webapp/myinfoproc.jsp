<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" 
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="css/myinfoproc.css">
</head> 
</head>
<body>
    <!--헤더-->
    <%@ include file="header.jsp" %>

    <!-- 내 정보 페이지 메인 -->
    <div class="my_Info_main_container">
        <div class="my_info_box">
            <p class="my_info_text"> 내 정보 </p>
        </div>
        <div class="my_info_main_box">
            <div class="my_name">
                <!-- 회원 아이디 -->
                <p class="member_name"> 000 </p>
                <!-- 회원 이메일 -->
                <p class="member_email_big"> 000@gmail.com </p>
            </div>
            <div class="my_email_id">
                <p> 이메일계정 </p>
                <div class="go_to_member_email">
                    <p class="member_email"> 000@gmail.com  </p>
                    <i class="fa-solid fa-angle-right"></i>
                </div>
            </div>
            <div class="my_phonenum">
                <span> 휴대폰 번호 </span>
                <i class="fa-solid fa-angle-right"></i>
            </div>
            <div class="my_nickname">
                <p>닉네임</p>
                <div class="go_to_member_nickname">
                    <p class="member_nickname">000님 </p>
                    <i class="fa-solid fa-angle-right"></i>
                </div>
            </div>
            <div class="my_birthday">
                <p> 생년월일 </p>
                <i class="fa-solid fa-angle-right"></i>
            </div>
            <div class="my_gender">
                <p> 성별 </p>
            </div>
        </div>
        <div class="account_linkage">
            <span class="account_linkage_text"> 계정연동</span>
            <div class="kakaotalk_box">
                <p><i class="fa-solid fa-comment-sms"></i> &nbsp;카카오톡</p>
                <p><i class="fa-solid fa-check"></i> 연동완료 </p>
            </div>
            <div class="apple_box">
                <p><i class="fa-brands fa-apple"></i> &nbsp;Apple</p>
                <button class="go_to_apple_linkage">연동하기</button>
            </div>
            <div class="naver_box">
                <p><i class="fa-regular fa-n"></i> &nbsp;네이버</p>
                <button class="go_to_naver_linkage">연동하기</button>
            </div>
        </div>
    </div>


    <!-- 푸터 -->
    <%@ include file="footer.jsp" %>


</body>
</html>
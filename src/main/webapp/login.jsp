<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css">
</head>
<body>
<%@ include file="header.jsp" %>

    <!-- 로그인 메인 -->
    <div class="content">
        <div class="content-main">
            <div class="login-box">
                <div class="login-title">로그인</div>
                <!--로그인 입력창-->
                <form action="login_proc.jsp" class="login">
                    <input class="login-id login-input" type="text" placeholder="아이디를 입력하세요." name="id">
                    <input class="login-pw login-input" type="password" placeholder="비밀번호를 입력하세요." name="password">
                    <input class="login-submit login-input" type="submit" value="로그인"
                        onclick="location.href='~'"> <!-- 메인 화면 나중에 연결하기-->
                </form>
                <hr>
                <!--회원가입 유도창-->
                <div class="signin">
                    <div class="signin-plz singin-icon"><i class="fa-solid fa-hand"></i></div>
                    <div class="signin-plz signin-wait">아직 회원이 아니신가요?</div>
                    <div class="signin-plz signin-ad ">회원가입하고 다양한 혜택도 받아가세요!</div>
                    <div class="signin-go "><button class="login-input login-submit"
                        onclick="location.href='signup.jsp'" >회원가입 하러 가기</button></div> <!-- 회원가입페이지 연결-->
                </div>
            </div>
        </div>
    </div>
        
</body>
</html>
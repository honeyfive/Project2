<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴카</title>
<link rel="shortcut icon" href="./images/favicon.png" type="image/png" sizes="32x32">
<link rel="stylesheet" href="css/login.css">
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<%@ include file="header2.jsp"%>

	<!-- 로그인 메인 -->
	<div class="content">
		<div class="content-main">
			<div class="login-box">
				<div class="login-title">로그인</div>
				<!--로그인 입력창-->
				<form action="login_proc.jsp" class="login"
					onsubmit="return validateForm()">
					<input class="login-id login-input" type="text"
						placeholder="아이디를 입력하세요." name="id" autocomplete="off">
					<input
						class="login-pw login-input" type="password"
						placeholder="비밀번호를 입력하세요." name="password" autocomplete="off">
					<input
						class="login-submit login-input" type="submit" value="로그인">
				</form>
				<hr>
				<!--회원가입 유도창-->
				<div class="signin">
					<div class="signin-plz singin-icon">
						<i class="fa-solid fa-hand"></i>
					</div>
					<div class="signin-plz signin-wait">아직 회원이 아니신가요?</div>
					<div class="signin-plz signin-ad ">회원가입하고 다양한 혜택도 받아가세요!</div>
					<div class="signin-go">
						<button class="login-input login-submit"
							onclick="location.href='signup.jsp'">회원가입 하러 가기</button>
					</div>
					<!-- 회원가입페이지 연결-->
				</div>
			</div>
		</div>
	</div>

	<script>
		function validateForm() {
			var id = document.getElementsByName("id")[0].value;
			var password = document.getElementsByName("password")[0].value;

			// 특정 아이디와 비밀번호를 확인하여 이동할 페이지 결정
			if (id === "admin" && password === "admin1!") {
				location.href = './manage_main.jsp';
				return false; // 폼 제출 막기
			} else {
				// 다른 경우에는 기본 동작(폼 제출) 수행
				return true;
			}
		}
	</script>
	<script type="text/javascript">
	 window.history.forward();
	 function noBack(){window.history.forward();}
	</script>
</body>
</html>
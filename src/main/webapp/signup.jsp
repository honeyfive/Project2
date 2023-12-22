<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="./css/signup.css">
</head>
<body>

	<%@ include file="header.jsp"%>

	<!-- 회원가입-->
	<div class="content">
		<div class="content-main">
			<!-- 회원가입 메인-->
			<div class="signin-box">
				<div class="signin-title">회원가입</div>
				<!--회원가입 입력창-->
				<form action="~" class="signin">
					<!-- 아이디-->
					<div class="signin-input">
						<div class="signin-id">아이디</div>
						<div class="input-box">
							<div class="input-item">
								<input class="input-id" type="text" placeholder="최대 10글자"
									name="id">
							</div>
							<div>
								<button class="id-chd">확인</button>
							</div>
						</div>
					</div>
					<!-- 비밀번호 -->
					<div class="signin-input">
						<div class="signin-id">비밀번호</div>
						<div class="input-box">
							<div cla>
								<input class="input-id input-pw" type="input"
									placeholder="최대 10글자" name="pw">
								<!-- <i class="fa-solid fa-eye"></i> -->
							</div>
							<div>
								<button class="id-chd">확인</button>
							</div>
						</div>
						<div class="caution signin-id">비밀번호는 영문 + 숫자 + 특수기호를 포함해야
							합니다</div>
					</div>

					<div class="signin-input signin-input-id">
						<div class="signin-id">비밀번호 확인</div>
						<div class="signin-id">
							<input class="input-new" type="text" name="pw-check">
						</div>
						<div class="caution signin-id" id="pw-check">비밀번호가 일치합니다!</div>
						<!-- 비번 일치하면 문구 나타남-->
					</div>
					<!-- 이름-->
					<div class="signin-input signin-input-id">
						<div class="signin-id">이름</div>
						<div class="signin-id">
							<input class="input-new" type="text" name="name">
						</div>
					</div>
					<!-- 생년월일 -->
					<div class="signin-input signin-input-id">
						<div class="signin-id">생년월일</div>
						<div class="signin-birth">
							<input class="birth-box" name="birth-year" id="birth-year"
								type="text" placeholder="출생년도"> <select
								class="birth-box" name="birth-month" id="birth-month">
								<option disabled selected>월</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>

							</select> <select class="birth-box" name="birth-date" id="birth-date">
								<option disabled selected>일</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
							</select>
						</div>
						<!-- 성별 -->
						<div class="signin-input signin-input-id">
							<div class="signin-id">성별</div>
							<div class="signin-id signin-gender">
								<div>
									<input class="input-gender" type="radio" name="gender"
										value="F">남성
								</div>
								<div>
									<input class="input-gender" type="radio" name="gender"
										value="M">여성
								</div>
							</div>
						</div>
						<!-- 운전면허번호 -->
						<div class="signin-input signin-input-id">
							<div class="signin-id">운전면허번호</div>
							<div class="input-box">
								<div class=" signin-li">
									<div>
										<input class="input-li" type="text" name="license-1">
									</div>
									<div class="input-li-slash">-</div>
									<div>
										<input class="input-li" type="text" name="license-2">
									</div>
									<div class="input-li-slash">-</div>
									<div>
										<input class="input-li" type="text" name="license-3">
									</div>
									<div class="input-li-slash">-</div>
									<div>
										<input class="input-li" type="text" name="license-4">
									</div>
								</div>
								<div>
									<button class="id-chd">확인</button>
								</div>
							</div>
						</div>
						<!-- 면허취득일 -->
						<div class="signin-input signin-input-id">
							<div class="signin-id">면허취득일</div>
							<div class="signin-birth">
								<input class="birth-box" name="license-year" id="license-year"
									type="text" placeholder="취득년도"> <select
									class="birth-box" name="license-month" id="license-month">
									<option disabled selected>월</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>

								</select> <select class="birth-box" name="license-date" id="license-date">
									<option disabled selected>일</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
							</div>
							<!-- 전화번호 -->
							<div class="signin-input signin-input-id">
								<div class="signin-id">전화번호</div>
								<div class="input-box">
									<div class="input-item">
										<div class=" signin-tel">
											<div>
												<input class="input-tel" type="text" name="tel-1">
											</div>
											<div class="input-li-slash">-</div>
											<div>
												<input class="input-tel" type="text" name="tel-2">
											</div>
											<div class="input-li-slash">-</div>
											<div>
												<input class="input-tel" type="text" name="te1-3">
											</div>
										</div>
									</div>
									<div>
										<button class="id-chd">확인</button>
									</div>
								</div>
							</div>
							<!-- 이메일 -->
							<div class="signin-input signin-input-id">
								<div class="signin-id">이메일</div>
								<div class="input-box">
									<div class="input-item">
										<input class="input-id" type="text" name="email">
									</div>
									<div>
										<button class="id-chd">확인</button>
									</div>
								</div>
							</div>
							<!-- 동의 문구 -->
							<div class="checkbox">
								<div>
									<input type="checkbox" name="sms-ok"> SMS/전화 수신 동의 (선택)
								</div>
								<div>
									<input type="checkbox" name="email-ok"> 이메일 수신 동의 (선택)
								</div>
								<div>
									<input type="checkbox" name="l-am-ok"> 개인정보수집 및 이용 동의
								</div>
							</div>
							<!-- 회원가입버튼-->
							<div class="signin-btn">
								<input class="signin-submit input-id" type="submit" value="회원가입">
							</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
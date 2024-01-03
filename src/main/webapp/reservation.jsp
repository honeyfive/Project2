<%@page import="db.dto.MemberInfoDTO"%>
<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="db.dto.PaymentInfoDTO"%>
<%@page import="db.dao.PaymentInfoDAO"%>
<%@page import="db.dto.CarRentalManagementDTO"%>
<%@page import="db.dao.CarRentalManagementDAO"%>
<%@page import="db.dto.ReservationInfoDTO"%>
<%@page import="db.dao.ReservationInfoDAO"%>
<%@page import="db.dto.CarInfoDTO"%>
<%@page import="db.dao.CarInfoDAO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.InsuranceInfoDAO"%>
<%@page import="db.dto.InsuranceInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴카</title>
<link rel="shortcut icon" href="./images/favicon.png" type="image/png" sizes="32x32">
<link rel="stylesheet" href="./css/header2.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="./css/reservation.css">
<link rel="stylesheet" href="./css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="header2.jsp"%>

	<%
	//보험 정보 리스트 불러오기
	InsuranceInfoDAO insuranceDAO = new InsuranceInfoDAO();
	List<InsuranceInfoDTO> insuranceinfoList = insuranceDAO.findInsuranceInfoList();

	//차량 정보 리스트 불러오기
	CarInfoDAO carInfoDAO = new CarInfoDAO();
	List<CarInfoDTO> carInfoList = carInfoDAO.findCarInfoList();
	List<CarInfoDTO> carInfoListBySize = carInfoDAO.findCarInfoListBySize();
	List<CarInfoDTO> carInfoListByType = carInfoDAO.findCarInfoListByType();

	//예약 정보 리스트 불러오기
	//예약 정보 - 대여장소-아산
	ReservationInfoDAO reservationInfoDAO = new ReservationInfoDAO();
	List<ReservationInfoDTO> reservationInfoListByRentalPlaceAsan = reservationInfoDAO
			.findReservationInfoListByRentalPlaceAsan();
	//예약 정보 - 대여장소-천안
	List<ReservationInfoDTO> reservationInfoListByRentalPlaceCheonan = reservationInfoDAO
			.findReservationInfoListByRentalPlaceCheonan();

	//()안에 예약번호로 예약 정보 불러오기
	ReservationInfoDTO reservationInfoDTO = reservationInfoDAO.findReservationInfoByRsrvNumber(1140);
	//보험 번호로 보험 정보 불러오기
	InsuranceInfoDTO insuranceDTO = insuranceDAO.findInsuranceInfoByInsuNumber(reservationInfoDTO.getInsurance_number());
	//예약 정보안 차번호로 차정보 불러오기
	CarInfoDTO carInfoDTO = carInfoDAO.findCarInfoByCarNumber(reservationInfoDTO.getCar_number());

	//차대여관리 정보
	CarRentalManagementDAO carRentalManagementDAO = new CarRentalManagementDAO();
	CarRentalManagementDTO carRentalManagementDTO = carRentalManagementDAO
			.findCarRentalManagementInfoByCarNumber(reservationInfoDTO.getCar_number());

	double car_price = ((double) carRentalManagementDTO.getRental_costs() / 1440)
			* reservationInfoDTO.getTotal_rental_time();
	double total_price = ((double) carRentalManagementDTO.getRental_costs() / 1440)
			* reservationInfoDTO.getTotal_rental_time() + insuranceDTO.getInsurance_price();

	PaymentInfoDAO paymentInfoDAO = new PaymentInfoDAO();
	List<PaymentInfoDTO> paymentInfoList = paymentInfoDAO.findPaymentInfoList();

	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	MemberInfoDTO memberInfoDTO = memberInfoDAO.findMemberById(reservationInfoDTO.getMembership_number());

	//
	%>

	<div class="location-modal">
		<!-- 모달창 - 지역 -->
		<div class="location-modal-body">
			<div class="location-modal-close-Btn">X</div>
			<div class="location-modal-header-text">대여장소선택</div>
			<div class="location-modal-body-container">
				<div class="location-modal-mainBox1">
					아산
					<div class="location-modal-mainBox1-item">
						<%
						if (reservationInfoListByRentalPlaceAsan != null) {
							for (ReservationInfoDTO reservationInfo : reservationInfoListByRentalPlaceAsan) {
						%>

						<p class="asanList"><%=reservationInfo.getRental_place()%></p>

						<%
						}
						}
						%>
					</div>
				</div>
				<div class="location-modal-mainBox2">
					천안
					<div class="location-modal-mainBox2-item">
						<%
						if (reservationInfoListByRentalPlaceCheonan != null) {
							for (ReservationInfoDTO reservationInfo : reservationInfoListByRentalPlaceCheonan) {
						%>

						<p class="cheonanList"><%=reservationInfo.getRental_place()%></p>

						<%
						}
						}
						%>
					</div>
				</div>
			</div>
			<div class="location-modal-check-Btn">다음</div>
		</div>
	</div>
	<!-- 모달창 - 달력 -->
	<div class="date-modal">
		<div class="date-modal-body">
			<div class="date-modal-close-Btn">X</div>
			대여일<input type="date">대여시간<input type="time">반납일<input
				type="date">반납시간<input type="time">
		</div>
	</div>
	<!-- 예약페이지  -->
	<div class="rv-locationAndDateBox-sticky">
		<div class="rv-locationAndDateBox">
			<div class="rv-locationAndDateBox-location"> <!-- 대여 반납 창 따로 만들었습니다 ~ -->
				<div class="place rent-place">대여장소선택</div>
				<div class="place return-place">반납장소선택</div>
			</div>
			<div class="rv-locationAndDateBox-date"></div>
			<div class="rv-locationAndDateBox-selectCarBtn">차량검색</div>
		</div>
	</div>
	<div class="rv-container">
		<div class="rv-carInfoBox-container">
			<div class="rv-carInfoBox-top">
				<div class="rv-carInfoBox-top-searchResult-text">검색결과</div>
			</div>
			<div class="rv-carInfoBox-main">
				<%
				if (carInfoList != null) {
					for (CarInfoDTO carInfo : carInfoList) {
				%>
				<div class="rv-carInfoBox-Box">
					<div class="rv-carInfoBox-Box-imgBox">
						<img class="car_image" src=<%=carInfo.getCar_image()%>>
					</div>
					<div class="rv-carInfoBox-Box-carInfoBox">
						<div class="rv-carInfoBox-Box-carName"><%=carInfo.getCar_name()%></div>
						<div class="rv-carInfoBox-Box-carYear">
							<p class="rv-carInfoBox-Box-carYear-textBox"><%=carInfo.getModel_year()%></p>
							<span class="rv-carInfoBox-Box-carSize"><%=carInfo.getCar_size() %></span>
							<span class="rv-carInfoBox-Box-carType"><%=carInfo.getCar_type() %></span>
						</div>
						<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice">
						<div class="rv-carInfoBox-Box-insuranceText">일반자차</div>
						<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice-text">원 부터</div>
						</div>
						<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice">
						<div class="rv-carInfoBox-Box-insuranceText">완전자차</div>
						<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice-text">원 부터</div>
						</div>
						<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice">
						<div class="rv-carInfoBox-Box-insuranceText">수퍼자차</div>
						<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice-text">원 부터</div>
						</div>
					</div>
				</div>
				<%
				}
				} else {
				// 데이터가 없을 때 처리할 부분
				}
				%>
			</div>
		</div>
		<div class="rv-filterBox">
		<form action="./payment.jsp" method="post">
			<div class="rv-filterBox-Main">
				<div class="rv-filterBox-Main-1">
					자차보험
					<div class="rv-filterBox-Main-1-data">
						<%
						if (insuranceinfoList != null) {
							for (InsuranceInfoDTO insuranceinfo : insuranceinfoList) {
						%>

						<%=insuranceinfo.getInsurance_type()%><input type="checkbox" value="<%=insuranceinfo.getInsurance_number()%>" name="insurance_number">

						<%
						}
						}
						%>
					</div>
				</div>
				<div class="rv-filterBox-Main-2">자동차모델
				<div class="rv-filterBox-Main-2-data">
					<div class="select" data-role="selectBox">
						<span date-value="optValue" class="selected-option"> <!-- 선택된 옵션 값이 출력되는 부분 -->
						</span>
						<ul class="hide">
							<%
							if (carInfoList != null) {
								for (CarInfoDTO carInfo : carInfoList) {
							%>
							<li><%=carInfo.getCar_name()%></li>
							<%
							}
							}
							%>
						</ul>
					</div>
				</div>
			</div>
				<div class="rv-filterBox-Main-3">
					차량크기
					<div class="rv-filterBox-Main-3-data">
						<form method="post" action="/carInfoBySize">
							<label for="selectAll">전체</label>
							<input type="checkbox" id="selectAllSizes" class="carCheckbox" value="all">
							
							<%
							if (carInfoListBySize != null) {
								for (CarInfoDTO carInfo : carInfoListBySize) {
							%>
	
							<%=carInfo.getCar_size()%> <input type="checkbox" value="<%=carInfo.getCar_size()%>" class="carCheckbox">
							<%
							}
							}
							%>
						</form>
					</div>
				</div>
				<div class="rv-filterBox-Main-4">
					차량연료
					<div class="rv-filterBox-Main-4-data">
						<label for="selectAll">전체</label>
							<input type="checkbox" id="selectAllTypes" class="carTypeCheckbox" value="all">
						<%
						if (carInfoListByType != null) {
							for (CarInfoDTO carInfo : carInfoListByType) {
						%>

						<%=carInfo.getCar_type()%><input type="checkbox" value="<%=carInfo.getCar_type()%>" class="carTypeCheckobx">
						<%
						}
						}
						%>
					</div>

				</div>
				<div class="rv-filterBox-Main-5">
					필터 초기화
					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
						fill="currentColor" class="bi bi-arrow-counterclockwise"
						viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
							d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z" />
                        <path
							d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z" />
                      </svg>
				</div>

			</div>
			<div class="rv-filterBox-RVBtn">
				
					<button type="submit">예약하기</button>
				
			</div>
			</form>
		</div>
	</div>

	<!-- 푸터 -->
	<%@ include file="footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="./js/reservation.js"></script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    var carBoxes = document.querySelectorAll('.rv-carInfoBox-Box');
	    var carSizeCheckboxes = document.querySelectorAll('.carCheckbox');
	    var carTypeCheckboxes = document.querySelectorAll('.carTypeCheckobx');
	    var selectAllSizes = document.getElementById('selectAllSizes');
	    var selectAllTypes = document.getElementById('selectAllTypes');

	    selectAllSizes.addEventListener('change', toggleAllSizes);
	    selectAllTypes.addEventListener('change', toggleAllTypes);

	    carSizeCheckboxes.forEach(function(checkbox) {
	        checkbox.addEventListener('change', updateDisplayedCars);
	    });

	    carTypeCheckboxes.forEach(function(checkbox) {
	        checkbox.addEventListener('change', updateDisplayedCars);
	    });

	    function toggleAllSizes() {
	        carSizeCheckboxes.forEach(function(cb) {
	            cb.checked = selectAllSizes.checked;
	        });
	        updateDisplayedCars();
	    }

	    function toggleAllTypes() {
	        carTypeCheckboxes.forEach(function(cb) {
	            cb.checked = selectAllTypes.checked;
	        });
	        updateDisplayedCars();
	    }

	    function updateDisplayedCars() {
	        var selectedSizes = [];
	        var selectedTypes = [];

	        carSizeCheckboxes.forEach(function(cb) {
	            if (cb.checked) {
	                selectedSizes.push(cb.value.toLowerCase());
	            }
	        });

	        carTypeCheckboxes.forEach(function(cb) {
	            if (cb.checked) {
	                selectedTypes.push(cb.value.toLowerCase());
	            }
	        });

	        carBoxes.forEach(function(carBox) {
	            var carSizeElement = carBox.querySelector('.rv-carInfoBox-Box-carSize');
	            var carTypeElement = carBox.querySelector('.rv-carInfoBox-Box-carType');

	            var carSizeText = carSizeElement.textContent.trim().toLowerCase();
	            var carTypeText = carTypeElement.textContent.trim().toLowerCase();

	            var sizeFilter = selectedSizes.length === 0 || selectedSizes.includes(carSizeText) || selectedSizes.includes('all');
	            var typeFilter = selectedTypes.length === 0 || selectedTypes.includes(carTypeText) || selectedTypes.includes('all');

	            if ((selectedSizes.length === 1 && selectedTypes.length === 0 && sizeFilter) ||
	                (selectedTypes.length === 1 && selectedSizes.length === 0 && typeFilter) ||
	                (sizeFilter && typeFilter)) {
	                carBox.style.display = 'flex';
	            } else {
	                carBox.style.display = 'none';
	            }
	        });
	    }
	});





	</script>
</body>
</html>
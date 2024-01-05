<%@page import="db.dto.ReservationInfoDTO2"%>
<%@page import="db.dao.ReservationInfoDAO2"%>
<%@page import="db.dto.MemberInfoDTO"%>
<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="db.dto.PaymentInfoDTO"%>
<%@page import="db.dao.PaymentInfoDAO"%>
<%@page import="db.dto.CarRentalManagementDTO"%>
<%@page import="db.dao.CarRentalManagementDAO"%>
<%@page import="db.dto.ReservationInfoDTO"%>
<%@page import="db.dao.CarRentalInfoDAO"%>
<%@page import="db.dto.CarRentalInfoDTO"%>
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
<link rel="shortcut icon" href="./images/favicon.png" type="image/png"
	sizes="32x32">
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
	
	ReservationInfoDAO2 reservationInfoDAO2 = new ReservationInfoDAO2();
	List<ReservationInfoDTO2> reservationInfoListByRentalPlaceAsan2 = reservationInfoDAO2
			.findReservationInfoListByRentalPlaceAsan2();
	//예약 정보 - 대여장소-천안
	List<ReservationInfoDTO2> reservationInfoListByRentalPlaceCheonan2 = reservationInfoDAO2
			.findReservationInfoListByRentalPlaceCheonan();

	//()안에 예약번호로 예약 정보 불러오기
	ReservationInfoDTO reservationInfoDTO = reservationInfoDAO.findReservationInfoByRsrvNumber(1140);
	//보험 번호로 보험 정보 불러오기
	InsuranceInfoDTO insuranceDTO = insuranceDAO.findInsuranceInfoByInsuNumber(reservationInfoDTO.getInsurance_number());
	//예약 정보안 차번호로 차정보 불러오기
	CarInfoDTO carInfoDTO = carInfoDAO.findCarInfoByCarNumber(reservationInfoDTO.getCar_number());

	//차대여관리 정보
	CarRentalManagementDAO carRentalManagementDAO = new CarRentalManagementDAO();
	List<CarRentalManagementDTO> carRentalManagementList = carRentalManagementDAO.findCarRentalManagementInfoList();

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

	String membership_number = (String) session.getAttribute("id");
	MemberInfoDTO memberinfoMyDTO = memberInfoDAO.findMemberById(membership_number);
	System.out.println(memberinfoMyDTO.getMembership_number());

	// 차량 정보 + 렌탈 비용 리스트
	CarRentalInfoDAO carRentalInfoDAO = new CarRentalInfoDAO();
	List<CarRentalInfoDTO> carRentalInfoList = carRentalInfoDAO.findCarRentalInfo();
	System.out.println(reservationInfoDTO.getReservation_number());
	%>
	<form action="./addReservation_proc.jsp" method="post">
		<div class="location-modal">
			<input type="hidden" name="membership_number"
				value="<%=memberinfoMyDTO.getMembership_number()%>"> <input
				type="hidden" name="reservation_number"
				value="<%=reservationInfoDTO.getReservation_number()%>">
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
			<div class="location-modal-check-Btn">확인</div>
		</div>

		<!-- 반납장소 모달 -->
		<div class="location-modal2-body">
			<div class="location-modal2-close-Btn">X</div>
			<div class="location-modal2-header-text">반납장소선택</div>
			<div class="location-modal2-body-container">
				<div class="location-modal2-mainBox1">
					아산
					<div class="location-modal2-mainBox1-item">
						<%
						if (reservationInfoListByRentalPlaceAsan2 != null) {
							for (ReservationInfoDTO2 reservationInfo2 : reservationInfoListByRentalPlaceAsan2) {
						%>

						<p class="asanList2"><%=reservationInfo2.getRental_place()%></p>

						<%
						}
						}
						%>
					</div>
				</div>
				<div class="location-modal2-mainBox2">
					천안
					<div class="location-modal2-mainBox2-item">
						<%
						if (reservationInfoListByRentalPlaceCheonan2 != null) {
							for (ReservationInfoDTO2 reservationInfo2 : reservationInfoListByRentalPlaceCheonan2) {
						%>

						<p class="cheonanList2"><%=reservationInfo2.getRental_place()%></p>

						<%
						}
						}
						%>
					</div>
				</div>
			</div>
			<div class="location-modal2-check-Btn">확인</div>
		</div>
	</div>
	<!-- 모달창 - 달력 -->
		<div class="date-modal">
			<div class="date-modal-body">
				<div class="location-modal-header-text">대여/반납 날짜/시간선택</div>
				<div class="date-modal-close-Btn">X</div>
				<div class="centerDate"><p class="rentText">대여일</p><input type="datetime-local" class="rentDateText" name="rental_date" id="dateTime1"><p class="returnText" >반납일</p><input
					type="datetime-local" class="returnDateText" name="return_date" id="dateTime1"></div>
				
					<div class="date-modal3-check-Btn">확인</div>
			</div>
		</div>
	<!-- 예약페이지  -->
	<div class="rv-locationAndDateBox-sticky">
		<div class="rv-locationAndDateBox">
			<div class="rv-locationAndDateBox-location">
				<!-- 대여 반납 창 input type -->
				<input type="text" name="rental_place" class="place rent-place" value="대여장소선택" readonly>
				<input type="text" name="return_place" class="place return-place" value="반납장소선택" readonly>
				
			</div>
			<div class="rv-locationAndDateBox-date">대여/반납 날짜/시간선택 &nbsp<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
				<path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
				<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
			  </svg></div>
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
						for (CarRentalInfoDTO item : carRentalInfoList) {
					%>
					<div class="rv-carInfoBox-Box">
						<input type="radio" class="carCheckBox" value="<%=item.getCar_number()%>"
								name="car_number">
						<div class="rv-carInfoBox-Box-imgBox">
							 <img class="car_image"
								src=<%=item.getCar_image()%>>
						</div>
						<div class="rv-carInfoBox-Box-carInfoBox">
							<div class="rv-carInfoBox-Box-carName"><%=item.getCar_name()%></div>
							<div class="rv-carInfoBox-Box-carYear">
								<div class="carMiniInfoBox"><%=item.getModel_year()%></div>
								<div class="carMiniInfoBox rv-carInfoBox-Box-carSize"><%=item.getCar_size()%></div>
								<div class="carMiniInfoBox rv-carInfoBox-Box-carType"><%=item.getCar_type()%></div>
								
							</div>
							<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice">
								<div class="rv-carInfoBox-Box-insuranceText">일반자차</div>
								<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice-text"><%=item.getRental_costs() + 20000%>원
									부터
								</div>
							</div>
							<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice">
								<div class="rv-carInfoBox-Box-insuranceText">완전자차</div>
								<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice-text"><%=item.getRental_costs() + 40000%>원
									부터
								</div>
							</div>
							<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice">
								<div class="rv-carInfoBox-Box-insuranceText">수퍼자차</div>
								<div class="rv-carInfoBox-Box-sumRentAndInsurancePrice-text"><%=item.getRental_costs() + 100000%>원
									부터
								</div>
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

				<%-- <input type="text" value="<%=carInfoList.get %>"> --%>
				<div class="rv-filterBox-Main">
					<div class="rv-filterBox-Main-1">
						자차보험
						<div class="rv-filterBox-Main-1-data">
							<%
							if (insuranceinfoList != null) {
								for (InsuranceInfoDTO insuranceinfo : insuranceinfoList) {
							%>

							<%=insuranceinfo.getInsurance_type()%><input type="radio"
								value="<%=insuranceinfo.getInsurance_number()%>"
								name="insurance_number">

							<%
							}
							}
							%>
						</div>
					</div>
					<%-- <div class="rv-filterBox-Main-2">자동차모델
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
			</div> --%>
					<div class="rv-filterBox-Main-3">
						차량크기
						<div class="rv-filterBox-Main-3-data">
							<form method="post" action="/carInfoBySize">
								<label for="selectAll">전체</label> <input type="checkbox"
									id="selectAllSizes" class="carCheckbox" value="all">

								<%
								if (carInfoListBySize != null) {
									for (CarInfoDTO carInfo : carInfoListBySize) {
								%>

								<%=carInfo.getCar_size()%>
								<input type="checkbox" value="<%=carInfo.getCar_size()%>"
									class="carCheckbox">
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
							<label for="selectAll">전체</label> <input type="checkbox"
								id="selectAllTypes" class="carTypeCheckbox" value="all">
							<%
							if (carInfoListByType != null) {
								for (CarInfoDTO carInfo : carInfoListByType) {
							%>

							<%=carInfo.getCar_type()%><input type="checkbox"
								value="<%=carInfo.getCar_type()%>" class="carTypeCheckobx">
							<%
							}
							}
							%>
						</div>

					</div>
					<div class="rv-filterBox-Main-5">
						필터 초기화
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
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

					<input type="submit" value="예약하기">

				</div>
			</form>
		</div>
	</div>




				</div>
	</form>
	</div>
	</div>
	</form>
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

	<script>
	function removeT() {
	    const dateTimeValue1 = document.getElementById('dateTime1').value;
	    const formattedDateTime1 = dateTimeValue1.replace('T', ' '); // 첫 번째 datetime-local의 'T'를 공백으로 대체

	    const dateTimeValue2 = document.getElementById('dateTime2').value;
	    const formattedDateTime2 = dateTimeValue2.replace('T', ' '); // 두 번째 datetime-local의 'T'를 공백으로 대체

	    // formattedDateTime1, formattedDateTime2를 사용하여 데이터를 처리하거나 전송할 수 있습니다.
	    console.log('Formatted DateTime 1:', formattedDateTime1);
	    console.log('Formatted DateTime 2:', formattedDateTime2);
	    // 데이터를 전송하거나 다른 작업을 수행할 수 있습니다.
	}
}
								carTypeCheckboxes.forEach(function(cb) {
									if (cb.checked) {
										selectedTypes.push(cb.value
												.toLowerCase());
									}
								});

								carBoxes
										.forEach(function(carBox) {
											var carSizeElement = carBox
													.querySelector('.rv-carInfoBox-Box-carSize');
											var carTypeElement = carBox
													.querySelector('.rv-carInfoBox-Box-carType');

											var carSizeText = carSizeElement.textContent
													.trim().toLowerCase();
											var carTypeText = carTypeElement.textContent
													.trim().toLowerCase();

											var sizeFilter = selectedSizes.length === 0
													|| selectedSizes
															.includes(carSizeText)
													|| selectedSizes
															.includes('all');
											var typeFilter = selectedTypes.length === 0
													|| selectedTypes
															.includes(carTypeText)
													|| selectedTypes
															.includes('all');

											if ((selectedSizes.length === 1
													&& selectedTypes.length === 0 && sizeFilter)
													|| (selectedTypes.length === 1
															&& selectedSizes.length === 0 && typeFilter)
													|| (sizeFilter && typeFilter)) {
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
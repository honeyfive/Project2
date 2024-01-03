<%@ page import="db.dao.CarInfoCheckDAO"%>
<%@ page import="db.dto.CarInfoCheckDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.side_bar {
	margin-right: 2%;
	width: 10%;
	height: 1200px;
	float: left;
	/* border: 3px solid black; */
	background-color: #0D6FFC;
	/* color: white; */
	border-right: 3px solid #0D6FFC;
	font-weight: bold;
}

body {
	color: #666;
	font: 14px/24px "Open Sans", "HelveticaNeue-Light",
		"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
		"Lucida Grande", Sans-Serif;
}

h1 {
	color: #0D6FFC;
	margin-top: 15px;
}

table {
	margin-top: 5%;
	border-collapse: separate;
	border-spacing: 0;
	width: 88%;
	border-collapse: separate;
}

th, td {
	padding: 8px 4px;
}

th {
	background: #0D6FFC;
	color: #fff;
	text-align: left;
}

tr:first-child th:first-child {
	border-top-left-radius: 6px;
}

tr:first-child th:last-child {
	border-top-right-radius: 6px;
}

td {
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
}

td:first-child {
	border-left: 1px solid #c6c9cc;
}

tr:nth-child(even) td {
	background: #eaeaed;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 6px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 6px;
}

#input_membership_number {
	margin-top: 20px;
}

.manage {
	margin: 0 auto;
	font-size: 1.1rem;
	margin-top: 15%;
	color: white;
}

a {
	text-decoration-line: none;
	color: gray;
}

.carAdd {
	margin-top: 20px;
	padding: 10px;
}

.carDelete {
	margin-top: 30px;
	padding: 8px;
}

.carMaintenance {
	margin-top: 30px;
	padding: 8px;
}

input[type="text"] {
	width: 100px;
	margin-bottom: 10px;
	padding: 2px;
}

button[type="submit"] {
	margin-left: 10px;
	padding: 5px;
}

.carAddClass {
	float: right;
}

.modal {
	position: absolute;
	display: none;
	justify-content: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 1200px;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal_body {
	position: absolute;
	top: 20%;
	width: 1000px;
	height: 200px;
	padding: 10px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateY(-50%);
	color: black;
}

#modalCloseButton {
	margin-left: 10px;
	cursor: pointer;
	float: right;
	padding: 5px;
}

.carAddModalTitle {
	margin-left: 15px;
	color: #0D6FFC;
}

input[type="text"] {
	line-height: normal;
	color: black;
}

input[type="checkbox"] {
	border-radius: 0;
	padding: 10px;
}
</style>
<meta charset="UTF-8">
<title>휴카</title>
<link rel="shortcut icon" href="./images/favicon.png" type="image/png" sizes="32x32">
</head>
<body>
	<%@ include file="header3.jsp"%>

	<%
	CarInfoCheckDAO memberInfoDAO = new CarInfoCheckDAO();

	List<CarInfoCheckDTO> carList = memberInfoDAO.findCarInfoList();

	List<CarInfoCheckDTO> carNumbers = memberInfoDAO.findCarNumberList();
	%>

	<div class="side_bar">
		<a href="./manage_main.jsp"><div class="manage">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
  <path
						d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z" />
</svg>
				메인 화면
			</div></a> <a href="./Member.jsp"><div class="manage">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path
						d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664z" />
</svg>
				고객 관리
			</div></a> <a href="./carInfo_check.jsp"><div class="manage">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-car-front" viewBox="0 0 16 16">
  <path
						d="M4 9a1 1 0 1 1-2 0 1 1 0 0 1 2 0m10 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM4.862 4.276 3.906 6.19a.51.51 0 0 0 .497.731c.91-.073 2.35-.17 3.597-.17 1.247 0 2.688.097 3.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 10.691 4H5.309a.5.5 0 0 0-.447.276" />
  <path
						d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM4.82 3a1.5 1.5 0 0 0-1.379.91l-.792 1.847a1.8 1.8 0 0 1-.853.904.807.807 0 0 0-.43.564L1.03 8.904a1.5 1.5 0 0 0-.03.294v.413c0 .796.62 1.448 1.408 1.484 1.555.07 3.786.155 5.592.155 1.806 0 4.037-.084 5.592-.155A1.479 1.479 0 0 0 15 9.611v-.413c0-.099-.01-.197-.03-.294l-.335-1.68a.807.807 0 0 0-.43-.563 1.807 1.807 0 0 1-.853-.904l-.792-1.848A1.5 1.5 0 0 0 11.18 3z" />
</svg>
				차량 관리
			</div></a> <a href="./manage_Reservation.jsp"><div class="manage">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-kanban" viewBox="0 0 16 16">
  <path
						d="M13.5 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1h-11a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zm-11-1a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h11a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" />
  <path
						d="M6.5 3a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1zm-4 0a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1zm8 0a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1z" />
</svg>
				예약 정보
			</div></a> <a href="./login.jsp"><div class="manage">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
  <path
						d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1z" />
</svg>
				로그 아웃
			</div></a>
	</div>
	<h1>차량정보</h1>

	<div class="modal">
		<div class="modal_body">
			<h2 class="carAddModalTitle">
				차량정보 추가<span id="modalCloseButton">❌</span>
			</h2>
			<fieldset class="carAdd">
				<legend>차량정보 추가</legend>
				<form action="addCar_proc.jsp" method="post">
					<laber>차량번호:</laber>
					<input type="text" name="car_number">
					<laber>차량명:</laber>
					<input type="text" name="car_name">
					<laber>승차인원: </laber>
					<input type="text" name="passenger_count">
					<laber>차크기:</laber>
					<select name="car_size">
						<option>S</option>
						<option>M</option>
						<option>L_SEDAN</option>
						<option>S_SUV</option>
						<option>L_RV</option>
						<option>L_RV</option>
						<option>SPORT</option>
					</select> <label>차종: </label> <select name="car_type">
						<option>G</option>
						<option>D</option>
						<option>E</option>
						<option>H</option>
					</select>
					<laber>배기량: </laber>
					<input type="text" name="vehicle_rating"><br>
					<laber>제조회사: </laber>
					<input type="text" name="company">
					<laber>색상: </laber>
					<input type="text" name="color">
					<laber>연식: </laber>
					<input type="text" name="model_year"> <label>관리상태:
					</label> <select name="management_status">
						<option>A</option>
						<option>B</option>
						<option>C</option>
					</select>
					<laber>네비게이션: </laber>
					<input type="checkbox" value="NAV" name="option1">
					<laber>카메라: </laber>
					<input type="checkbox" value="CAM" name="option2">
					<laber>사고이력: </laber>
					<input type="text" name="accident_history">

					<button type="submit" class="carAddClass">추가</button>
				</form>
			</fieldset>
		</div>
	</div>

	<div class="carMaintenance">
		<a href="carMaintenanceInfo.jsp"><button type="button">정비이력</button></a>
		<button class="btn-open-modal">차량정보추가</button>
	</div>

	<fieldset class="carDelete">
		<legend>차량정보 삭제</legend>
		<form action="deleteCar_proc.jsp" method="post">
			<select name="car_number">
				<%
				for (CarInfoCheckDTO carNumber : carNumbers) {
				%>
				<option value="<%=carNumber.getCar_number()%>"><%=carNumber.getCar_number()%></option>
				<%
				}
				%>
			</select>
			<button type="submit">삭제</button>
		</form>
	</fieldset>

	<table class="member_graph">
		<tr>
			<th>차량번호</th>
			<th>차량명</th>
			<th>차 크기</th>
			<th>차종</th>
			<th>승차인원</th>
			<th>배기량</th>
			<th>제조회사</th>
			<th>색상</th>
			<th>연식</th>
			<th>관리상태</th>
			<th>옵션1</th>
			<th>옵션2</th>
			<th>사고이력</th>
		</tr>

		<%
		for (CarInfoCheckDTO carInfo : carList) {
		%>

		<tr>
			<td><%=carInfo.getCar_number()%></td>
			<td><%=carInfo.getCar_name()%></td>
			<td><%=carInfo.getCar_size()%></td>
			<td><%=carInfo.getCar_type()%></td>
			<td><%=carInfo.getPassenger_count()%></td>
			<td><%=carInfo.getVehicle_rating()%></td>
			<td><%=carInfo.getCompany()%></td>
			<td><%=carInfo.getColor()%></td>
			<td><%=carInfo.getModel_year()%></td>
			<td><%=carInfo.getManagement_status()%></td>
			<td><%=carInfo.getOption1()%></td>
			<td><%=carInfo.getOption2()%></td>
			<td><%=carInfo.getAccident_history()%></td>
		</tr>
		<%
		}
		%>

	</table>

	<script>
        const modal = document.querySelector('.modal');
        const btnOpenModal=document.querySelector('.btn-open-modal');
        const modalCloseButton = document.getElementById('modalCloseButton');

        btnOpenModal.addEventListener("click", ()=>{
            modal.style.display="flex";
        });
        
        modalCloseButton.addEventListener('click', () => {
        	  modal.style.display="none";
        	});
    </script>


</body>
</html>
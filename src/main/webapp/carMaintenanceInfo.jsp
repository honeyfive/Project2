<%@ page import="db.dao.CarMaintenanceDAO"%>
<%@ page import="db.dto.CarMaintenanceDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
body {
	color: #666;
	font: 14px/24px "Open Sans", "HelveticaNeue-Light",
		"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
		"Lucida Grande", Sans-Serif;
}

h1 {
 color: #0D6FFC;
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
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		차량정비정보
	</h1>
	<a href="carInfo_check.jsp">
	<span>뒤로가기</span> 
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backspace" viewBox="0 0 16 16">
    <path d="M5.83 5.146a.5.5 0 0 0 0 .708L7.975 8l-2.147 2.146a.5.5 0 0 0 .707.708l2.147-2.147 2.146 2.147a.5.5 0 0 0 .707-.708L9.39 8l2.146-2.146a.5.5 0 0 0-.707-.708L8.683 7.293 6.536 5.146a.5.5 0 0 0-.707 0z"/>
    <path d="M13.683 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-7.08a2 2 0 0 1-1.519-.698L.241 8.65a1 1 0 0 1 0-1.302L5.084 1.7A2 2 0 0 1 6.603 1zm-7.08 1a1 1 0 0 0-.76.35L1 8l4.844 5.65a1 1 0 0 0 .759.35h7.08a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1z"/>
	</svg>
	</a>
	
	<fieldset class="maintenanceCarAdd">
		<legend>정비이력 추가</legend>
		<form action="addMaintenanceCar_proc.jsp" method="post" class="">
			<laber>정비번호:</laber>
			<input type="text" name="maintenance_num">
			<laber>차량번호:</laber>
			<input type="text" name="car_number">
			<laber>정비시작날짜: </laber>
			<input type="date" name="start_date">
			<laber>정비완료날짜:</laber>
			<input type="date" name="completion_date">
			<laber>정비내용: </laber>
			<input type="text" name="maintenance_history">
			<button type="submit">추가</button>
		</form>
	</fieldset>
	
	<%
		CarMaintenanceDAO carMaintenanceDAO	= new CarMaintenanceDAO();	
	
		List<CarMaintenanceDTO> carMaintenanceList = carMaintenanceDAO.findCarMaintenanceInfoList();
	%>
	
	<table class="member_graph">
		<tr>
			<th>정비번호</th>
			<th>차번호</th>
			<th>정비시작날짜</th>
			<th>정비완료날짜</th>
			<th>정비내용</th>
		</tr>

		<%
		for (CarMaintenanceDTO carInfo : carMaintenanceList) {
		%>

		<tr>
			<td><%=carInfo.getMaintenance_num()%></td>
			<td><%=carInfo.getCar_number()%></td>
			<td><%=carInfo.getStart_date()%></td>
			<td><%=carInfo.getCompletion_date()%></td>
			<td><%=carInfo.getMaintenance_history()%></td>
		</tr>
		<%
	  } 
	  %>

	</table>
</body>
</html>
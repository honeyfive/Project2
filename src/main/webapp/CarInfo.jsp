<%@page import="java.util.List"%>
<%@page import="db.dao.CarInfoDAO" %>
<%@page import="db.dto.CarInfoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		CarInfoDAO carInfoDAO = new CarInfoDAO();
		List<CarInfoDTO> carInfoList = carInfoDAO.findCarInfoList(); 
	%> 
	
	<h1>차량 정보 테이블</h1>
	<table border=1;>
	<tr>
		<th>차량 번호</th>
		<th>차량명</th>
		<th>차 크기</th>
		<th>차종</th>
		<th>승차인원</th>
		<th>차량등급(배기량)</th>
		<th>제조회사</th>
		<th>색상</th>
		<th>연식</th>
		<th>관리상태</th>
		<th>옵션1</th>
		<th>옵션2</th>
		<th>사고이력</th>
	</tr>
	<%
	if(carInfoList != null){
		for(CarInfoDTO carInfoDTO : carInfoList){
	%>		
	<tr>
		<td><%=carInfoDTO.getCar_number() %></td>
		<td><%=carInfoDTO.getCar_name() %></td>
		<td><%=carInfoDTO.getCar_size() %></td>
		<td><%=carInfoDTO.getCar_type() %></td>
		<td><%=carInfoDTO.getPassenger_count() %></td>
		<td><%=carInfoDTO.getVehicle_rating() %></td>
		<td><%=carInfoDTO.getCompany() %></td>
		<td><%=carInfoDTO.getColor() %></td>
		<td><%=carInfoDTO.getModel_year() %></td>
		<td><%=carInfoDTO.getManagement_status() %></td>
		<td><%=carInfoDTO.getOption1() %></td>
		<td><%=carInfoDTO.getOption2() %></td>
		<td><%=carInfoDTO.getAccident_history() %></td>
	</tr>
	<%
		}
	}
	%>
	</table>	
	
	
	
	
	
</body>
</html>
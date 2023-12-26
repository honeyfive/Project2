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
<title>Insert title here</title>
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
	
	<%
	//보험 정보 리스트 불러오기
	InsuranceInfoDAO insuranceDAO = new InsuranceInfoDAO();
	List<InsuranceInfoDTO> insuranceinfoList = insuranceDAO.findInsuranceInfoList();
	//차량 정보 리스트 불러오기
	CarInfoDAO carInfoDAO = new CarInfoDAO();
	List<CarInfoDTO> carInfoList = carInfoDAO.findCarInfoList();
	List<CarInfoDTO> carSizeInfoList = carInfoDAO.findCarInfoListBySize();
	List<CarInfoDTO> carTypeInfoList = carInfoDAO.findCarInfoListByType();
	%>
	
		<h3>보험종류</h3>
		<!-- 보험 종류 체크박스 -->
		전체<input type="checkbox">
			<%
			if (insuranceinfoList != null) {
				for (InsuranceInfoDTO insuranceinfo : insuranceinfoList) {
			%>
		
		<%=insuranceinfo.getInsurance_type()%><input type="checkbox">
		
		<%
		}
		}
		%>
		<h3>자동차 모델1</h3>    
		<select>     
			<%
			if (carInfoList != null) {
				for (CarInfoDTO carInfo : carInfoList) {
			%>
		
		<option> <%=carInfo.getCar_name()%> </option>
		<%
		}
		}
		%>
		</select>
		
		<%-- <h3>자동차 모델2</h3>    
			<%
			if (carInfoList != null) {
				for (CarInfoDTO carInfo : carInfoList) {
			%>
		
		<%=carInfo.getCar_name()%><input type="checkbox">
		<%
		}
		}
		%> --%>
		
		<h3>차량크기</h3>
		전체<input type="checkbox">
		   <%
			if (carSizeInfoList != null) {
				for (CarInfoDTO carInfo : carSizeInfoList) {
			%>
		
		<%=carInfo.getCar_size()%><input type="checkbox">
		<%
		}
		}
		%>
		
		<h3>차량타입</h3>
		전체<input type="checkbox">
		   <%
			if (carTypeInfoList != null) {
				for (CarInfoDTO carInfo : carTypeInfoList) {
			%>
		
		<%=carInfo.getCar_type()%><input type="checkbox">
		<%
		}
		}
		%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.CarInfoCheckDAO"%>
<%@ page import="db.dto.CarInfoCheckDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	CarInfoCheckDAO memberInfoDAO = new CarInfoCheckDAO();
	
	request.setCharacterEncoding("UTF-8");
	String car_number = request.getParameter("car_number");
	String car_name = request.getParameter("car_name");
	String car_size = request.getParameter("car_size");
	String car_type = request.getParameter("car_type");
	String passenger_count = request.getParameter("passenger_count");
	String vehicle_rating = request.getParameter("vehicle_rating");
	String company = request.getParameter("company");
	String color = request.getParameter("color");
	String model_year = request.getParameter("model_year");
	String management_status = request.getParameter("management_status");
	String option1 = request.getParameter("option1");
	String option2 = request.getParameter("option2");
	String accident_history = request.getParameter("accident_history");
	int intPassenger_count = Integer.parseInt(passenger_count);
	int intVehicle_rating = Integer.parseInt(vehicle_rating);
	int intModel_year = Integer.parseInt(model_year);
	int intAccident_history = Integer.parseInt(accident_history);
	//System.out.println(name);
	
	int result = memberInfoDAO.saveCarInfo(car_number, car_name, car_size, car_type, intPassenger_count,
			intVehicle_rating, company, color, intModel_year, management_status, option1,
			option2, intAccident_history);
	
	System.out.println(result);
	if(result > 0){
	%>
		<script>
			alert('저장 성공');
			location.href = 'carInfo_check.jsp';
		</script>
	<%		
		} else {
	%>
		<script>
			alert('저장 실패');
			location.href = 'carInfo_check.jsp';
		</script>
	<%
		}
	%>
</body>
</html>
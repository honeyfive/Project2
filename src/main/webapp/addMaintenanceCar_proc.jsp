<%@ page import="db.dao.CarMaintenanceDAO"%>
<%@ page import="db.dto.CarMaintenanceDTO"%>

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
	CarMaintenanceDAO carMaintenanceDAO = new CarMaintenanceDAO();
	
	request.setCharacterEncoding("UTF-8");
	String maintenance_num = request.getParameter("maintenance_num");
	String car_number = request.getParameter("car_number");
	String start_date = request.getParameter("start_date");
	String completion_date = request.getParameter("completion_date");
	String maintenance_history = request.getParameter("maintenance_history");
	
	int result = carMaintenanceDAO.saveMaintenanceCarInfo(maintenance_num, car_number, start_date,
			completion_date, maintenance_history);
	
	System.out.println(result);
	if(result > 0){
	%>
		<script>
			alert('저장 성공');
			location.href = 'carMaintenanceInfo.jsp';
		</script>
	<%		
		} else {
	%>
		<script>
			alert('저장 실패');
			location.href = 'carMaintenanceInfo.jsp';
		</script>
	<%
		}
	%>
</body>
</html>
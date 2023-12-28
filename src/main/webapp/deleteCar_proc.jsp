<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.CarInfoCheckDAO" %>
<%@ page import="db.dto.CarInfoCheckDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String car_number = request.getParameter("car_number");
		System.out.println("deleteMember_proc 파라미터 : " + car_number);
		
		CarInfoCheckDAO carInfoCheckDAO = new CarInfoCheckDAO();
		int result = carInfoCheckDAO.removeCarByCarNumber(car_number);
		
		if(result > 0){
			%>
				<script>
					alert('삭제 성공');
					location.href='carInfo_check.jsp';
				</script>
			<%		
				} else {
			%>
				<script>
					alert('삭제 실패');
					history.back();
				</script>
			<%
				}
			%>
	%>
</body>
</html>
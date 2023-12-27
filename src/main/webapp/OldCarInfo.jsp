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
	<%CarInfoDAO carInfoDAO = new CarInfoDAO(); 

List<CarInfoDTO> showOldCarInfo = carInfoDAO.showOldCarInfo(); %>

<!-- Y2K 차량 정보 보여주는 쿼리  -->
	<h1>Y2K 차량 리스트</h1>
	<h2>Y2K 차량</h2>
	<%
	if(showOldCarInfo != null) {
	    for(CarInfoDTO oldCarInfo : showOldCarInfo) {
	%>
	        <span><%=oldCarInfo.getCar_number() %></span>
	        </br>
	        <span><%=oldCarInfo.getCar_name() %></span>
	        </br>
	        <span><%=oldCarInfo.getCar_size() %></span>
	        </br>
	        <span><%=oldCarInfo.getModel_year() %>년식</span>
	        </br>
	<%
	    }
	} else {
	%>
	    <p>Y2K 차량이 없습니다.</p>
	<%
	}
	%>

	
</body>
</html>
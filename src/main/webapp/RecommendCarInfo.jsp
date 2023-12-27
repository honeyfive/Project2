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
List<CarInfoDTO> showRecommendCarInfo = carInfoDAO.showRecommendCarInfo();
%>


<!-- 추천 차량 정보 보여주는 쿼리 -->
	<h1>추천 차량 리스트</h1>
	<h2>추천 차량</h2>
	<%
	if(showRecommendCarInfo != null) {
	    for(CarInfoDTO recommendCarInfo : showRecommendCarInfo) {
	%>
	        <span><%=recommendCarInfo.getCar_number() %></span>
	        </br>
	        <span><%=recommendCarInfo.getCar_name() %></span>
	        </br>
	        <span><%=recommendCarInfo.getCar_size() %></span>
	        </br>
	        <span><%=recommendCarInfo.getModel_year() %>년식</span>
	        </br>
	        
	<%
	    }
	} else {
	%>
	    <p>추천 차량이 없습니다.</p>
	<%
	}
	%>

	
</body>
</html>
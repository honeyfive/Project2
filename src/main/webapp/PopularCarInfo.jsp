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
List<CarInfoDTO> showPopularCarInfo = carInfoDAO.showPopularCarInfo();
 %>






<!-- 인기 차량 정보 보여주는 쿼리 -->
	<h1>인기 차량 리스트</h1>
	<h2>인기 차량</h2>
	<%
	if (showPopularCarInfo != null) {
	    for (CarInfoDTO popularCarInfo : showPopularCarInfo) { 
	%>
        <span><%= popularCarInfo.getCar_number() %></span>
        </br>
        <span><%= popularCarInfo.getCar_name() %></span>
        </br>
        <span><%= popularCarInfo.getCar_size() %></span>
        </br>
        <span><%= popularCarInfo.getModel_year() %>년식</span>
        </br>
	<%
	    } // 반복문 종료
	} // if문 종료
	%>

</body>
</html>
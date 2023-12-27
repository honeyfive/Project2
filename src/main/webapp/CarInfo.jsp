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
	<%CarInfoDAO carInfoDAO = new CarInfoDAO(); %>
	
	<% 	List<CarInfoDTO> showRecommendCarInfo = carInfoDAO.showRecommendCarInfo();
		
		List<CarInfoDTO> showCheapCarInfo = carInfoDAO.showCheapCarInfo();
		
		List<CarInfoDTO> showOldCarInfo = carInfoDAO.showOldCarInfo();
	
		List<CarInfoDTO> showPopularCarInfo = carInfoDAO.showPopularCarInfo();
		
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
	
	<!-- 가성비 차량 정보 보여주는 쿼리  -->
	<h1>가성비 차량 리스트</h1>
	<h2>가성비 차량</h2>
	<%
	if(showCheapCarInfo != null) {
	    for(CarInfoDTO cheapCarInfo : showCheapCarInfo) {
	%>
	        <span><%=cheapCarInfo.getCar_number() %></span>
	        </br>
	        <span><%=cheapCarInfo.getCar_name() %></span>
	        </br>
	        <span><%=cheapCarInfo.getCar_size() %></span>
	        </br>
	        <span><%=cheapCarInfo.getModel_year() %>년식</span>
	        </br>
	<%
	    }
	} else {
	%>
	    <p>가성비 차량이 없습니다.</p>
	<%
	}
	%>
	
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
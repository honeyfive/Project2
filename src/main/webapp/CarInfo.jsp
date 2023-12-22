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
	
	<% 	CarInfoDTO showRecommendCarInfo1 = carInfoDAO.showRecommendCarInfo1();
		CarInfoDTO showRecommendCarInfo2 = carInfoDAO.showRecommendCarInfo2();
		CarInfoDTO showRecommendCarInfo3 = carInfoDAO.showRecommendCarInfo3();
		CarInfoDTO showRecommendCarInfo4 = carInfoDAO.showRecommendCarInfo4();
		
		CarInfoDTO showCheapCarInfo1 = carInfoDAO.showCheapCarInfo1();
		CarInfoDTO showCheapCarInfo2 = carInfoDAO.showCheapCarInfo2();
		CarInfoDTO showCheapCarInfo3 = carInfoDAO.showCheapCarInfo3();
		CarInfoDTO showCheapCarInfo4 = carInfoDAO.showCheapCarInfo4();
		
		CarInfoDTO showOldCarInfo1 = carInfoDAO.showOldCarInfo1();
		CarInfoDTO showOldCarInfo2 = carInfoDAO.showOldCarInfo2();
		CarInfoDTO showOldCarInfo3 = carInfoDAO.showOldCarInfo3();
		CarInfoDTO showOldCarInfo4 = carInfoDAO.showOldCarInfo4();
		
		CarInfoDTO showPopularCarInfo1 = carInfoDAO.showPopularCarInfo1();
		CarInfoDTO showPopularCarInfo2 = carInfoDAO.showPopularCarInfo2();
		CarInfoDTO showPopularCarInfo3 = carInfoDAO.showPopularCarInfo3();
		CarInfoDTO showPopularCarInfo4 = carInfoDAO.showPopularCarInfo4();
	%>
	
	
	<!-- 추천 차량 정보 보여주는 쿼리 -->
	<h1>추천 차량 리스트</h1>
	<h2>추천 차량 1</h2>
	<span><%=showRecommendCarInfo1.getCar_name() %></span>
	<span><%=showRecommendCarInfo1.getCar_size() %></span>
	<span><%=showRecommendCarInfo1.getModel_year() %>년식</span>
	
	<h2>추천 차량 2</h2>
	<span><%=showRecommendCarInfo2.getCar_name() %></span>
	<span><%=showRecommendCarInfo2.getCar_size() %></span>
	<span><%=showRecommendCarInfo2.getModel_year() %>년식</span>
	
	<h2>추천 차량 3</h2>
	<span><%=showRecommendCarInfo3.getCar_name() %></span>
	<span><%=showRecommendCarInfo3.getCar_size() %></span>
	<span><%=showRecommendCarInfo3.getModel_year() %>년식</span>
	
	<h2>추천 차량 4</h2>
	<span><%=showRecommendCarInfo4.getCar_name() %></span>
	<span><%=showRecommendCarInfo4.getCar_size() %></span>
	<span><%=showRecommendCarInfo4.getModel_year() %>년식</span>
	
	
	<!-- 가성비 차량 정보 보여주는 쿼리  -->
	<h1>가성비 차량 리스트</h1>
	<h2>가성비 차량 1</h2>
	<span><%=showCheapCarInfo1.getCar_name() %></span>
	<span><%=showCheapCarInfo1.getCar_size() %></span>
	<span><%=showCheapCarInfo1.getModel_year() %>년식</span>
	
	
	<h2>가성비 차량 2</h2>
	<span><%=showCheapCarInfo2.getCar_name() %></span>
	<span><%=showCheapCarInfo2.getCar_size() %></span>
	<span><%=showCheapCarInfo2.getModel_year() %>년식</span>
	
	<h2>가성비 차량 3</h2>
	<span><%=showCheapCarInfo3.getCar_name() %></span>
	<span><%=showCheapCarInfo3.getCar_size() %></span>
	<span><%=showCheapCarInfo3.getModel_year() %>년식</span>
	
	<h2>가성비 차량 4</h2>
	<span><%=showCheapCarInfo4.getCar_name() %></span>
	<span><%=showCheapCarInfo4.getCar_size() %></span>
	<span><%=showCheapCarInfo4.getModel_year() %>년식</span>
	
	<!-- Y2K 차량 정보 보여주는 쿼리  -->
	<h1>Y2K 차량 리스트</h1>
	
	<h2>Y2K 차량 1</h2>
	<span><%=showOldCarInfo1.getCar_name() %></span>
	<span><%=showOldCarInfo1.getCar_size() %></span>
	<span><%=showOldCarInfo1.getModel_year() %>년식</span>
	
	<h2>Y2K 차량 2</h2>
	<span><%=showOldCarInfo2.getCar_name() %></span>
	<span><%=showOldCarInfo2.getCar_size() %></span>
	<span><%=showOldCarInfo2.getModel_year() %>년식</span>
	
	<h2>Y2K 차량 3</h2>
	<span><%=showOldCarInfo3.getCar_name() %></span>
	<span><%=showOldCarInfo3.getCar_size() %></span>
	<span><%=showOldCarInfo3.getModel_year() %>년식</span>

	<h2>Y2K 차량 4</h2>
	<span><%=showOldCarInfo4.getCar_name() %></span>
	<span><%=showOldCarInfo4.getCar_size() %></span>
	<span><%=showOldCarInfo4.getModel_year() %>년식</span>
	
	<!-- 인기 차량 정보 보여주는 쿼리 -->
	<h1>인기 차량 리스트</h1>
	<h2>인기 차량 1</h2>
	<span><%=showPopularCarInfo1.getCar_name() %></span>
	<span><%=showPopularCarInfo1.getCar_size() %></span>
	<span><%=showPopularCarInfo1.getModel_year() %>년식</span>
	
	<h2>인기 차량 2</h2>
	<span><%=showPopularCarInfo2.getCar_name() %></span>
	<span><%=showPopularCarInfo2.getCar_size() %></span>
	<span><%=showPopularCarInfo2.getModel_year() %>년식</span>
	
	<h2>인기 차량 3</h2>
	<span><%=showPopularCarInfo3.getCar_name() %></span>
	<span><%=showPopularCarInfo3.getCar_size() %></span>
	<span><%=showPopularCarInfo3.getModel_year() %>년식</span>
	
	<h2>인기 차량 4</h2>
	<span><%=showPopularCarInfo4.getCar_name() %></span>
	<span><%=showPopularCarInfo4.getCar_size() %></span>
	<span><%=showPopularCarInfo4.getModel_year() %>년식</span>
	
</body>
</html>
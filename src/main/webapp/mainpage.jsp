<%@ page import="java.util.List"%>
<%@ page import="db.dao.CarInfoDAO" %>
<%@ page import="db.dto.CarInfoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <link rel="stylesheet" href="css/mainpage.css">
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	

</head>
<body>
<% 
	CarInfoDAO carInfoDAO = new CarInfoDAO();

    List<CarInfoDTO> recommendCarInfoList = carInfoDAO.showRecommendCarInfo();
	List<CarInfoDTO> cheapCarInfoList = carInfoDAO.showCheapCarInfo();
	List<CarInfoDTO> oldCarInfoList = carInfoDAO.showOldCarInfo();
	List<CarInfoDTO> popularCarInfoList = carInfoDAO.showPopularCarInfo();
	
%>
	
    <!--헤더-->
    
<%@ include file="header.jsp" %>


    <!-- 메인페이지  -->
    
    <div class="mainpage">
        <div class="mainpage_picture_div">
            <img src="images/메인_람보르기니사진.jpg" style="width:100%; height: 500px;">
        </div>
        <div class="mainpage_menu">
            <div class="recommend_car_list">
                <div class="recommend_car_title">
                    <p class="recommend_car_title_text"><i class="fa-solid fa-thumbs-up"></i> 휴카의 추천차량</p>
                </div>
                <div class="show_recommend_car_box">
	                <% 
	                if (recommendCarInfoList != null) {
	                	%>
	                  <%   for (CarInfoDTO recommendCar : recommendCarInfoList) {
	                %><div class="show_recommend_car">
	                    <img src="<%= recommendCar.getCar_image() %>" alt="Car Image">
	                    <div class="dividing_line"></div>
	                    <div class="recommend_car_info">
	                        <p class="recommend_car_info_text">차량 번호 : <%= recommendCar.getCar_number() %></p>
	                        <p class="recommend_car_info_text">차량명 : <%= recommendCar.getCar_name() %></p>
	                        <p class="recommend_car_info_text">사이즈 : <%= recommendCar.getCar_size() %></p>
	                        <p class="recommend_car_info_text">연식 : <%= recommendCar.getModel_year() %></p>
	                    </div>
	                </div>
	                <% 
	                    }
	                } else {
	                    // 데이터가 없을 때 처리할 부분
	                }
	                %>
	            </div>
        </div>
    
            </div>
            <div class="cheap_car_list">
                <div class="cheap_car_title">
                    <p class="cheap_car_title_text"><i class="fa-solid fa-coins"></i> 가성비차량</p>
                </div>
                <div class="show_cheap_car_box">
                    
                        <% 
	                if (cheapCarInfoList != null) {
	                    for (CarInfoDTO cheapCar : cheapCarInfoList) {
	                %>
	                <div class="show_cheap_car">
	                    <img src="<%= cheapCar.getCar_image() %>" alt="Car Image">
	                    <div class="dividing_line"></div>
	                    <div class="cheap_car_info">
	                        <p class="cheap_car_info_text">차량 번호 : <%= cheapCar.getCar_number() %></p>
	                        <p class="cheap_car_info_text">차량명 : <%= cheapCar.getCar_name() %></p>
	                        <p class="cheap_car_info_text">사이즈 : <%= cheapCar.getCar_size() %></p>
	                        <p class="cheap_car_info_text">연식 : <%= cheapCar.getModel_year() %></p>
	                    </div>
	                
	                </div>
	                <% 
	                    }
	                } else {
	                    // 데이터가 없을 때 처리할 부분
	                }
	                %>
                    
                
            </div>
            <div class="old_car_list">
                <div class="old_car_title">
                    <p class="old_car_title_text"><i class="fa-solid fa-hand-holding-heart"></i> 유행은 돌고 돈다! Y2K 차량</p>
                </div>
                <div class="show_old_car_box">
                    
                        <% 
	                if (oldCarInfoList != null) {
	                    for (CarInfoDTO oldCar : oldCarInfoList) {
	                %>
	                <div class="show_old_car">
	                    <img src="<%= oldCar.getCar_image() %>" alt="Car Image">
	                    <div class="dividing_line"></div>
	                    <div class="old_car_info">
	                        <p class="old_car_info_text">차량 번호 : <%= oldCar.getCar_number() %></p>
	                        <p class="old_car_info_text">차량명 : <%= oldCar.getCar_name() %></p>
	                        <p class="old_car_info_text">사이즈 : <%= oldCar.getCar_size() %></p>
	                        <p class="old_car_info_text">연식 : <%= oldCar.getModel_year() %></p>
	                    </div>
	                </div>
	                <% 
	                    }
	                } else {
	                    // 데이터가 없을 때 처리할 부분
	                }
	                %>
                </div>
            </div>
            <div class="popular_car_list">
                <div class="popular_car_title"> 
                    <p class="popular_car_title_text"><i class="fa-solid fa-fire"></i> 고객들에게 인기만점 인기 차량</p>
                </div>
                <div class="show_popular_car_box">
                     <% 
	                if (popularCarInfoList != null) {
	                    for (CarInfoDTO popularCar : popularCarInfoList) {
	                %>
	                <div class="show_popular_car">
	                    <img src="<%= popularCar.getCar_image() %>" alt="Car Image">
	                    <div class="dividing_line"></div>
	                    <div class="popular_car_info">
	                        <p class="popular_car_info_text">차량 번호 : <%= popularCar.getCar_number() %></p>
	                        <p class="popular_car_info_text">차랑명 : <%= popularCar.getCar_name() %></p>
	                        <p class="popular_car_info_text">사이즈 : <%= popularCar.getCar_size() %></p>
	                        <p class="popular_car_info_text">연식 : <%= popularCar.getModel_year() %></p>
	                    </div>
	                </div>
	                <% 
	                    }
	                } else {
	                    // 데이터가 없을 때 처리할 부분
	                }
	                %>
                </div>
            </div>
        </div>

        
    </div>

    <!-- 푸터 -->
    <%@ include file="footer.jsp" %>
    
</body>


</html>
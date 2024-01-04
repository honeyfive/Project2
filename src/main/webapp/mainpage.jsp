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
    <title>휴카</title>
    <link rel="shortcut icon" href="./images/favicon.png" type="image/png" sizes="32x32">
    <link rel="stylesheet" href="css/mainpage.css">
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	

</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<% 
	CarInfoDAO carInfoDAO = new CarInfoDAO();

    List<CarInfoDTO> recommendCarInfoList = carInfoDAO.showRecommendCarInfo();
	List<CarInfoDTO> cheapCarInfoList = carInfoDAO.showCheapCarInfo();
	List<CarInfoDTO> oldCarInfoList = carInfoDAO.showOldCarInfo();
	List<CarInfoDTO> popularCarInfoList = carInfoDAO.showPopularCarInfo();
	
%>
	
    <!--헤더-->
    
<%@ include file="header2.jsp" %>


    <!-- 메인페이지  -->
    
    <div class="mainpage">
        <div class="mainpage_picture_div">
            <img class="main_page_picture" src="images/메인_람보르기니사진.jpg"  >
        </div>
        <div class="mainpage_menu">
            <div class="recommend_car_list">
                <div class="recommend_car_title">
                    <p class="recommend_car_title_text"><i class="fa-solid fa-thumbs-up"></i> 휴카의 추천차량</p>
                </div>
                <div class="show_recommend_car_box">
	                <% 
	                if (recommendCarInfoList != null) {
	                	
	                	for (CarInfoDTO recommendCar : recommendCarInfoList) {
	                %>
	                <% if (headerId == null || memberInfoHeaderDTO == null){ %>
						 <!-- 로그인 되어 있지 않은 경우 -->
						 
					 <div class="show_recommend_car logout_status">
						 <a href="./login.jsp" class="text_align">
								<div class="recommend_car_image_box">
			                    	<img class="recommend_car_image" src="<%= recommendCar.getCar_image() %>" alt="Car Image">
			                    </div>
			                    <hr class="dividing_line"/>
			                    <div class="recommend_car_info">
			                        <p class="recommend_car_info_text">차량명 : <%= recommendCar.getCar_name() %></p>
			                        <p class="recommend_car_info_text">사이즈 : <%= recommendCar.getCar_size() %></p>
			                        <p class="recommend_car_info_text">연식 : <%= recommendCar.getModel_year() %></p>
			                    </div> 
			               </a> 
					 </div> 
		             <%}else{%>
		                <!-- 로그인 되어 있는 경우 -->
		                
				 		<div class="show_recommend_car">
	                		<a href="./reservation.jsp"> <!-- 예약 페이지 연결-->
								<div class="recommend_car_image_box">
			                    	<img class="recommend_car_image" src="<%= recommendCar.getCar_image() %>" alt="Car Image">
			                    </div>
			                    <hr class="dividing_line"/>
			                    <div class="recommend_car_info">
			                        <p class="recommend_car_info_text">차량명 : <%= recommendCar.getCar_name() %></p>
			                        <p class="recommend_car_info_text">사이즈 : <%= recommendCar.getCar_size() %></p>
			                        <p class="recommend_car_info_text">연식 : <%= recommendCar.getModel_year() %></p>
			                    </div>
			                 </a>   
			             </div>
			             
			             <%} %>
			        
	                <% 
	                    }
	                } else {
	                    // 데이터가 없을 때 처리할 부분
	                }
	                %>
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
					<% if (headerId == null || memberInfoHeaderDTO == null){ %>
						 <!-- 로그인 되어 있지 않은 경우 -->
						 
					 <div class="show_cheap_car logout_status">
					 	<a href="./login.jsp">
						<div class="cheap_car_image_box">
							<img class="cheap_car_image" src="<%= cheapCar.getCar_image() %>" alt="Car Image">
						</div>
						<hr class="dividing_line"/>
						<div class="cheap_car_info">
							<p class="cheap_car_info_text">차량명 : <%= cheapCar.getCar_name() %></p>
							<p class="cheap_car_info_text">사이즈 : <%= cheapCar.getCar_size() %></p>
							<p class="cheap_car_info_text">연식 : <%= cheapCar.getModel_year() %></p>
						</div>
						</a>
					</div>
					<%}else{%>
		            <!-- 로그인 되어 있는 경우 -->	
					<div class="show_cheap_car">
						<a href="./reservation.jsp">
							<div class="cheap_car_image_box">
								<img class="cheap_car_image" src="<%= cheapCar.getCar_image() %>" alt="Car Image">
							</div>
							<hr class="dividing_line"/>
							<div class="cheap_car_info">
								<p class="cheap_car_info_text">차량명 : <%= cheapCar.getCar_name() %></p>
								<p class="cheap_car_info_text">사이즈 : <%= cheapCar.getCar_size() %></p>
								<p class="cheap_car_info_text">연식 : <%= cheapCar.getModel_year() %></p>
							</div>
						</a>
					</div>
					<%} %>	
					<% 
						}
					} else {
						// 데이터가 없을 때 처리할 부분
					}
					%>
				</div>
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
					<% if (headerId == null || memberInfoHeaderDTO == null){ %>
						 <!-- 로그인 되어 있지 않은 경우 -->
					 <div class="show_old_car logout_status">
						 <a href="./login.jsp">
							<div class="old_car_image_box">
								<img class="old_car_image" src="<%= oldCar.getCar_image() %>" alt="Car Image">
							</div>
							<hr class="dividing_line"/>
							<div class="old_car_info">
								<p class="old_car_info_text">차량명 : <%= oldCar.getCar_name() %></p>
								<p class="old_car_info_text">사이즈 : <%= oldCar.getCar_size() %></p>
								<p class="old_car_info_text">연식 : <%= oldCar.getModel_year() %></p>
							</div>
						 </a>	
					</div>
					 <%}else{%>
					 <!-- 로그인 되어 있는 경우 -->	
						<div class="show_old_car">
							<a href="./reservation.jsp">
								<div class="old_car_image_box">
									<img class="old_car_image" src="<%= oldCar.getCar_image() %>" alt="Car Image">
								</div>
								<hr class="dividing_line"/>
								<div class="old_car_info">
									<p class="old_car_info_text">차량명 : <%= oldCar.getCar_name() %></p>
									<p class="old_car_info_text">사이즈 : <%= oldCar.getCar_size() %></p>
									<p class="old_car_info_text">연식 : <%= oldCar.getModel_year() %></p>
								</div>
							</a>	
						</div>
						<%} %>
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
					<% if (headerId == null || memberInfoHeaderDTO == null){ %>
						 <!-- 로그인 되어 있지 않은 경우 -->
					<div class="show_popular_car logout_status">
						<a href="./login.jsp">
							<div class="popular_car_image_box">
								<img class="popular_car_image" src="<%= popularCar.getCar_image() %>" alt="Car Image">
							</div>
							<hr class="dividing_line"/>
							<div class="popular_car_info">
								<p class="popular_car_info_text">차랑명 : <%= popularCar.getCar_name() %></p>
								<p class="popular_car_info_text">사이즈 : <%= popularCar.getCar_size() %></p>
								<p class="popular_car_info_text">연식 : <%= popularCar.getModel_year() %></p>
							</div>
						</a>	
					</div>
					 
					<%}else{%>
					 <!-- 로그인 되어 있는 경우 -->	 
					<div class="show_popular_car">
						<a href="./reservation.jsp">
							<div class="popular_car_image_box">
								<img class="popular_car_image" src="<%= popularCar.getCar_image() %>" alt="Car Image">
							</div>
							<hr class="dividing_line"/>
							<div class="popular_car_info">
								<p class="popular_car_info_text">차랑명 : <%= popularCar.getCar_name() %></p>
								<p class="popular_car_info_text">사이즈 : <%= popularCar.getCar_size() %></p>
								<p class="popular_car_info_text">연식 : <%= popularCar.getModel_year() %></p>
							</div>
						</a>	
					</div>
					<%} %>
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
    <script type="text/javascript">
	 window.history.forward();
	 function noBack(){window.history.forward();}
	</script>
    <script src="./js/login.js"></script>
</body>


</html>
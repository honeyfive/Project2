<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="db.dao.CarInfoCheckDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.CarAvailableDAO"%>
<%@ page import="db.dto.CarAvailableDTO"%>
<%@ page import="db.dao.Top5MemberDAO"%>
<%@ page import="db.dto.MemberInfoDTO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.side_bar {
	margin-right: 2%;
	width: 10%;
	height: 1200px;
	float: left;
	/* border: 3px solid black; */
	/* background-color: #0D6FFC; */
	/* color: white; */
	border-right: 3px solid #0D6FFC;
	font-weight: bold;
}

}

body {
	color: #666;
	font: 14px/24px "Open Sans", "HelveticaNeue-Light",
		"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
		"Lucida Grande", Sans-Serif;
}



.manage {
	margin: 0 auto;
	font-size: 1.1rem;
	margin-top: 15%;
}

a {
text-decoration-line : none;
color: gray;
}

.car_available_img {
	width: 60%;
	height: 70%;
	margin-top:5%;
	margin-left: 40%;
}

.car_available {
	display:inline-block;
	margin-left:2%;
	magin-top:17%;
	width:25%;
	height:20vh;
	border: 1px solid #4891d4;
	background-color: #4891d4;
	border-radius: 2px;
	position: relative;
}

.car_using{
	display:inline-block;
	margin-left:5%;
	magin-top:17%;
	width:25%;
	height:20vh;
	border: 1px solid #f4d141;
	background-color: #f4d141;
	border-radius: 2px;
	position: relative;
}

.car_maintenance{
	display:inline-block;
	margin-left:5%;
	magin-top:17%;
	width:25%;
	height:20vh;
	border: 1px solid #e67e22;
	background-color: #e67e22;
	border-radius: 2px;
	position: relative;
}


.availableCount {
	
	position:absolute;
	margin-left: 1%;
	color: white;
	font-size: 1.9rem;
	padding-top:15%;
	padding-left: 12%;
	font-weight: bold;
}

.ment {
	font-size:1.6rem;
	margin-left: 3%;
	color: white;
}

span {
	font-weight: bold;
}

.member_graph {
	margin-left : 5%;
	margin-bottom : 3%;
	display: inline-block;
	color: #607274;
}

#bar-chart {
	margin-top: 5%;
	margin-left: 25%;
}

.line {
	width: 40%;
	height: 2px;
	color: #607274;
	border: 2px solid #607274;
}

hr {
	height: 10px;
  	border: 0;
  	box-shadow: 0 10px 10px -10px #8c8c8c inset;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="side_bar">
		<a href="./manage_main.jsp"><div class="manage"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
</svg> 메인 화면</div></a>
		<a href="./Member.jsp"><div class="manage"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664z"/>
</svg> 고객 관리</div></a>
		<a href="./carInfo_check.jsp"><div class="manage"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-car-front" viewBox="0 0 16 16">
  <path d="M4 9a1 1 0 1 1-2 0 1 1 0 0 1 2 0m10 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM4.862 4.276 3.906 6.19a.51.51 0 0 0 .497.731c.91-.073 2.35-.17 3.597-.17 1.247 0 2.688.097 3.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 10.691 4H5.309a.5.5 0 0 0-.447.276"/>
  <path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM4.82 3a1.5 1.5 0 0 0-1.379.91l-.792 1.847a1.8 1.8 0 0 1-.853.904.807.807 0 0 0-.43.564L1.03 8.904a1.5 1.5 0 0 0-.03.294v.413c0 .796.62 1.448 1.408 1.484 1.555.07 3.786.155 5.592.155 1.806 0 4.037-.084 5.592-.155A1.479 1.479 0 0 0 15 9.611v-.413c0-.099-.01-.197-.03-.294l-.335-1.68a.807.807 0 0 0-.43-.563 1.807 1.807 0 0 1-.853-.904l-.792-1.848A1.5 1.5 0 0 0 11.18 3z"/>
</svg> 차량 관리</div></a>
		<a href="./test main.jsp"><div class="manage"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-kanban" viewBox="0 0 16 16">
  <path d="M13.5 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1h-11a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zm-11-1a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h11a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
  <path d="M6.5 3a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1zm-4 0a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1zm8 0a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1z"/>
</svg> 렌트 관리</div></a>
		<a href="./login.jsp"><div class="manage"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
  <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1z"/>
</svg> 로그 아웃</div></a>
	</div>

	<%
		
		CarAvailableDAO carAvailableDAO = new CarAvailableDAO();
		
		int availableCount = carAvailableDAO.findCarAvailable(); //사용가능한차 count
		
		int maintenanceCount = carAvailableDAO.findCarMaintenance(); //정비중인차 count
		
		int usingCount = carAvailableDAO.findCarUsing(); //사용중인차 count
		
		Top5MemberDAO top5MemberInfoDAO = new Top5MemberDAO();
		
		List<MemberInfoDTO> top5MemberList = top5MemberInfoDAO.findTop5MemberList();
		
		CarInfoCheckDAO carInfoCheckDAO = new CarInfoCheckDAO();
		
		int gasoline = carInfoCheckDAO.findCarByTypeGasoline();  //gasoline
		
		int diesel = carInfoCheckDAO.findCarByTypeDiesel();  //diesel
		
		int electronic = carInfoCheckDAO.findCarByTypeElectronic(); //electronic
		
		int hydrogen = carInfoCheckDAO.findCarByTypeHydrogen(); //hydrogen
		
		int vehicleRating_1 = carInfoCheckDAO.findCarByVehicleRating_1(); //배기량 0~999
		
		int vehicleRating_2 = carInfoCheckDAO.findCarByVehicleRating_2(); //배기량 1000~2999
		
		int vehicleRating_3 = carInfoCheckDAO.findCarByVehicleRating_3(); //배기량 3000~4999
		
		int vehicleRating_4 = carInfoCheckDAO.findCarByVehicleRating_4(); //배기량 > 5000
		
		MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		
		int age_1 = memberInfoDAO.findMemberByAge_1();  //나이 20-25
		
		int age_2 = memberInfoDAO.findMemberByAge_2();
		
		int age_3 = memberInfoDAO.findMemberByAge_3();
		
		int age_4 = memberInfoDAO.findMemberByAge_4();
		
		int age_5 = memberInfoDAO.findMemberByAge_5();
		
		System.out.println(availableCount + " " + gasoline + " " + diesel + " " + electronic + " " + hydrogen + " " + vehicleRating_1);
		
	%>
	
		<hr/>
		<span>Dashboard</span>
		<br></br>
		<div class="car_available">
			<div class="ment">사용가능</div>
			<div class="availableCount">
				<%=availableCount %>
			</div>
		<img src="./images/자동차_사용가능.png" class="car_available_img">
		</div>
		
		<div class="car_using">
			<div class="ment">사용중</div>
			<div class="availableCount">
				<%=usingCount %>
			</div>
		<img src="./images/자동차_사용중.png" class="car_available_img">
		</div>
		
		<div class="car_maintenance">
			<div class="ment">정비중</div>
			<div class="availableCount">
				<%=maintenanceCount %>
			</div>
		<img src="./images/자동차_정비중.png" class="car_available_img">
		</div>
		<br></br>
		<hr/>
		
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<canvas id="doughnut-chart" width="500" height="200" style="display: inline-block;"></canvas>

	<script>
	let usingCount = '<%=usingCount %>';
	let gasoline = '<%=gasoline%>';
	let diesel = '<%=diesel%>';
	let electronic = '<%=electronic%>';
	let hydrogen = '<%=hydrogen%>';
	
	new Chart(document.getElementById("doughnut-chart"), {
	    type: 'doughnut',
	    data: {
	      labels: ["Gasoline", "Diesel", "Electric", "Hydrogen"],
	      datasets: [
	        {
	          label: "Population (millions)",
	          backgroundColor: ["#35a331", "#fe3852","#f7f700","#52D3D8"],
	          data: [gasoline,diesel,electronic,hydrogen]
	        }
	      ]
	    },
	    options: {
	    	responsive: false,
	      title: {
	        display: true,
	        text: 'By Car Type'
	      }
	    }
	});
	</script>
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<canvas id="doughnut-chart1" width="500" height="200" style="display: inline-block;"></canvas>

	<script>
	let vehicleRating_1 = '<%=vehicleRating_1 %>';
	let vehicleRating_2 = '<%=vehicleRating_2%>';
	let vehicleRating_3 = '<%=vehicleRating_3%>';
	let vehicleRating_4 = '<%=vehicleRating_4%>';
	
	new Chart(document.getElementById("doughnut-chart1"), {
	    type: 'doughnut',
	    data: {
	      labels: ["0~999", "1000~2999", "3000~4999", "5000 ↑"],
	      datasets: [
	        {
	          label: "Population (millions)",
	          backgroundColor: ["#C499F3", "#739072","#596FB7","#7D0A0A"],
	          data: [vehicleRating_1,vehicleRating_2,vehicleRating_3,vehicleRating_4]
	        }
	      ]
	    },
	    options: {
	    	responsive: false,
	      title: {
	        display: true,
	        text: 'By Vehicle Rating'
	      }
	    }
	});
	</script>
	<br></br>
	<hr/>
	<p></p>
	<table class="member_graph">
		<tr>
			<td>
				TOP 5 Client ⭐
			</td>
		</tr>
		
		<%
		int a = 0;
		for(MemberInfoDTO memberInfo : top5MemberList) {
			a++;
						  %>
		<tr>
			<td><%=
			a + ".       " + memberInfo.getName()
			%></td>
		</tr>
		<%
	  } 
	  %>
	</table>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<canvas id="bar-chart" width="500" height="200" style="display: inline-block;"></canvas>
	
	<script>
	let age_1 = '<%=age_1%>';
	let age_2 = '<%=age_2%>';
	let age_3 = '<%=age_3%>';
	let age_4 = '<%=age_4%>';
	let age_5 = '<%=age_5%>';
	
	new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: ["20-25", "26-29", "30-35", "36-39", "40more"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [age_1,age_2,age_3,age_4,age_5, 0]
        }
      ]
    },
    options: {
      responsive: false,
      legend: { display: false },
      title: {
        display: true,
        text: 'Client By Age'
      }
    }
});
	</script>
</body>
</html>
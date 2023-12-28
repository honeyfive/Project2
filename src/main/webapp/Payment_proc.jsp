<%@page import="db.dto.PaymentInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="db.dao.ReservationInfoDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //문자인코딩 설정
		String name = request.getParameter("name");
		System.out.println(name);
		
		ReservationInfoDAO reservationInfoDAO = new ReservationInfoDAO();
		
		int result = reservationInfoDAO.saveReservationInfo(name);
		
		
		//이거~~~~~ 두줄 쌤이 써줁거 ㅎ
		savePaymentInfo(100002, 1653652, C , dk  , 1112, 3 );
		savePaymentInfo(PaymentInfoDTO);
// 		int result = 0;
		
		if(result > 0){
	%>
		<script>
			alert('저장 성공');
			location.href = 'index.jsp'; //해당 경로로 페이지 이동
		</script>
	<%
		} else {
	%>
		<script>
			alert('저장 실패');
			//location.href = 'addPerson.jsp'; //해당 경로로 이동
			history.back(); //뒤로가기
		</script>
	<%	
		}
	%>

</body>
</html>
<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.MemberInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birthYear = request.getParameter("birth-year");
	String birthMonth = request.getParameter("birth-month");
	String birthDate = request.getParameter("birth-date");
	String lisence1 = request.getParameter("lisence1");
	String lisence2 = request.getParameter("lisence2");
	String lisence3 = request.getParameter("lisence3");
	String lisence4 = request.getParameter("lisence4");
	String lisenceYear = request.getParameter("lisence-year");
	String lisenceMonth = request.getParameter("lisence-month");
	String lisenceDate = request.getParameter("lisence-date");
	String gender = request.getParameter("gender");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String email = request.getParameter("email");

	
	System.out.println("proc 변수 확인 > 아이디" + id + " 비번" + pw + " 이름" + name +
			" 출생년도" + birthYear + " 출생월" + birthMonth + " 출생일" + birthDate +
			" 성별" + gender + " 운전면허1" + lisence1 + " 운전면허2" + lisence2 +
			" 운전면허3" + lisence3 + " 운전면허4" + lisence4 + " 면허취득년" + lisenceYear +
			" 면허취득월" + lisenceMonth + " 면허취득일" + lisenceDate +
			" 전화번호1" + tel1 + " 전화번호2" + tel2 + " 전화번호3" + tel3 +
			" 이메일" + email);
	
	
	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	int result = memberInfoDAO.saveMemberList(name, birthYear, tel1, tel2, tel3, 
			id, pw, email, lisence1, lisence2, lisence3, lisence4, 
			gender, birthMonth, birthDate, lisenceYear, lisenceMonth, lisenceDate);

	if (result > 0) {
	%>
	<script>
		alert('회원가입 완료 !');
		location.href = 'mainpage.jsp';
	</script>
	<%
	} else {
	%>
	<script>
		alert('회원 가입에 실패했습니다.\n입력하신 정보들을 다시 한 번 확인해주세요.');
		location.href = 'signup.jsp';
	</script>
	<%
	}
	%>


</body>
</html>
<%@page import="db.dto.MemberInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.MemberInfoDAO"%>
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
	String pw = request.getParameter("password");
	String email = request.getParameter("email");
	System.out.println(id);
	System.out.println(pw);

	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();

	MemberInfoDTO memberinfoDTO = memberInfoDAO.findMemberByIdPw(id, pw);

	if (memberinfoDTO == null) {
	%>
	<script>
		alert('아이디와 비밀번호를 확인하세요');
		location.href = 'login.jsp';
	</script>
	<%
	} else { //로그인 성공시
	session.setAttribute("id", id);
	%>
	<script>
		alert('로그인 성공');
		location.href = 'mainpage.jsp'; // 메인 페이지랑 연결
	</script>
	<%
	}
	%>
</body>
</html>
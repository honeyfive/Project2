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
	System.out.println(id);
	System.out.println(pw);

	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();

	List<MemberInfoDTO> memberinfoList = memberInfoDAO.findMemberListById(id, pw);

	if (memberinfoList.size() == 0) {
	%>
	<script>
		alert('아이디와 비밀번호를 확인하세요');
		location.href = 'login.jsp';
	</script>
	<%
	} else {
	%>
	<script>
		alert('로그인 성공');
	 	location.href = ''; // 메인 페이지랑 연결
	</script>
	<%
	}
	%>
</body>
</html>
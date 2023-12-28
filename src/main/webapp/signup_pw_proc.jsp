<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.MemberInfoDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String pw = request.getParameter("pw");
	
	System.out.println(pw);

	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	List<MemberInfoDTO> memberInfoList = memberInfoDAO.findMemberListByPw(pw);

	if (memberInfoList.size() > 0) {
	%>
	<script>
		alert('<%=pw%>는 이미 사용 중인 비밀번호입니다.\n보안을 위해 다른 비밀번호를 입력해주세요.');
		location.href = 'signup.jsp';
	</script>
	<%
	} else {
	%>
	<script>
		alert('사용 가능한 비밀번호 입니다!');
		location.href = 'signup.jsp';
	</script>
	<%
	}
	%>
</body>
</html>
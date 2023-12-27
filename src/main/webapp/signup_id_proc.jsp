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
	String id = request.getParameter("id");

	System.out.println(id);

	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	List<MemberInfoDTO> memberInfoList = memberInfoDAO.findMemberListById(id);

	if (memberInfoList.size() > 0) {
	%>
	<script>
		alert('<%=id%>는 이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.');
		location.href = 'signup.jsp';
	</script>
	<%
	} else {
	%>
	<script>
		alert('사용 가능한 아이디 입니다!');
		location.href = 'signup.jsp';
	</script>
	<%
	}
	%>

</body>
</html>
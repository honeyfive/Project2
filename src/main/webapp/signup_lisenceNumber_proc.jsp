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
	String lisence1 = request.getParameter("lisence1");
	String lisence2 = request.getParameter("lisence2");
	String lisence3 = request.getParameter("lisence3");
	String lisence4 = request.getParameter("lisence4");
	System.out.println(lisence1 + "-" + lisence2 + "-" + lisence3 + "-" + lisence4);

	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	List<MemberInfoDTO> memberInfoList = memberInfoDAO.findMemberListByLisenceNumber
			(lisence1, lisence2, lisence3, lisence4);

	if (memberInfoList.size() > 0) {
	%>
	<script>
		alert('<%=lisence1%>-<%=lisence2%>-<%=lisence3%>-<%=lisence4%>는 이미 등록된 운전면허번호입니다.');
		location.href = 'signup.jsp';
	</script>
	<%
	} else {
	%>
	<script>
		alert('등록되었습니다!');
		location.href = 'signup.jsp';
	</script>
	<%
	}
	%>
</body>
</html>
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
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	System.out.println(tel1 + "-" + tel2 + "-" + tel3);

	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	List<MemberInfoDTO> memberInfoList = memberInfoDAO.findMemberListByTel(tel1, tel2, tel3);
	System.out.println("리스트 사이즈 : " + memberInfoList.size());

	
	if (memberInfoList.size() > 0) {
	%>
	<script>
		alert('<%=tel1%>-<%=tel2%>-<%=tel3%>는 이미 등록된 전화번호입니다.');
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
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
	String pwCheck = request.getParameter("pw-check");
	String name = request.getParameter("name");
	String birthYear = request.getParameter("birth-year");
	String birthMonth = request.getParameter("birth-month");
	String birthDate = request.getParameter("birth-date");
	String lisence1 = request.getParameter("lisence-1");
	String lisence2 = request.getParameter("lisence-2");
	String lisence3 = request.getParameter("lisence-3");
	String lisence4 = request.getParameter("lisence-4");
	String lisenceYear = request.getParameter("lisence-year");
	String lisenceMonth = request.getParameter("lisence-month");
	String licenseDate = request.getParameter("lisence-date");
	String gender = request.getParameter("gender");
	String tel1 = request.getParameter("tel-1");
	String tel2 = request.getParameter("tel-2");
	String tel3 = request.getParameter("tel-3");
	String email = request.getParameter("email");
	String smsOk = request.getParameter("sms-ok");
	String emailOk = request.getParameter("email-ok");
	String iAmOk = request.getParameter("I-am-ok");
	
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
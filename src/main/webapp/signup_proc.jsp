<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="oracle.net.aso.l"%>
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
	String license1 = request.getParameter("license-1");
	String license2 = request.getParameter("license-2");
	String license3 = request.getParameter("license-3");
	String license4 = request.getParameter("license-4");
	String licenseYear = request.getParameter("license-year");
	String licenseMonth = request.getParameter("license-month");
	String licenseDate = request.getParameter("license-date");
	String gender = request.getParameter("gender");
	String tel1 = request.getParameter("tel-1");
	String tel2 = request.getParameter("tel-2");
	String tel3 = request.getParameter("tel-3");
	String email = request.getParameter("email");
	String smsOk = request.getParameter("sms-ok");
	String emailOk = request.getParameter("email-ok");
	String iAmOk = request.getParameter("I-am-ok");
	
	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		
	%>
</body>
</html>
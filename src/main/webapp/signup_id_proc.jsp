<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.MemberInfoDTO"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");

	System.out.println(id);

	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	MemberInfoDTO memberInfoDTO = memberInfoDAO.findMemberById(id);

	int result = 0;
	
	if(memberInfoDTO != null){
		result = 0; // 실패
		out.print(result);
	} else{
		result = 1; // 성공
		out.print(result);

	}
	%>

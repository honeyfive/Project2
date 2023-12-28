<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.MemberInfoDTO"%>

	<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");

	System.out.println(email);

	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	List<MemberInfoDTO> memberInfoList = memberInfoDAO.findMemberListByEmail(email);
	
	int result = 0;
	
	if(memberInfoList.size() > 0){
		result = 0; // 실패
		out.print(result);
	} else{
		result = 1; // 성공
		out.print(result);


	}
	%>
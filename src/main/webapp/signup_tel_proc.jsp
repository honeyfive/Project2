<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.MemberInfoDTO"%>

<%
	request.setCharacterEncoding("UTF-8");
	String tel = request.getParameter("tel");

	System.out.println(tel);

	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	List<MemberInfoDTO> memberInfoList = memberInfoDAO.findMemberListByTel(tel);
	
	int result = 0;
	
	if(memberInfoList.size() > 0){
		result = 0; // 실패
		out.print(result);
	} else{
		result = 1; // 성공
		out.print(result);


	}
	%>
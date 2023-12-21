<%@page import="db.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.MemberInfoDAO"%>
<%@ page import="db.dto.MemberInfoDTO"%>
<%@ page import="java.util.List" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	
		List<MemberInfoDTO> memberList = memberInfoDAO.findMemberList();
%>
	
	<h1>회원정보</h1>
	<p></p>
	<table border="1">
	  <tr>
	  	<th>회원번호</th>
	  	<th>이름</th>
	  	<th>나이</th>
	  	<th>전화번호</th>
	  	<th>아이디</th>
	  	<th>비밀번호</th>
	  	<th>이메일</th>
	  	<th>회원등급</th>
	  	<th>면허증번호</th>
	  	<th>성별</th>
	  	<th>생년월일</th>
	  	<th>면허취득일</th>
	  	<th>연체횟수</th>
	  	<th>이용횟수</th>
	  </tr>
	

		
		
	  <%
						  for(MemberInfoDTO memberInfo : memberList) {
						  %>
	  
	  	<tr>
		<td>
	  	<%=memberInfo.getMembership_number()%>
	  	</td>
	  	<td>
	  	 <%=memberInfo.getName()%> 
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getAge()%> 
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getTel()%>
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getId()%>
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getPassword()%>
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getEmail()%>
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getMembership_level()%>
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getLisence_number()%>
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getGender()%>
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getBirthday()%>
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getLisence_acquisition_date()%>
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getOverdue_history()%>
	  	 </td>
	  	 <td>
	  	 <%=memberInfo.getUse_count()%>
	  	 </td>
	  	 </tr>
	  <%
	  } 
	  %>
	  </table>

</body>
</html>
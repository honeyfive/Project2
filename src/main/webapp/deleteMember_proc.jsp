<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.MemberInfoDAO" %>
<%@ page import="db.dto.MemberInfoDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		String membership_number = request.getParameter("membership_number");
		System.out.println("deleteMember_proc 파라미터 : " + membership_number);
		int intId = Integer.parseInt(membership_number);
		
		MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		int result = memberInfoDAO.removeMemberById(intId);
		
		if(result > 0){
			%>
				<script>
					alert('삭제 성공');
					location.href='Member.jsp';
				</script>
			<%		
				} else {
			%>
				<script>
					alert('회원번호를 다시 한번 확인해주세요');
					history.back();
				</script>
			<%
				}
			%>
	%>
		
</body>
</html>
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
		String id = request.getParameter("id");
		System.out.println("deleteMember_proc 파라미터 : " + id);
		
		MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		int result = memberInfoDAO.removeMember(id);
		
		if(result > 0){
			%>
				<script>
					alert('탈퇴되었습니다');
					location.href='mainpage.jsp';
				</script>
			<%		
				} else {
			%>
				<script>
					alert('삭제 실패');
					//location.href = 'addPerson.jsp';
					history.back();
				</script>
			<%
				}
			%>
</body>
</html>
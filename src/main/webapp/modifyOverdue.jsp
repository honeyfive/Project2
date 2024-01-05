<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.MemberInfoDAO"%>
<%@ page import="db.dto.MemberInfoDTO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String membership_number = request.getParameter("membership_number");
		String overdue_history = request.getParameter("overdue_history");
		System.out.println("modifyPerson_proc 파라미터 : " + membership_number + " " + overdue_history);
		int intMembership_number = Integer.parseInt(membership_number);
		int intOverdue_history = Integer.parseInt(overdue_history);
		
		MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		
		MemberInfoDTO memberInfo = new MemberInfoDTO(intMembership_number, intOverdue_history);
		
		/* memberInfo.setMembership_number(intMembership_number);
		memberInfo.setOverdue_history(intOverdue_history); */
		
		int result = memberInfoDAO.modifyOverdue(memberInfo);
		System.out.println(result);
		
		if(result > 0){
			%>
				<script>
					alert('수정 성공');
					location.href='Member.jsp';
				</script>
			<%		
				} else {
			%>
				<script>
					alert('수정 실패');
					//location.href = 'addPerson.jsp';
					history.back();
				</script>
			<%
				}

			%>
	%>
</body>
</html>
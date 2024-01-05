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
		String membership_level = request.getParameter("membership_level");
		System.out.println("modifyPerson_proc 파라미터 : " + membership_number + " " + membership_level);
		int intMembership_number = Integer.parseInt(membership_number);
		
		MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		
		MemberInfoDTO memberInfo = new MemberInfoDTO(intMembership_number, membership_level);
		
		int result = memberInfoDAO.modifyMembershipLevel(memberInfo);
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
					alert('회원번호를 다시 한번 확인해주세요');
					history.back();
				</script>
			<%
				}

			%>
	%>
</body>
</html>
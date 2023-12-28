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
		String use_count = request.getParameter("use_count");
		System.out.println("modifyUse_count 파라미터 : " + membership_number + " " + use_count);
		int intMembership_number = Integer.parseInt(membership_number);
		int intUse_count = Integer.parseInt(use_count);
		
		MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		
		MemberInfoDTO memberInfo = new MemberInfoDTO();
		memberInfo.setMembership_number(intMembership_number);
		memberInfo.setUse_count(intUse_count);
		//new MemberInfoDTO(intMembership_number, intUse_count);
		
		
		int result = memberInfoDAO.modifyUseCount(memberInfo);
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
					history.back();
				</script>
			<%
				}

			%>
	%>
</body>
</html>
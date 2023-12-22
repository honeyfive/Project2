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
		/* String name = request.getParameter("name");
		String age = request.getParameter("age");
		String tel = request.getParameter("tel");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email"); */
		String membership_level = request.getParameter("membership_level");
		/* String lisence_number = request.getParameter("lisence_number");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String lisence_acquisition_date = request.getParameter("lisence_acquisition_date");
		String overdue_history = request.getParameter("overdue_history");
		String use_count = request.getParameter("use_count");
		System.out.println("modifyPerson_proc 파라미터 : " + membership_number + " " + membership_level + " 1 " + age + gender);
		*/
		System.out.println("modifyPerson_proc 파라미터 : " + membership_number + " " + membership_level);
		int intMembership_number = Integer.parseInt(membership_number);
		/* int intAge = Integer.parseInt(age);
		int intOverdue_history = Integer.parseInt(overdue_history);
		int intUse_count = Integer.parseInt(use_count); */
		
		MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		/* MemberInfoDTO memberInfo = new MemberInfoDTO(intMembership_number, name, intAge, tel, id, password,
													email, membership_level, lisence_number, gender,
													birthday, lisence_acquisition_date, intOverdue_history,
													intUse_count); */
		
		MemberInfoDTO memberInfo = new MemberInfoDTO(intMembership_number, membership_level);
		
		int result = memberInfoDAO.modifyMembershipLevel(memberInfo);
		
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
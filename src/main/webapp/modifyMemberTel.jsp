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
        String tel = request.getParameter("tel");
        String id = request.getParameter("id");
        System.out.println("modifyPerson_proc 파라미터 : " + tel + id);

        MemberInfoDAO memberInfoDAO = new MemberInfoDAO();

        MemberInfoDTO memberInfo = new MemberInfoDTO();
        memberInfo.setTel(tel);
        memberInfo.setId(id);

        int result = memberInfoDAO.modifyTel(memberInfo);
        System.out.println(result);

        if(result > 0){
            %>
                <script>
                    alert('수정 성공');
                    location.href='myinfoproc.jsp';
                    window.history.forward();
                </script>
            <%
                } else {
            %>
                <script>
                    alert('수정 실패');
                    //location.href = '이동경로';
                    history.back();
                </script>
            <%
                }

            %>
    %>
</body>
</html>
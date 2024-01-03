<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.MemberInfoDAO"%>
<%@ page import="db.dto.MemberInfoDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        System.out.println("modifyPerson_proc 파라미터 : " + id + name);

        MemberInfoDAO memberInfoDAO = new MemberInfoDAO();

        MemberInfoDTO memberInfo = new MemberInfoDTO();
        memberInfo.setId(id);
        memberInfo.setName(name);

        int result = memberInfoDAO.modifyId(memberInfo);
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
</body>
</html>
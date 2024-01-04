<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="db.dao.MemberInfoDAO"  %>
<%@ page import="db.dto.MemberInfoDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>휴카</title>
    <link rel="shortcut icon" href="./images/favicon.png" type="image/png" sizes="32x32">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" 
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="./css/myinfoproc.css">
</head> 
</head>
<body>
    <!--헤더-->
    <%@ include file="header2.jsp" %>
	
	<% 
	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	String id = (String)session.getAttribute("id");
	MemberInfoDTO loginMemberDTO = memberInfoDAO.findMemberById(id);
	%> 
    <!-- 내 정보 페이지 메인 -->
    <div class="my_Info_main_container">
        <div class="my_info_box">
        		<!-- 회원 이름  -->
            <p class="my_info_text"> <%=loginMemberDTO.getName() %>님 정보 </p>
        </div>
        <div class="my_info_main_box">
            <div class="my_id_email_box">
                <!-- 회원 아이디 -->
                <p class="member_id_big"> <%=loginMemberDTO.getId() %> </p>
                <!-- 회원 이메일 -->
                <p class="member_email_big"> <%=loginMemberDTO.getEmail() %> </p>
            </div>
            <div class="my_email_box">
                <p> 이메일계정 </p>
                <div class="go_to_member_email">
                    <p class="member_email"> <%=loginMemberDTO.getEmail() %>  </p>
                    <i class="fa-solid fa-angle-right"></i>
                </div>
            </div>   
            <div class="my_phonenum">
                <span> 전화번호 : <%=loginMemberDTO.getTel() %> </span>
                <i class="fa-solid fa-angle-right"></i>
            </div>
            <div class="my_id">
                <p>아이디</p>
                <div class="go_to_member_id">
                    <p class="member_id"><%=loginMemberDTO.getId() %>님 </p>
                </div>
            </div>
            <div class="my_birthday">
                <p> 생년월일 : <%=loginMemberDTO.getBirthday() %> </p>
                <i class="fa-solid fa-angle-right"></i>
            </div>
            <div class="my_gender">
                <p> 성별 : <%=loginMemberDTO.getGender() %> </p>
            </div>
        </div>
        <div class="account_linkage">
            <span class="account_linkage_text"> 계정연동</span>
            <div class="kakaotalk_box">
                <p><i class="fa-solid fa-comment-sms"></i> &nbsp;카카오톡</p>
                <button class="go_to_kakao_linkage">연동하기</button>
            </div>
            <div class="apple_box">
                <p><i class="fa-brands fa-apple"></i> &nbsp;Apple</p>
                <button class="go_to_apple_linkage">연동하기</button>
            </div>
            <div class="naver_box">
                <p><i class="fa-regular fa-n"></i> &nbsp;네이버</p>
                <button class="go_to_naver_linkage">연동하기</button>
            </div>
        </div>
        
        

        <div class="logout_box">
            <button id="go_to_logout" onclick="location.href='logout.jsp'">로그아웃</button>
            <span class="logout_slash">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
            <form id="member_out_form" method="post" action="deleteMemberInfo_proc.jsp">
            	<input type="hidden" name="id" value="<%=loginMemberDTO.getId() %>">
            	<button type="button" id="member_delete_btn" class="member_out">회원 탈퇴</button>
            </form>
            
        </div>
    </div>
	

<!-- 모달창 -->

    <div class="member_email_modal">
        <div class="email_modal_body">
            <div class="email_title">
                <span class="proc_email"> 이메일 수정 </span>
                <i class="fa-solid fa-xmark close_modal_btn"></i>
            </div>
            <div class="email_modal_main">
            <form action="modifyMemberEmail.jsp">
                <div class="modify_member_email">
                    <input type="hidden" name="id" value="<%=loginMemberDTO.getId() %>">
                    <input class="input_proc_email" placeholder="<%=loginMemberDTO.getEmail() %>" name="email">
                    <button  class="proc_btn"> 이메일 수정 </button>
                </div>
             </form>   
            </div>
        </div>
    </div>

    <div class="member_tel_modal">
        <div class="tel_modal_body">
            <div class="tel_title">
                <span class="proc_tel"> 전화번호 수정 </span>
                <i class="fa-solid fa-xmark close_modal_btn"></i>
            </div>
            <div class="tel_modal_main">
            <form action="modifyMemberTel.jsp">
                <div class="modify_member_tel">
                	<input type="hidden" name="id" value="<%=loginMemberDTO.getId() %>">
                    <input class="input_proc_tel" placeholder="<%=loginMemberDTO.getTel() %>" name="tel">
                    <span class="error_text">'010-1234-5678' 형식으로 입력 해 주세요.</span>
                    <button  class="proc_btn"> 전화번호 수정 </button>
                </div>
            </form>
            </div>
        </div>
    </div>

    <div class="member_birth_modal">
        <div class="birth_modal_body">
            <div class="birth_title">
                <span class="proc_birth"> 생년월일 수정 </span>
                <i class="fa-solid fa-xmark close_modal_btn"></i>
            </div>
            <div class="birth_modal_main">
            <form action="modifyMemberBirth.jsp">
                <div class="modify_member_birth">
                	<input type="hidden" name="id" value="<%=loginMemberDTO.getId() %>">
                    <input class="input_proc_birth" placeholder="<%=loginMemberDTO.getBirthday() %>" name="birthday">
                    <span class="error_text">'2000-01-01' 형식으로 입력 해 주세요.</span>
                    <button  class="proc_btn"> 생년월일 수정 </button>
                </div>
            </form>
            </div>
        </div>    
    </div>




    






    <!-- 푸터 -->
    <%@ include file="footer.jsp" %>

	<script src="./js/myinfoproc.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="db.dao.MemberInfoDAO"  %>
<%@ page import="db.dto.MemberInfoDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" 
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="css/myinfoproc.css">
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
            <div class="my_name">
                <!-- 회원 아이디 -->
                <p class="member_name"> <%=loginMemberDTO.getId() %> </p>
                <!-- 회원 이메일 -->
                <p class="member_email_big"> <%=loginMemberDTO.getEmail() %> </p>
            </div>
            <div class="my_email_id">
                <p> 이메일계정 </p>
                <div class="go_to_member_email">
                    <p class="member_email"> <%=loginMemberDTO.getEmail() %>  </p>
                    <i class="fa-solid fa-angle-right"></i>
                </div>
                <div class="member_email_modal">
                    <div class="email_modal_body">
                        <div class="email_title">
                            <span class="proc_email"> 이메일 수정 </span>
                            <i class="fa-solid fa-xmark close_modal_btn"></i>
                        </div>
                        <div class="email_modal_main">
                            <p>이메일</p>
                            <div><input class="input_proc_email" value="회원기존이메일"></div>
                            <button  class="proc_btn"> 이메일 수정 </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="my_phonenum">
                <span> 전화번호 : <%=loginMemberDTO.getTel() %> </span>
                <i class="fa-solid fa-angle-right"></i>
                <div class="member_tel_modal">
                    <div class="tel_modal_body">
                        <div class="tel_title">
                            <span class="proc_tel"> 전화번호 수정 </span>
                            <i class="fa-solid fa-xmark close_modal_btn"></i>
                        </div>
                        <div class="tel_modal_main">
                            <p> 전화 번호 </p>
                            <div><input class="input_proc_tel" value="회원기존전화번호"></div>
                            <button  class="proc_btn"> 전화번호 수정 </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="my_nickname">
                <p>닉네임</p>
                <div class="go_to_member_nickname">
                    <p class="member_nickname"><%=loginMemberDTO.getId() %>님 </p>
                    <i class="fa-solid fa-angle-right"></i>
                </div>
                <div class="member_nickname_modal">
                    <div class="nickname_modal_body">
                        <div class="nickname_title">
                            <span class="proc_nickname"> 닉네임 수정 </span>
                            <i class="fa-solid fa-xmark close_modal_btn"></i>
                        </div>
                        <div class="nickname_modal_main">
                            <p> 닉네임 </p>
                            <div><input class="input_proc_tel" value="회원기존닉네임"></div>
                            <button  class="proc_btn"> 닉네임 수정 </button>
                        </div>
                    </div>    
                </div>
            </div>
            <div class="my_birthday">
                <p> 생년월일 : <%=loginMemberDTO.getBirthday() %> </p>
                <i class="fa-solid fa-angle-right"></i>
                <div class="member_birth_modal">
                    <div class="birth_modal_body">
                        <div class="birth_title">
                            <span class="proc_birth"> 생년월일 수정 </span>
                            <i class="fa-solid fa-xmark close_modal_btn"></i>
                        </div>
                        <div class="birth_modal_main">
                            <p> 생년월일 </p>
                            <div><input class="input_proc_birth" value="회원기존생년월일"></div>
                            <button  class="proc_btn"> 생년월일 수정 </button>
                        </div>
                    </div>    
                </div>
            </div>
            <div class="my_gender">
                <p> 성별 : <%=loginMemberDTO.getGender() %> </p>
            </div>
        </div>
        <div class="account_linkage">
            <span class="account_linkage_text"> 계정연동</span>
            <div class="kakaotalk_box">
                <p><i class="fa-solid fa-comment-sms"></i> &nbsp;카카오톡</p>
                <p><i class="fa-solid fa-check"></i> 연동중 </p>
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
            <a id="go_to_logout">로그아웃</a>
            <span class="logout_slash">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
            <a class="member_out">회원 탈퇴</a>
        </div>
    </div>
	<script>
		document.getElementById('go_to_logout').addEventListener('click',()=>{

            if(confirm('로그아웃 하시겠습니까?')){

                alert('로그아웃 되었습니다');
                location.href="./login.jsp";
            }
        })

        document.getElementsByClassName('my_email_id').addEventListener('click',()=>{
            document.getElementsByClassName('member_email_modal').style.display ='block';
        })

        document.getElementsByClassName('close_modal_btn').addEventListener('click',()=>{
            document.getElementsByClassName('member_email_modal').style.display='none';
        })
	
        window.onclick=function(event){
            if(event.target == document.getElementsByClassName('member_email_modal')){
                document.getElementsByClassName('member_email_modal').style.display = 'none';
            }
        }
	</script>

    <!-- 푸터 -->
    <%@ include file="footer.jsp" %>


</body>
</html>
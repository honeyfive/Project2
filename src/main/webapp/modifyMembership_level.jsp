<%@page import="db.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.dao.MemberInfoDAO"%>
<%@ page import="db.dto.MemberInfoDTO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.side_bar {
	margin-right: 2%;
	width: 10%;
	height: 1200px;
	display: block;
	float: left;
	border: 1px solid black;
}

body {
	color: #666;
	font: 14px/24px "Open Sans", "HelveticaNeue-Light",
		"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
		"Lucida Grande", Sans-Serif;
}

table {
	margin-top: 5%; border-collapse : separate;
	border-spacing: 0;
	width: 88%;
	border-collapse: separate;
}

th, td {
	padding: 8px 4px;
}

th {
	background: #0D6FFC;
	color: #fff;
	text-align: left;
}

tr:first-child th:first-child {
	border-top-left-radius: 6px;
}

tr:first-child th:last-child {
	border-top-right-radius: 6px;
}

td {
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
}

td:first-child {
	border-left: 1px solid #c6c9cc;
}

tr:nth-child(even) td {
	background: #eaeaed;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 6px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 6px;
}

#input_membership_number {
margin-top: 20px;
}

h1 {
 color: #0D6FFC;
}

.modal {
	position: absolute;
	display: none;
	justify-content: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 1200px;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal_body {
	position: absolute;
	top: 8%;  
	width : 1000px; 
	height : 200px; 
	padding : 10px;
	background-color: rgb(255, 255, 255); 
	border-radius :10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 
	transform:translateY(-50%);
	color: black;
}

#modalCloseButton {
	margin-left: 10px;
	cursor: pointer;
	float: right;
	padding: 5px;
}

.carAddModalTitle{
	margin-left: 15px;
	color: #0D6FFC;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
	/* String membership_number = request.getParameter("membership_number");
	System.out.println(membership_number);
	int intId = 0;
	try {
		intId = Integer.parseInt(membership_number);
	} catch (Exception e){
		e.printStackTrace();
		intId = 0;
	} */
	
		
		MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
		
		//MemberInfoDTO memberInfo = memberInfoDAO.findMemberById(intId);
	
		List<MemberInfoDTO> memberList = memberInfoDAO.findMemberList();
		%>

	<h1>회원정보 수정</h1>
	<p></p>
	<br>
	<br>
	<div class="carMaintenance">
		<button class="btn-open-modal">수정</button>
	</div>
	<table class="member_graph">
		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>전화번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>회원등급</th>
			<th>면허증번호</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>면허취득일</th>
			<th>연체횟수</th>
			<th>이용횟수</th>
		</tr>




		<%
		for(MemberInfoDTO memberInfo : memberList) {
						  %>

		<tr>
			<td><%=memberInfo.getMembership_number()%><a href="./Member.jsp?id=<%=memberInfo.getMembership_number()%>"></a></td>
			<td><%=memberInfo.getName()%></td>
			<td><%=memberInfo.getAge()%></td>
			<td><%=memberInfo.getTel()%></td>
			<td><%=memberInfo.getId()%></td>
			<td><%=memberInfo.getPassword()%></td>
			<td><%=memberInfo.getEmail()%></td>
			<td><%=memberInfo.getMembership_level()%><a href="./Member.jsp?id=<%=memberInfo.getMembership_level()%>"></a></td>
			<td><%=memberInfo.getLisence_number()%></td>
			<td><%=memberInfo.getGender()%></td>
			<td><%=memberInfo.getBirthday()%></td>
			<td><%=memberInfo.getLisence_acquisition_date()%></td>
			<td><%=memberInfo.getOverdue_history()%></td>
			<td><%=memberInfo.getUse_count()%></td>
		</tr>
		<%
	  } 
	  %>

	</table>
	


	 <div class="modal">
		<div class="modal_body">
			<h2 class="carAddModalTitle">
				회원정보 수정<span id="modalCloseButton">❌</span>
			</h2>
			<fieldset>
				<legend>회원정보 수정</legend>
				<form id="personForm" action="deleteMember_proc.jsp" method="post">
					<input type="text" id="input_membership_number"
						name="membership_number" placeholder="수정할 회원번호(필수입력)"><br>
					<label>등급 수정 : </label> <input type="text"
						id="input_membership_level" name="membership_level"
						placeholder="수정할 등급">
					<button id="modifyBtn" type="button">수정하기</button>
					<br> <label>연체횟수 수정 : </label> <input type="text"
						id="input_overdue_history" name="overdue_history"
						placeholder="연체횟수">
					<button id="modifyBtn1" type="button">수정하기</button>
					<br> <label>이용횟수 수정 : </label> <input type="text"
						id="input_use_count" name="use_count" placeholder="이용횟수">
					<button id="modifyBtn2" type="button">수정하기</button>
					<br>
				</form>

			</fieldset>
		</div>
	</div>
	<script>
		
		document.getElementById('modifyBtn').addEventListener('click',()=>{
			let input_membership_level = document.getElementById('input_membership_level');
			if(input_membership_level.value.trim() == ''){
				alert('회원번호는 필수 입력입니다.');
				input_membership_level.focus();
				return;
			}
			
			if (confirm('수정 하시겠습니까?')){
				let form = document.getElementById('personForm');
				form.action = 'modifyMember_proc.jsp';
				form.submit();
			}
		});
		
		document.getElementById('modifyBtn1').addEventListener('click',()=>{
			let input_overdue_history = document.getElementById('input_overdue_history');
			if(input_overdue_history.value.trim() == ''){
				alert('연체횟수는 필수 입력입니다.');
				input_overdue_history.focus();
				return;
			}
			
			if (confirm('수정 하시겠습니까?')){
				let form = document.getElementById('personForm');
				form.action = 'modifyOverdue.jsp';
				form.submit();
			}
		});
		
		document.getElementById('modifyBtn2').addEventListener('click',()=>{
			let input_use_count = document.getElementById('input_use_count');
			if(input_use_count.value.trim() == ''){
				alert('연체횟수는 필수 입력입니다.');
				input_use_count.focus();
				return;
			}
			
			if (confirm('수정 하시겠습니까?')){
				let form = document.getElementById('personForm');
				form.action = 'modifyUseCount.jsp';
				form.submit();
			}
		});
	</script>
	
	<script>
        const modal = document.querySelector('.modal');
        const btnOpenModal=document.querySelector('.btn-open-modal');
        const modalCloseButton = document.getElementById('modalCloseButton');

        btnOpenModal.addEventListener("click", ()=>{
            modal.style.display="flex";
        });
        
        modalCloseButton.addEventListener('click', () => {
        	  modal.style.display="none";
        	});
    </script>
</body>
</html>
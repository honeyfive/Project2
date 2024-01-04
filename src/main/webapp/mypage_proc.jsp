<%@page
	import="org.eclipse.jdt.internal.compiler.util.HashtableOfIntValues"%>
<%@page import="db.dao.MemberInfoDAO"%>
<%@page import="db.dto.MemberInfoDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.dao.ReservationCancelDAO"%>
<%@ page import="db.dto.ReservationCancelDTO"%>
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
	String[] cancelChkValues = request.getParameterValues("cancelChk"); // 체크된 예약 건의 예약 번호 가져오기
	if (cancelChkValues == null) {
		System.out.println("없지롱");
	%>
	<script>
		alert("선택된 예약 건이 없습니다.\n예약 취소를 진행하지 않고 마이페이지로 돌아갑니다.");
		location.href = "./mypage.jsp";
	</script>

	<%
	} else {
	// 문자열을 int로 변환 ..
	int[] intValues = new int[cancelChkValues.length];
	for (int i = 0; i < cancelChkValues.length; i++) {
		intValues[i] = Integer.parseInt(cancelChkValues[i]);
		System.out.println(intValues[i]);
	}
	// 세션에서 id 가져와서 그 아이디로 회원번호 가져오기
	String targetId = (String) session.getAttribute("id");
	System.out.println("아이디 확인 : " + targetId);
	MemberInfoDAO memberInfoDAO = new MemberInfoDAO();
	MemberInfoDTO memberInfo = memberInfoDAO.findMemberById(targetId);
	int targetMembershipNumber = memberInfo.getMembership_number();
	System.out.println("회원번호 확인 : " + targetMembershipNumber);

	ReservationCancelDAO reservationCancelDAO = new ReservationCancelDAO();
	for (int i = 0; i < intValues.length; i++) {
		ReservationCancelDTO reservationCancelDTO = reservationCancelDAO.saveReservationCancel(intValues[i],
		targetMembershipNumber);
		System.out.println(reservationCancelDTO);
	%>
	<script>
		alert("예약 삭제가 완료되었습니다!");
		location.href = "./mainpage.jsp";
	</script>
	<%
	}
	}
	%>

</body>
</html>
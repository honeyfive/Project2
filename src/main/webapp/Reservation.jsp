<%@page import="java.util.List"%>
<%@page import="db.dao.InsuranceInfoDAO"%>
<%@page import="db.dto.InsuranceInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	InsuranceInfoDAO insuranceDAO = new InsuranceInfoDAO();
	List<InsuranceInfoDTO> insuranceinfoList = insuranceDAO.findInsuranceInfoList();
	%>
<table border="1">
		<h3>보험종류</h3>
		<tr>전체<input type="checkbox"><tr>
		<%
		if(insuranceinfoList != null) {
			for (InsuranceInfoDTO insuranceinfo : insuranceinfoList) {
		%>
		
		<tr> <%=insuranceinfo.getInsurance_type()%><input type="checkbox"></tr>
			<%
			}
		}
			%>
<h3>자동차모델</h3>
<%
		if(insuranceinfoList != null) {
			for (InsuranceInfoDTO insuranceinfo : insuranceinfoList) {
		%>
		
		<tr> <%=insuranceinfo.getInsurance_type()%><input type="checkbox"></tr>
			<%
			}
		}
			%>
	</table>
	
</body>
</html>
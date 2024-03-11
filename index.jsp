<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
</head>
<body>
<%String section = request.getParameter("section");%>
<header>
<%@ include file="main_header.jsp"%>
</header>
<nav>
<%@ include file="main_nav.jsp"%>
</nav>
<section>
<%
	if(request.getParameter("section")==null){
		%>
		<%@ include file="main_section.jsp"%>
		<%
	}else{
		%>
		<jsp:include page="<%=section%>"/>
		<%
	}
%>
</section>
<footer>
<%@ include file="footer.jsp" %>
</footer>
</body>

</html>
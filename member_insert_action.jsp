<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<script>
function display_alert(){
	alert("회원정보 등록이 완료되었습니다.");
	
}
</script>
<%
	request.setCharacterEncoding("utf-8");
	String szCustno,szCustname,szPhone,szAddress,szJdate,szCgrade,szCity;
	try{
		szCustno=null;
		szCustname=null;
		szPhone=null;
		szAddress=null;
		szJdate=null;
		szCgrade=null;
		szCity=null;
		
		szCustno=     request.getParameter("custno");
		szCustname=   request.getParameter("custname");
		szPhone=	  request.getParameter("phone");
		szAddress=    request.getParameter("address");
		szJdate=      request.getParameter("joindate");
		szCgrade=     request.getParameter("grade");
		szCity=       request.getParameter("city");
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		if(conn!=null){
			System.out.println("DB 연결 : success"+"<br>");
		}
		else{
			System.out.println("DB 연결 : fail"+"<br>");
		}
		java.sql.PreparedStatement stmt= conn.prepareStatement("insert into member_tbl_02"+
                "(custno ,custname ,phone ,address ,joindate, grade,city) values(?,?,?,?,?,?,?)");
		stmt.setString(1,szCustno);
		stmt.setString(2,szCustname);
		stmt.setString(3,szPhone);
		stmt.setString(4,szAddress);
		stmt.setString(5,szJdate);
		stmt.setString(6,szCgrade);
		stmt.setString(7,szCity);
		stmt.executeUpdate();
		stmt.close();
		conn.close();
		response.sendRedirect("index.jsp?section=member_insert.jsp");
	}
	catch(Exception e){
		out.println(e);
	}
	%>
		
		
		
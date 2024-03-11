<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<h1 align="center">회원 조회</h1>
<table border="1">
<tr>
<th>회원번호</th>
<th>회원이름</th>
<th width="120">전화번호</th>
<th width="300">주소</th>
<th width="120">가입일자</th>
<th width="120">고객등급</th>
<th width="120">거주지역</th>
</tr>
<%
String szCustno, szCustname, szPhone, szAddress, szJdate,szCgrade,szCity;
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	java.sql.Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(" select custno, custname, phone, address,to_char(joindate,'yyyy-mm-dd') as jdate , " +
            "        decode(grade,'A','VIP','B','일반','C','직원') as cgrade , city " +
            " from   member_tbl_02 order by custno ");
	while(rs.next()){
		szCustno	=  rs.getString(1);
		szCustname  =  rs.getString(2);
		szPhone     =  rs.getString(3);
		szAddress   =  rs.getString(4);
		szJdate     =  rs.getString(5);
		szCgrade    =  rs.getString(6);
		szCity      =  rs.getString(7);
		
		%>
	<tr>
	<td><a href="index.jsp?section=member_update.jsp?custno=<%=szCustno%>"><%=szCustno %></a></td>
	<td><%=szCustname%></td>
	<td><%=szPhone%></td>
	<td><%=szAddress%></td>
	<td><%=szJdate%></td>
	<td><%=szCgrade%></td>
	<td><%=szCity%></td>
	</tr>
	<% 
	}
	rs.close();
	stmt.close();
	conn.close();

	
}catch(Exception e){
	out.println(e);
}

%>
</table>
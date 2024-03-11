<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<h1 align="center">회원매출조회</h1>
<table border="1"  >
<tr>
<th>회원번호</th>
<th>회원이름</th>
<th width ="80">고객등급</th>
<th width="120">매출</th>
</tr>
<%
String szCustno, szCustname,szCrade;
int i;
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(" select a.custno,b.CUSTNAME, " + 
            "        decode(b.grade,'A','VIP','B','일반','C','직원'), " +
              "        sum(a.price) as kk "  +
              " from MONEY_TBL_02 a, member_tbl_02 b " +
			                 " where a.CUSTNO = b.CUSTNO " +
            " group by a.custno, b.CUSTNAME, b.grade "+
                " order by kk desc " );
	while(rs.next()){
		szCustno = rs.getString(1);
		szCustname = rs.getString(2);
		szCrade= rs.getString(3);
		i=rs.getInt(4);
		%>
		<tr>
		<td><%=szCustno%></td>
		<td><%=szCustname%></td>
		<td><%=szCrade%></td>
		<td><%=i%></td>
		</tr>
		<%

	}
	rs.close();
	stmt.close();
	conn.close();
}catch(Exception e){
		out.print(e);
	}
%>
</table>

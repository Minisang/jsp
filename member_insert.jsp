<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<script>
function Insert(){
	alert("Start");
	if(frmmemberInsert.custno.value==""){
		alert("회원번호가 입력되지 않았습니다.")
		frmmemberInsert.custno.focus();
		return false;
	}
	if(frmmemberInsert.custname.value==""){
		alert("회원성명이 입력되지 않았습니다.")
		frmmemberInsert.custname.focus();
		return false;
	}
	frmmemberInsert.action = "member_insert_action.jsp";
	frmmemberInsert.submit();
	alert("회원등록이 완료되었습니다.");
}
function Delete(){
	alert("Start")
	if(frmmemberInsert.custno.value==""){
		alert("회원번호가 입력되지 않았습니다.");
		frmmemberInsert.custno.focus();
		return false;
	}
	if(frmmemberInsert.custname.value=""){
		alert("회원성명이 입력되지 않았습니다.")
		frmmemberInsert.custname.focus();
		return false;
		
	}
	frmmemberInsert.action = "member_delete.jsp";
	frmmemberInsert.submit();
	alert("회원등록이 완료되었습니다.");
}
</script>
<h2 align="center">회원등록</h2>
<%
String szCustno=null, szTdate=null;
int iTno,iStock;
try{
	PreparedStatement ps = null;
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	java.sql.Statement stmt= conn.createStatement();
	ResultSet rs1 = stmt.executeQuery("select max(custno) from member_tbl_02");
	if(rs1.next()) {
		iTno=rs1.getInt(1);//rs1에 첫번째 열의 값을 정수로 가져와 iTno에 할당
		iTno++;//변수의 값증가
		szCustno = Integer.toString(iTno);//iTno값을 문자열로 바꾸고 szCustno에 할당
		rs1.close();
	}
	else {
	    iTno=1;
	    szCustno = Integer.toString(iTno);
	    rs1.close();
	}
	stmt.close();
	conn.close();
}catch(Exception e){
	out.println(e);
}
%>
<form name="frmmemberInsert" method="post" action="member_insert_action.jsp">
<table border="1">
<tr><th align="center" width="150">회원번호(자동발생)</th>
<td align ="left"><input type="text" name="custno" size="10" maxlength="10" value="<%=szCustno %>"></td>
</tr>
<tr><th align="center" width="150">고객성명</th>
<td align="left"><input type="text" name="custname" size="10" maxlength="10"></td>
</tr>
  <tr><th align="center">회원전화</th>
      <td align="left"><INPUT TYPE="text" name="phone" SIZE="20" maxlength="13" ></td>
  </tr>      
  <tr><th align="center">회원주소 </th>
      <td align="left"><INPUT TYPE="text" name="address" SIZE="30"> </td>
  </tr>      
  <tr><th align="center">가입일자 </th>
      <td align="left"><INPUT TYPE="Date" name="joindate" SIZE="10"  value="<%=szTdate%>"> </td>
  </tr>      
  <tr><th align="center">고객등급 [A:VIP,B:일반,C:직원]</th>
      <td align="left"><INPUT TYPE="text" name="grade" SIZE="10"> </td> 
  </tr>   
  <tr><th align="center">도시코드</th>
      <td align="left"><INPUT TYPE="text" name="city" SIZE="10" maxlength="13" > </td>
<tr><td colspan="2" style="width:600px">
<input type="button" name="btnInsert" value="등 록" onclick="Insert()">
<input type="button" name="btnQuery" value="조 회" onclick="document.location.href='index.jsp?section=member_list.jsp'">
</td></tr>
</table>
</form>
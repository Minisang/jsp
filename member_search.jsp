<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
function Search(){
	if(Searchf.custno.value==""){
		alert("회원번호를 입력하세요")
		Searchf.custno.focus();
		return false;
	}
		Searchf.action="index.jsp?section=member_search_result.jsp";
		Searchf.submit();

}
</script>
<center>
<form name="Searchf" method="post" action="">
<table border="1">
<tr>
<th align="center" width="200">사원번호 조회</th>
<td align="left"><input type="text" name="custno" size="10" maxlength="10"></td>
</tr>
<tr><td colspan="2" style="width:300px">
<input type="button" name="btnInsert" value="조 회" onclick="Search()">
<input type="button" name="home" value="집으로" onclick="location.href='index.jsp'">
</td>
</tr>
</table>
</form>
</center>
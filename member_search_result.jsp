<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
request.setCharacterEncoding("utf-8");
String szCustno, szCustname, szPhone, szAddress, szJoindate, szCity, szGrade;
int iCnt = 0;
szCustno = request.getParameter("custno");
System.out.println("DB 연결  ---> 1" + szCustno);
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    if (conn != null) {
        System.out.println("DB연결 : success" + "<br>");
    } else {
        System.out.println("DB연결 : fail" + "<br>");
    }
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select custno, custname, phone,address, joindate, grade, city from member_tbl_02 where" +
    "custno=='"+szCustno+"'");
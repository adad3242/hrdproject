<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String orderdate = request.getParameter("orderdate");
String addr = request.getParameter("addr");
String tell = request.getParameter("tell");
String pay = request.getParameter("pay");
String cardno = request.getParameter("cardno");
String prodcount = request.getParameter("prodcount");
String total = request.getParameter("total");
PreparedStatement pstmt=null;
String sql="Insert into order0802 values(?,?,?,?,?,?,?,?,?)";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, name);
pstmt.setString(3, orderdate);
pstmt.setString(4, addr);
pstmt.setString(5, tell);
pstmt.setString(6, pay);
pstmt.setString(7, cardno);
pstmt.setString(8, prodcount);
pstmt.setString(9, total);
pstmt.executeUpdate();
%>
<script>
alert("저장 성공");
</script>


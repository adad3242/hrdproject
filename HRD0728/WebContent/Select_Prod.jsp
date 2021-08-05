<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<%@include file="header.jsp" %>
</header>
<nav>
<%@include file="nav.jsp" %>
</nav>
<section>
<h2>상품 목록</h2>
<%
PreparedStatement pstmt =null;
ResultSet rs = null;
String sql="Select count(*) from product0802";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	int count = rs.getInt(1);

%>
총 <%=count %>개의 상품이 있습니다.
<%} %>
<table border=2 class=tb1>
<tr>
<th class=ip1>상품코드</th>
<th class=ip1>상품분류</th>
<th class=ip1>작성자 이름</th>
<th class=ip1>상품 이름</th>
<th class=ip1>제조사 이름</th>
<th class=ip1>시중 가격</th>
<th class=ip1>판매 가격</th>
<th class=ip1>날짜</th>
<th class=ip1>재고량</th>
<th class=ip1>메모</th>
<th class=ip1>구분</th>
</tr>
<%
pstmt =null;
rs = null;
sql="Select * from product0802";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	String id = rs.getString("id");
	String category = rs.getString("category");
	String wname = rs.getString("wname");
	String pname = rs.getString("pname");
	String sname = rs.getString("sname");
	String price = rs.getString("price");
	String downprice=rs.getString("downprice");
	String inputdate = rs.getString("inputdate");
	String stock = rs.getString("stock");
	String description = rs.getString("description");
	

%>
<tr>
<td><%=id %></td>
<td><%=category %></td>
<td><%=wname %></td>
<td><%=pname %></td>
<td><%=sname %></td>
<td><%=price %></td>
<td><%=downprice %></td>
<td><%=inputdate %></td>
<td><%=stock %></td>
<td><%=description %></td>
<td>수정/삭제</td>
<%} %>
</table>
</section>
<footer>
<%@include file="footer.jsp" %>
</footer>
</body>
</html>
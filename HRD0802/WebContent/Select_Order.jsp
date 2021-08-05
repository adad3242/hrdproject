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
String sql="Select count(*) from order0802";
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
<th class=ip1>주문자이름</th>
<th class=ip1>주문날짜</th>
<th class=ip1>배달주소</th>
<th class=ip1>전화번호</th>
<th class=ip1>결제방법</th>
<th class=ip1>카드번호</th>
<th class=ip1>주문상품수</th>
<th class=ip1>판매가격</th>
<th class=ip1>총금액</th>
<th class=ip1>구분</th>
</tr>
<%
pstmt =null;
rs = null;
sql="Select A.id,A.name,A.orderdate,A.addr,A.tell,A.pay,A.cardno,A.prodcount,A.total,B.downprice from order0802 A, product0802 B where A.ID=B.ID";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	String id = rs.getString("id");
	String name = rs.getString("name");
	String orderdate = rs.getString("orderdate");
	String addr = rs.getString("addr");
	String tell = rs.getString("tell");
	String pay = rs.getString("pay");
	String cardno=rs.getString("cardno");
	String prodcount = rs.getString("prodcount");
	String downprice = rs.getString("downprice");
	String total = rs.getString("total");
	

%>
<tr>
<td><%=id %></td>
<td><%=name %></td>
<td><%=orderdate %></td>
<td><%=addr %></td>
<td><%=tell %></td>
<td><%=pay %></td>
<td><%=cardno %></td>
<td><%=prodcount %></td>
<td><%=downprice %></td>
<td><%=total %></td>
<td>수정/삭제</td>
<%} %>
</table>
</section>
<footer>
<%@include file="footer.jsp" %>
</footer>
</body>
</html>
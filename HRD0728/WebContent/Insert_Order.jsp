<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<% 

String dCode="";

%>

<html>

<head>

<meta charset="UTF-8">

<title>주문정보등록</title>

<link rel="stylesheet" href="common.css">

<script>

function changesubmit(){

document.form.submit();

}


function btn_click(str){

if(str=="insert"){

form.action="Order_Process.jsp";
alert("저장 되었습니다");
history.back();
}

}

</script>

</head>

<body>

<div id=wrap>

<header>

<%@ include file="header.jsp" %>

</header>

<nav>

<%@ include file="nav.jsp" %>

</nav>

<section>

<!-- 내용 시작 -->

<%@ include file="dbconn.jsp" %>

​

<div> 

<%

ResultSet rs = null;

PreparedStatement pstmt = null;

int cnt = 0;

String id=request.getParameter("id");

String name=request.getParameter("name");

String prodcount=request.getParameter("prodcount");

String orderdate=request.getParameter("orderdate");

String addr=request.getParameter("addr");

String pay=request.getParameter("pay");

String tell=request.getParameter("tell");

String cardno=request.getParameter("cardno");

int price=0,total=0,pcount=0;

if(name==null|| name.equals("null")){

name=" ";

}

if(orderdate==null|| orderdate.equals("null")){

orderdate=" ";

}

if(addr==null|| addr.equals("null")){

addr=" ";

}

if(pay==null|| pay.equals("null")){

pay=" ";

}

if(tell==null|| tell.equals("null")){

tell=" ";

}

if(pay.equals("2")){

if(cardno==null|| cardno.equals("null")){

System.out.println("pay : "+pay);

%><script type="text/javascript">alert("카드번호를 입력하세요.")</script>

<%

}}

if(cardno==null|| cardno.equals("null")){

cardno=" ";

}

if(prodcount==null|| prodcount.equals("null")){

pcount=0;

}else{

pcount=Integer.parseInt(prodcount);

}

try {

String sql = "select id,downprice from product0802 where id=?";

pstmt = conn.prepareStatement(sql);

pstmt.setString(1,id);

rs = pstmt.executeQuery();

if (rs.next()) {

id=rs.getString(1);

price = rs.getInt(2);

total=price*pcount;

}else if(id==null|| id.equals("null")){

id="";

}else{

id="";

price=0;

total=0;

%><script type="text/javascript">

alert("등록되지 않은 코드입니다.")

history.back(-1);

</script>

<%

}

}catch(SQLException e){

System.out.println("cnt2 : "+cnt);

out.println("SQLException : "+e.getMessage());

e.printStackTrace();

}

%>

​

<form name=form action="Insert_Order.jsp" method="post">

<h2>주문정보 등록</h2>

<table class="tb1" border="2">

<tr>

​

<th width="30%">상품 코드 </th>

<td height="30px"><input type="text" name="id" id="id" size="30" 

onchange="javascript:changesubmit();" value="<%=id %>"></td>

<%-- <td height="30px"><input type="text" name="id" size="30" onKeyPress="enter();" value="<%=dCode%>" ></td> --%>

​

<th width="30%">주문자 이름</th>

<td height="30px"><input type="text" name="name" size="30" required value="<%=name %>">

</td>

</tr>

​

​

<tr>

<th width="30%">주문 날짜</th>

<td height="30px"><input type="text" name="orderdate" size="30" value="<%=orderdate %>">

</td>

<th width="30%">전화번호</th>

<td height="30px"><input type="text" name="tel" size="30" required value="<%=tell %>">

</td>

</tr>

<tr>

<th width="30%">배달주소</th>

<td height="30px" colspan=3><input type="text" name="addr" size="80" required value="<%=addr %>">

</td>

</tr>

<tr>

<th width="30%">결제방법</th>

<td height="30px"> <input type="radio" name="pay" value="1" 

onchange="javascript:changesubmit();" <% if(pay.equals("1")){%>checked<%}%>> 현금

<input type="radio" name="pay" value="2" 

onchange="javascript:changesubmit();" <% if(pay.equals("2")){%>checked<%}%>> 카드

</td>

<th width="30%">카드번호</th>

<td height="30px"><input type="text" name="cardno" size="30" required value="<%=cardno %>" <% if(pay.equals("1")){%>disabled<%}%>>

</td>

</tr>

​

<tr>

<th width="30%">주문상품수</th>

<td height="30px"><input type="text" name="prodcount" id="prodcount" size="30" value="<%=prodcount %>" onchange="javascript:changesubmit();" required>

</td>

​

<th width="30%">주문금액</th>

<td height="30px"><input type="text" name="total" size="30" value="<%=total %>" >

</td>

</tr>

<tr><td colspan=4>

<div class="btn_group">

<button type="button" onclick="history.back(); return false;">목록</button>

<button type="submit" value="저장" onclick='btn_click("insert");'>저장</button>

</div>

</td>

</tr>

</table>

​

</form>

</div>

</section>

​

<footer>

<%@ include file="footer.jsp" %>

</footer>

</div>

</body>

</html>
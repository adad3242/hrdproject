<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.id.value==""){
		alert("아이디를 입력하세요");
		document.form.id.focus();
	}else if(document.form.category.value==""){
		alert("카테고리를 선택하세요");
		document.form.category.focus();
	}else{
		
		document.form.submit();
	}
}
</script>
</head>
<body>
<header>
<%@include file="header.jsp" %>
</header>
<nav>
<%@include file="nav.jsp" %>
</nav>
<section>
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
int cnt=0;

	String sql="select prod_seq.nextval from dual";
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt = rs.getInt(1);
	


%>
<h2>상품 추가</h2>
<form name=form method=post action=Process_Product.jsp>
<table class=tb1 border=2 height=80% width=60%>
<tr>
<th>상품코드</th>
<td><input type=text name=id value=<%=cnt %>>
<%} %>
<th>상품분류</th>
<td><select name=category>
<option value="">상품분류</option>
<option value="가구">가구</option>
<option value="전기/전자">전기/전자</option>
<option value="부엌용품">부엌용품</option>
<option value="의류">의류</option>
<option value="보석및 액새서리">보석및 액새서리</option>
<option value="헬스기구">헬스기구</option>
<option value="컴퓨터 관련">컴퓨터 관련</option>
<option value="기타">기타</option>
</select>
</td></tr>
<tr>
<th>작성자 이름</th>
<td><input type=text name=wname></td>
<th>상품이름</th>
<td><input type=text name=pname></td>
</tr>
<tr>
<th>제조사이름</th>
<td colspan=3><input type=text name=sname></td>
</tr>
<tr>
<th>시중가격</th>
<td><input type=text name=price></td>
<th>판매가격</th>
<td><input type=text name=downprice></td>
</tr>
<tr>
<th>날짜</th>
<td><input type=text name=inputdate></td>
<th>재고량</th>
<td><input type=text name=stock></td>
</tr>
<tr>
<th>메모</th>
<td colspan=3><textarea name="description" cols="80" rows="8" ></textarea></td>
</tr>
<tr>
<td colspan=4>
<input type=button value=등록 onclick="javascript:check()">
<input type=reset value=취소>
</td>
</tr>
</table>
</form>
</section>
<footer>
<%@include file="footer.jsp" %>
</footer>
</body>
</html>
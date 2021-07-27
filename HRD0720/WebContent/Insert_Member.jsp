<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "dbconn.jsp" %>
<script>

function check(){
	if(document.form.id.value==""){
		alert("아이디를 입력하세요.");
		document.form.id.focus();
	}else if(document.form.name.value==""){
		alert("이름을 입력하세요.");
		document.form.name.focus();
	}else if(document.form.password.value==""){
		alert("비밀번호를 입력하세요.");
		document.form.password.focus();
	}else{
		document.form.submit();
	}
	
}

</script>
</head>
<body>
<header>
<%@ include file = "Header.jsp" %>
</header>
<nav>
<%@ include file = "Nav.jsp" %>

</nav>
<section>
<h2>회원 정보 등록 화면</h2>
<form name="form" method=post action="Process_Member.jsp">
<table width=80% height=80% border=2>

<tr>
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
String sql="select max(id) from member0720";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
int id=0;
while(rs.next()){
	id=rs.getInt(1)+1;


%>
<th>아이디</th>
<td><input type=text name=id value=<%=id %>></td>
</tr>
<%} %>
<tr>
<th>이름</th>
<td><input type=text name=name></td>
</tr>
<tr>
<th>비밀번호</th>
<td><input type=password name=password></td>
</tr>
<tr>
<th>성별</th>
<td><input type=radio name=gender value=남성>남
<input type=radio name=gender value=여성>여</td>
</tr>
<tr>
<th>생년월일</th>
<td><input type=text name=birth></td>
</tr>
<tr>
<th>이메일</th>
<td><input type=text name=email1>@<select name=email2>
<option value=naver.com>naver.com</option>
<option value=kor.com>kor.com</option>
<option value=google.co.kr>google.co.kr</option>
<option value=hanmail.net>hanmail.net</option>
</select></td>
</tr>
<tr>
<th>핸드폰</th>
<td><select name=phone1>
<option value=010>010</option>
<option value=011>011</option>
<option value=017>017</option>
<option value=018>018</option>
</select>-<input type=text name=phone2>-<input type=text name=phone3>
</td>
</tr>
<tr>
<th>주소</th>
<td><input type=text name=address></td>
</tr>
<tr>
<th>닉네임</th>
<td><input type=text name=nickname></td>
</tr>
<tr>
<td colspan=2><input type=button value="회원등록" onclick="javascript:check()">
<input type=reset value="다시작성"></td>
</tr>
</table>
</form>
</section>
<footer>
<%@ include file = "Footer.jsp" %>
</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
try{
	request.setCharacterEncoding("UTF-8");

String id=request.getParameter("id");
String name=request.getParameter("name");
String passwd=request.getParameter("password");
String gender=request.getParameter("gender");
String birth=request.getParameter("birth");
String mail=request.getParameter("email1")+"@"+request.getParameter("email2");
String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
String address=request.getParameter("address");
String nickname=request.getParameter("nickname");

PreparedStatement pstmt = null;
String sql="insert into member0720 values(?,?,?,?,?,?,?,?,?)";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, passwd);
pstmt.setString(3, name);
pstmt.setString(4, gender);
pstmt.setString(5, birth);
pstmt.setString(6, mail);
pstmt.setString(7, phone);
pstmt.setString(8, address);
pstmt.setString(9, nickname);
pstmt.executeUpdate();
System.out.print("저장 성공");
}catch(SQLException e){
	e.printStackTrace();
	System.out.print("저장 실패");
}
%>
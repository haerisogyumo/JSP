<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	int bookId  = Integer.parseInt(request.getParameter("bookId"));
	String bookName = request.getParameter("bookName");
	String publisher   = request.getParameter("publisher");
	int price  = Integer.parseInt( request.getParameter("price"));
	
	// 데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/java1_bookstore";
	String user = "root";
	String pass = "1234";
	
	try{
		// 1단계
		Class.forName("com.mysql.cj.jdbc.Driver");
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		// 3단계
		String sql = "INSERT INTO `book` VALUES (?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setInt(1, bookId);
		psmt.setString(2, bookName);
		psmt.setString(3, publisher);
		psmt.setInt(4, price);
		// 4단계
		psmt.executeUpdate();
		// 5단계
		// 6단계
		psmt.close();
		conn.close();		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	response.sendRedirect("./register.jsp");	
%>
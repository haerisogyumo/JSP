
<%@page import="config.JDBC"%>
<%@page import="bean.BookBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String bookId = request.getParameter("bookId");

	BookBean bb = null;
	
	try{
		Connection conn = JDBC.getInstance().getConnection();
		// 2단계
		// 3단계
	 	Statement stmt = conn.createStatement();
		// 4단계
		ResultSet rs = stmt.executeQuery("SELECT * FROM `book` WHERE `bookId`='"+bookId+"'");
		// 5단계
		bb = new BookBean();
		if(rs.next()){
			bb.setBookId(rs.getInt(1));
			bb.setBookName(rs.getString(2));
			bb.setPublisher(rs.getString(3));
			bb.setPrice(rs.getInt(4));
		}
		
		// 6단계
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>도서수정</title>
	</head>
	<body>
		<h3>도서수정</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">도서목록</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>도서번호</td>
					<td><input type="number" name="bookId" readonly value="<%= bb.getBookId() %>"/></td>
				</tr>
				<tr>
					<td>도서명</td>
					<td><input type="text" name="bookName" value="<%= bb.getBookName() %>"/></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="publisher" value="<%= bb.getPublisher() %>"/></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="price" value="<%= bb.getPrice() %>"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기"/>
					</td>
				</tr>			
			</table>	
		</form>
	</body>
</html>
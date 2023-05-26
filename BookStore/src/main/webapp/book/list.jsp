<%@page import="kr.co.jboard1.db.JDBC"%>
<%@page import="bean.BookBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<BookBean> books = null; // for문에서 참조할 수 있기 위해 try에서 빼서 선언
try{
	
	Connection conn = JDBC.getInstance().getConnection();
	// 3단계
	Statement stmt = conn.createStatement();
	// 4단계
	String sql = "SELECT * FROM `book`";
	ResultSet rs = stmt.executeQuery(sql);
	// 5단계
    // null인 users를 ArrayList로 초기화
	
    books = new ArrayList<>();
	while(rs.next()){
		
		BookBean bb = new BookBean();
		bb.setBookId(rs.getInt(1));
		bb.setBookName(rs.getString(2));
		bb.setPublisher(rs.getString(3));
		bb.setPrice(rs.getInt(4));
		
		books.add(bb); // list에 넣기
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
		<title>user::list</title>
	</head>
	<body>
		<h3>도서목록</h3>
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">도서등록</a>
		<table border="1">
			<tr>
				<td>도서번호</td>
				<td>도서명</td>
				<td>출판사</td>
				<td>가격</td>
				<td>관리</td>
			</tr>
			<% for(BookBean bb : books){ %>
			<tr>
				<td><%=bb.getBookId() %></td>
				<td><%=bb.getBookName() %></td>
				<td><%=bb.getPublisher() %></td>
				<td><%=bb.getPrice() %></td>
				<td>
					<a href="./modify.jsp?bookId=<%=bb.getBookId() %>">수정</a>
					<a href="./delete.jsp?bookId=<%=bb.getBookId() %>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>

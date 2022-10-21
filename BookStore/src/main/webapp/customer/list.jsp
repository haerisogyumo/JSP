<%@page import="bean.CustomerBean"%>
<%@page import="config.JDBC"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<CustomerBean> customers = null; // for문에서 참조할 수 있기 위해 try에서 빼서 선언
try{
	
	Connection conn = JDBC.getInstance().getConnection();
	// 3단계
	Statement stmt = conn.createStatement();
	// 4단계
	String sql = "SELECT * FROM `customer`";
	ResultSet rs = stmt.executeQuery(sql);
	// 5단계
    // null인 users를 ArrayList로 초기화
	
    customers = new ArrayList<>();
	while(rs.next()){
		
		CustomerBean cb = new CustomerBean();
		cb.setCustId(rs.getInt(1));
		cb.setName(rs.getString(2));
		cb.setAddress(rs.getString(3));
		cb.setPhone(rs.getString(4));
		
		customers.add(cb); // list에 넣기
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
		<title>customer list</title>
	</head>
	<body>
		<h3>고객목록</h3>
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">고객등록</a>
		<table border="1">
			<tr>
				<td>고객번호</td>
				<td>고객명</td>
				<td>주소</td>
				<td>휴대폰</td>
				<td>관리</td>
			</tr>
			<% for(CustomerBean cb : customers){ %>
			<tr>
				<td><%=cb.getCustId() %></td>
				<td><%=cb.getName() %></td>
				<td><%=cb.getAddress() %></td>
				<td><%=cb.getPhone() %></td>
				<td>
					<a href="./modify.jsp?custId=<%=cb.getCustId() %>">수정</a>
					<a href="./delete.jsp?custId=<%=cb.getCustId() %>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>

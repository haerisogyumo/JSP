<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% 
List<CustomerBean> customers = null; // for문에서 참조할 수 있기 위해 try에서 빼서 선언
try{
	
	Connection conn = DBCP.getConnection();
	// 3단계
	Statement stmt = conn.createStatement();
	// 4단계
	String sql = "SELECT * FROM `customer`";
	ResultSet rs = stmt.executeQuery(sql);
	// 5단계
	
    customers = new ArrayList<>();
	while(rs.next()){
		
		CustomerBean cb = new CustomerBean();
		cb.setCustid(rs.getString(1));
		cb.setName(rs.getString(2));
		cb.setHp(rs.getString(3));
		cb.setAddr(rs.getString(4));
		cb.setRdate(rs.getString(5));
		
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
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>휴대폰</td>
				<td>주소</td>
				<td>가입일</td>
			</tr>
			<% for(CustomerBean cb : customers){ %>
			<tr>
				<td><%=cb.getCustid() %></td>
				<td><%=cb.getName() %></td>
				<td><%=cb.getHp() %></td>
				<td><%=cb.getAddr() %></td>
				<td><%=cb.getRdate() %></td>
			</tr>
			<%} %>
		</table>
	</body>
</html>

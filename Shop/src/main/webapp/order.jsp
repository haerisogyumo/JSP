<%@page import="bean.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% 
List<OrderBean> orders = null; // for문에서 참조할 수 있기 위해 try에서 빼서 선언
try{
	
	Connection conn = DBCP.getConnection();
	// 3단계
	Statement stmt = conn.createStatement();
	// 4단계
	String sql = "SELECT a.*, b.`name`, c.`prodName` ";
				sql += "FROM `order` AS a ";
				sql += "JOIN `customer` AS b ON a.orderId = b.custId ";
				sql += "JOIN `product` AS c ON a.orderProduct = c.prodNo; ";
	ResultSet rs = stmt.executeQuery(sql);
	// 5단계
	
    orders = new ArrayList<>();
	while(rs.next()){
		
		OrderBean ob = new OrderBean();
		ob.setOrderNo(rs.getInt(1));
		ob.setOrderId(rs.getString(2));
		ob.setOrderProduct(rs.getInt(3));
		ob.setOrderCount(rs.getInt(4));
		ob.setOrderDate(rs.getString(5));
		ob.setName(rs.getString(6));
		ob.setProdName(rs.getString(7));
		
		orders.add(ob); // list에 넣기
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
		<title>order list</title>
	</head>
	<body>
		<h3>주문목록</h3>
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		<table border="1">
			<tr>
				<td>주문번호</td>
				<td>주문자</td>
				<td>주문상품</td>
				<td>주문수량</td>
				<td>주문일</td>
			</tr>
			<% for(OrderBean ob : orders){ %>
			<tr>
				<td><%=ob.getOrderNo() %></td>
				<td><%=ob.getName() %></td>
				<td><%=ob.getProdName() %></td>
				<td><%=ob.getOrderCount() %></td>
				<td><%=ob.getOrderDate().substring(0, 16) %></td>
			</tr>
			<%} %>
		</table>
	</body>
</html>

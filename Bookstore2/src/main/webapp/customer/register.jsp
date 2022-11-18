<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객등록</title>
</head>
<body>

	<h1>고객등록</h1>
	<a href="/Bookstore2/index.do">처음으로</a>
	<a href="/Bookstore2/customer/list.do">고객목록</a>
	
	<form action="/Bookstore2/customer/register.do" method="post">
		<table border="1">
			<tr>
				<td>고객번호</td>
				<td><input type="number" name="custId"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit"  value="등록">
				</td>
			</tr>
		</table>
	</form>
	

</body>
</html>
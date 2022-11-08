<%@page import="bean.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	List<StudentBean> students = null;
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM `student`";
		ResultSet rs = stmt.executeQuery(sql);
		
		students = new ArrayList<>();
		while(rs.next()){
			
			StudentBean sb = new StudentBean();
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));

			students.add(sb);
		}
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
		<title>학생관리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    	<script>
    	
    	$(function(){
	    	$('.btnRg').click(function(){
	    		$('.registArea').show();
	    	});
	    	
	    	$('.btnClose').click(function(){
	    		$('.registArea').hide();
	    	});
	    	
		    	// 최종 등록하기 버튼
		    	$('input[type=submit]').click(function(){
		    		
		    		let stdNo 		= $('input[name=stdNo]').val();
		    		let stdName 	= $('input[name=stdName]').val();
		    		let stdHp		= $('input[name=stdHp]').val();
		    		let stdYear 	= $('input[name=stdYear]').val();
		    		let stdAddress 	= $('input[name=stdAddress]').val();
		    		
		    		
		    		let jsonData = {
		    				"stdNo"			: stdNo,
		    				"stdName"		: stdName,
		    				"stdHp"			: stdHp,
		    				"stdYear"		: stdYear,
		    				"stdAddress"	: stdAddress
		    		};
		    		
		    		console.log('jsonData: ' + jsonData);
		    		
		    		$.ajax({
		    			url: './proc/StudentProc.jsp',
		    			type: 'POST',
		    			data: jsonData,
		    			dataType: 'json',
		    			success:function(data){
		    				if(data.result == 1){
		    					alert('등록완료!');
		    				}else{
		    					alert('등록실패!');
		    				}
		    				
		    			}
		    		});
		    	});
	    	});
		    	
	    	
    	
    	</script>
	</head>
	<body>
	<h2>학생관리</h2>
	
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
	<h3>학생목록</h3>
		<button class="btnRg">등록</button>
		<table border="1">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>휴대폰</td>
				<td>학년</td>
				<td>주소</td>
			</tr>
			<% for(StudentBean lb : students){ %>
			<tr>
				<td><%=lb.getStdNo() %></td>
				<td><%=lb.getStdName() %></td>
				<td><%=lb.getStdHp() %></td>
				<td><%=lb.getStdYear() %></td>
				<td><%=lb.getStdAddress() %></td>
			</tr>
			<%} %>
		</table>
		
		<div class="registArea" style="display: none" >
			<h3>학생등록</h3>
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="stdNo"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="stdName"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="stdHp"/></td>
				</tr>
				<tr>
					<td>학년</td>
					<td><input type="text" name="stdYear"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="stdAddress"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="추가"/></td>
				</tr>
			</table>
			
		</div>
		
	</body>
</html>
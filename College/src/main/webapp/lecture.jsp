<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.LectureBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% 
List<LectureBean> lectures = null;
try{
	Connection conn = DBCP.getConnection();
	// 3단계
	Statement stmt = conn.createStatement();
	// 4단계
	String sql = "SELECT * FROM `lecture`";
	ResultSet rs = stmt.executeQuery(sql);
	// 5단계
	
    lectures = new ArrayList<>();
	while(rs.next()){
		
		LectureBean lb = new LectureBean();
		lb.setLecNo(rs.getInt(1));
		lb.setLecName(rs.getString(2));
		lb.setLecCredit(rs.getInt(3));
		lb.setLecTime(rs.getInt(4));
		lb.setLecClass(rs.getString(5));
		
		lectures.add(lb);
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
		<title>강좌관리</title>
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
		    		
		    		let lecNo 		= $('input[name=lecNo]').val();
		    		let lecName 	= $('input[name=lecName]').val();
		    		let lecCredit	= $('input[name=lecCredit]').val();
		    		let lecTime 	= $('input[name=lecTime]').val();
		    		let lecClass 	= $('input[name=lecClass]').val();
		    		
		    		
		    		let jsonData = {
		    				"lecNo"		: lecNo,
		    				"lecName"	: lecName,
		    				"lecCredit"	: lecCredit,
		    				"lecTime"	: lecTime,
		    				"lecClass"	: lecClass
		    		};
		    		
		    		console.log('jsonData: ' + jsonData);
		    		
		    		$.ajax({
		    			url: './proc/LectureProc.jsp',
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
	<h2>강좌관리</h2>
	
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
	<h3>강좌현황</h3>
		<button class="btnRg">등록</button>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>강좌명</td>
				<td>학점</td>
				<td>시간</td>
				<td>강의장</td>
			</tr>
			<% for(LectureBean lb : lectures){ %>
			<tr>
				<td><%=lb.getLecNo() %></td>
				<td><%=lb.getLecName() %></td>
				<td><%=lb.getLecCredit() %></td>
				<td><%=lb.getLecTime() %></td>
				<td><%=lb.getLecClass() %></td>
			</tr>
			<%} %>
		</table>
		
		<div class="registArea" style="display: none" >
			<h3>강좌등록</h3>
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="lecNo"/></td>
				</tr>
				<tr>
					<td>강좌명</td>
					<td><input type="text" name="lecName"/></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="text" name="lecCredit"/></td>
				</tr>
				<tr>
					<td>시간</td>
					<td><input type="text" name="lecTime"/></td>
				</tr>
				<tr>
					<td>강의장</td>
					<td><input type="text" name="lecClass"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="추가"/></td>
				</tr>
			</table>
			
		</div>
		
	</body>
</html>
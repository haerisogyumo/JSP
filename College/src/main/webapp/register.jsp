<%@page import="bean.RegisterBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.LectureBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% 
List<RegisterBean> registers = null;
try{
	Connection conn = DBCP.getConnection();
	// 3단계
	Statement stmt = conn.createStatement();
	// 4단계
	String sql = "SELECT * FROM `register`";
	ResultSet rs = stmt.executeQuery(sql);
	// 5단계
	
    registers = new ArrayList<>();
	while(rs.next()){
		
		RegisterBean rb = new RegisterBean();
		rb.setStdNo(rs.getInt(1));
		rb.setStdName(rs.getString(2));
		rb.setLecName(rs.getString(3));
		rb.setLecNo(rs.getInt(4));
		rb.setRegMidScore(rs.getInt(5));
		rb.setRegFinalScore(rs.getInt(6));
		rb.setRegTotalScore(rs.getInt(7));
		rb.setRegGrade(rs.getString(8));
		

		registers.add(rb);
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
		<title>수강관리</title>
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
		    		
		    		let stdNo 			= $('input[name=stdNo]').val();
		    		let stdName 		= $('input[name=stdName]').val();
		    		let lecName			= $('input[name=lecName]').val();
		    		let lecNo 			= $('input[name=lecNo]').val();
		    		let regMidScore 	= $('input[name=regMidScore]').val();
		    		let regFinalScore 	= $('input[name=regFinalScore]').val();
		    		let regTotalScore 	= $('input[name=regTotalScore]').val();
		    		let regGrade 		= $('input[name=regGrade]').val();
		    		
		    		
		    		let jsonData = {
		    				"stdNo"			: stdNo,
		    				"stdName"		: stdName,
		    				"lecName"		: lecName,
		    				"lecNo"			: lecNo,
		    				"regMidScore"	: regMidScore,
		    				"regFinalScore"	: regFinalScore,
		    				"regTotalScore"	: regTotalScore,
		    				"regGrade"		: regGrade
		    		};
		    		
		    		console.log('jsonData: ' + jsonData);
		    		
		    		$.ajax({
		    			url: './proc/RegisterProc.jsp',
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
	<h2>수강관리</h2>
	
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
	<h3>수강현황</h3>
		<input type="text" name=stdNo/>
		<button class="search">검색</button>
		<button class="btnRg">수강신청</button>
		<table border="1">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>강좌명</td>
				<td>강좌코드</td>
				<td>중간시험</td>
				<td>기말시험</td>
				<td>총점</td>
				<td>등급</td>
			</tr>
			<% for(RegisterBean rb : registers){ %>
			<tr>
				<td><%=rb.getStdNo() %></td>
				<td><%=rb.getStdName() %></td>
				<td><%=rb.getLecName() %></td>
				<td><%=rb.getLecNo() %></td>
				<td><%=rb.getRegMidScore() %></td>
				<td><%=rb.getRegFinalScore() %></td>
				<td><%=rb.getRegTotalScore() %></td>
				<td><%=rb.getRegGrade() %></td>
			</tr>
			<%} %>
		</table>
		
		<div class="registArea" style="display: none" >
			<h3>수강신청</h3>
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
					<td>강좌명</td>
					<td><input type="text" name="lecName"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="신청"/></td>
				</tr>
			</table>
			
		</div>
		
	</body>
</html>
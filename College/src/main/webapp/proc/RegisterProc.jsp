<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	String 	stdNo 			= request.getParameter("stdNo");
	String 	stdName 		= request.getParameter("stdName");
	String	lecName 		= request.getParameter("lecName");
	String 	lecNo 			= request.getParameter("lecNo");
	String 	regMidScore 	= request.getParameter("regMidScore");
	String 	regFinalScore 	= request.getParameter("regFinalScore");
	String 	regTotalScore 	= request.getParameter("regTotalScore");
	String 	regGrade 		= request.getParameter("regGrade");
	int result = 0;

	
	try{
		Connection conn = DBCP.getConnection();
		String sql = "insert into `lecture` (`stdNo`, `stdName`, `lecName`, `lecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`) ";
			   sql += "values (?, ?, ?, ?, ?, ?, ?, ?)";
			   
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, stdNo);
		psmt.setString(2, stdName);
		psmt.setString(3, lecName);
		psmt.setString(4, lecNo);
		psmt.setString(5, regMidScore);
		psmt.setString(6, regFinalScore);
		psmt.setString(7, regTotalScore);
		psmt.setString(8, regGrade);
		
		result = psmt.executeUpdate();
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	
	// JSON 출력
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		String jsonData = json.toString();
		out.print(jsonData);
	
%>
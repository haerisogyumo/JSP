<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%

	//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid 		= request.getParameter("uid");
	String pass		= request.getParameter("pass1");
	String name		= request.getParameter("name");
	String nick		= request.getParameter("nick");
	String email	= request.getParameter("email");
	String hp		= request.getParameter("hp");
	String zip		= request.getParameter("zip");
	String addr1	= request.getParameter("addr1");
	String addr2	= request.getParameter("addr2");
	String regip	= request.getRemoteAddr(); // 클라이언트 IP 주소
	
	
	
	// 데이터베이스 작업
	
			UserDAO dao = UserDAO.getInsatance();
		
	
		
		// 리다이렉트
		response.sendRedirect("../login.jsp");	
	
	

%>
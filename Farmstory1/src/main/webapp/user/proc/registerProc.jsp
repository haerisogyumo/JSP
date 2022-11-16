<%@page import="kc.co.farmstory1.dao.UserDao"%>
<%@page import="kc.co.farmstory1.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	String uid	 = request.getParameter("uid");
	String pass	 = request.getParameter("pass1");
	String name	 = request.getParameter("name");
	String nick	 = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");	
	String regip = request.getRemoteAddr();
	
	UserBean ub = new UserBean();
	ub.setUid(uid);
	ub.setPass(pass);
	ub.setName(name);
	ub.setNick(nick);
	ub.setEmail(email);
	ub.setHp(hp);
	ub.setZip(zip);
	ub.setAddr1(addr1);
	ub.setAddr2(addr2);
	ub.setRegip(regip);

	UserDao.getInstance().insertUser(ub);
	
	response.sendRedirect("../login.jsp");

%>
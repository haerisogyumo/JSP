<%@page import="kc.co.farmstory1.dao.ArticleDao"%>
<%@page import="kc.co.farmstory1.bean.ArticleBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group   = request.getParameter("group");
	String cate    = request.getParameter("cate");
	String uid     = request.getParameter("uid");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	String regip   = request.getRemoteAddr();
	
	ArticleBean ab = new ArticleBean();
	ab.setCate(cate);
	ab.setTitle(title);
	ab.setContent(content);
	ab.setFile(0);
	ab.setUid(uid);
	ab.setRegip(regip);
	
	ArticleDao.getInstance().insertArticle(ab);
	response.sendRedirect("/Farmstory1/board/list.jsp?group="+group+"&cate="+cate);
%>
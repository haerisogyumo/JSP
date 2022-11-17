<%@page import="com.google.gson.Gson"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page language="java" contentType="application/json; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	String cate = request.getParameter("cate");

	List<ArticleBean> latests =  ArticleDao.getInstance().selectLatest(cate);

	Gson gson = new Gson();
	String jsonData = gson.toJson(latests);
	
	out.print(jsonData);



%>
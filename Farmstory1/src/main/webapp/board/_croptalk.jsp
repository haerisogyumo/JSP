<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String cate = request.getParameter("cate");
%>
        <div id="sub">
            <div><img src="../img/sub_top_tit3.png" alt="CROPTALK"></div>
            <section class="cate3">
                <aside>
                    <img src="../img/sub_aside_cate3_tit.png" alt="���۹��̾߱�"/>

                    <ul class="lnb">
                        <li class="<%= cate.equals("story") ? "on":"off" %>"><a href="./list.jsp?group=croptalk&cate=story">���۹��̾߱�</a></li>
                        <li class="<%= cate.equals("grow") ? "on":"off" %>"><a href="./list.jsp?group=croptalk&cate=grow">�Թ簡�ٱ�</a></li>
                        <li class="<%= cate.equals("school") ? "on":"off" %>"><a href="./list.jsp?group=croptalk&cate=school">�ͳ��б�</a></li>
                    </ul>
                </aside>
              <article>
                    <nav>
                        <img src="../img/sub_nav_tit_cate3_<%=cate%>.png" alt="��������"/>
                        <p>
                            HOME > ���۹��̾߱� > 
                            <% if(cate.equals("story")){ %>
                            <em>���۹��̾߱�</em>
                            <% }else if(cate.equals("grow")){ %>
                            <em>�Թ簡�ٱ�</em>
                            <% }else if(cate.equals("school")){ %>
                            <em>�ͳ��б�</em>
							<% } %>
                        </p>
                    </nav>
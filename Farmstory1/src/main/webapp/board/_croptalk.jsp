<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String cate = request.getParameter("cate");
%>
        <div id="sub">
            <div><img src="../img/sub_top_tit3.png" alt="CROPTALK"></div>
            <section class="cate3">
                <aside>
                    <img src="../img/sub_aside_cate3_tit.png" alt="≥Û¿€π∞¿Ãæﬂ±‚"/>

                    <ul class="lnb">
                        <li class="<%= cate.equals("story") ? "on":"off" %>"><a href="./list.jsp?group=croptalk&cate=story">≥Û¿€π∞¿Ãæﬂ±‚</a></li>
                        <li class="<%= cate.equals("grow") ? "on":"off" %>"><a href="./list.jsp?group=croptalk&cate=grow">≈‘πÁ∞°≤Ÿ±‚</a></li>
                        <li class="<%= cate.equals("school") ? "on":"off" %>"><a href="./list.jsp?group=croptalk&cate=school">±Õ≥Û«–±≥</a></li>
                    </ul>
                </aside>
              <article>
                    <nav>
                        <img src="../img/sub_nav_tit_cate3_<%=cate%>.png" alt="∞¯¡ˆªÁ«◊"/>
                        <p>
                            HOME > ≥Û¿€π∞¿Ãæﬂ±‚ > 
                            <% if(cate.equals("story")){ %>
                            <em>≥Û¿€π∞¿Ãæﬂ±‚</em>
                            <% }else if(cate.equals("grow")){ %>
                            <em>≈‘πÁ∞°≤Ÿ±‚</em>
                            <% }else if(cate.equals("school")){ %>
                            <em>±Õ≥Û«–±≥</em>
							<% } %>
                        </p>
                    </nav>
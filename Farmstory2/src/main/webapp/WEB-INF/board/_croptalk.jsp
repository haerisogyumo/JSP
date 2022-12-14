<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub">
    <div> <img src="/Farmstory2/img/sub_top_tit3.png" alt="CROP TALK"></div>
    <section class="cate3">
        <aside>
            <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기"/>

            <ul class="lnb">
                <li class="${cate.equals('story') ? 'on' : 'off'}">
                    <a href="/Farmstory2/board/list.do?group=story&cate=story"></a>
                </li>
                <li class="${cate.equals('story2') ? 'on' : 'off'}">
                    <a href="/Farmstory2/board/list.do?group=story&cate=story2"></a>
                </li>
                <li class="${cate.equals('story3') ? 'on' : 'off'}">
                    <a href="/Farmstory2/board/list.do?group=story&cate=story3"></a>
                </li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="/Farmstory2/img/sub_nav_tit_cate3_${cate}.png" alt="농작물이야기">
                 <p>
                    HOME > 농작물이야기 > 
                    <c:choose>
	                    <c:when test="${cate.equals('story')}">
	                    <em>농작물이야기</em>
	                    </c:when>
	                    <c:when test="${cate.equals('story2')}">
	                    <em>텃밭가꾸기</em>
	                    </c:when>
	                    <c:when test="${cate.equals('story3')}">
	                    <em>귀농학교</em>
	                    </c:when>
                    </c:choose>
            </nav>

<%@page import="kc.co.farmstory1.dao.TermsDao"%>
<%@page import="java.util.List"%>
<%@page import="kc.co.farmstory1.dao.UserDao"%>
<%@page import="kc.co.farmstory1.bean.TermsBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<String> ts = TermsDao.getInstance().selectTerms();
%>
<%@ include file="../_header.jsp" %>
            <main id="user" class="terms">
                <table border="0">
                    <caption>사이트 이용약관</caption>
                    <tr>
                        <td>
                            <textarea class="terms" readonly><%= ts.get(0) %></textarea>
                            <label><input type="checkbox" class="terms">&nbsp;동의합니다</label>
                        </td>
                    </tr>
                </table>

                <table border="0">
                    <caption>개인정보 취급방침</caption>
                    <tr>
                        <td>
                            <textarea class="privacy"><%= ts.get(1) %></textarea>
                            <label><input type="checkbox" class="privacy">&nbsp;동의합니다</label>
                        </td>
                    </tr>
                </table>
                
                <p>
                    <a href="./login.jsp" class="cancel">취소</a>
                    <a href="./register.jsp" class="next">다음</a>
                </p>


            </main>
<%@ include file="../_footer.jsp" %>
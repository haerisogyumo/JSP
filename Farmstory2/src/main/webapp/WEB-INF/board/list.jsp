<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script type="text/javascript" src="/Farmstory2/board/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];

			<main id="board" class="list">
			    <table border="0">
			        <caption>글목록</caption>
			        <tr>
			            <th>번호</th>
			            <th>제목</th>
			            <th>글쓴이</th>
			            <th>날짜</th>
			            <th>조회</th>
			        </tr>
			        <c:forEach var="article" items="${articles}">
			        <tr>
			            <td>${pageStartNum = pageStartNum - 1}</td>
			            <td><a href="./view.do">${article.title}[${article.comment}]</a></td>
			            <td>${article.nick}</td>
			            <td>${article.rdate.substring(2, 10)}</td>
			            <td>${article.hit}</td>
			        </tr>
			        </c:forEach>            
			    </table>
			
			    <div class="page">
		        	<c:if test="${pageGroupStart > 1}">
		            <a href="/JBoard2/list.do?pg=${pageGroupStart - 1}$search={search}" class="prev">이전</a>
		            </c:if>
		            <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
		            <a href="/JBoard2/list.do?pg=${num}$search={search}" class="num ${num == currentPage ? 'current':'off'}">${num}</a>
		            </c:forEach>
		            <c:if test="${pageGroupEnd < lastPageNum}">
		            <a href="/JBoard2/list.do?pg=${pageGroupEnd + 1}$search={search}" class="next">다음</a>
		            </c:if>
		        </div>
			    <a href="/JBoard2/write.do" class="btn btnWrite">글쓰기</a>
			</main>
		</article>
    </section>
</div>
<jsp:include page="/WEB-INF/_footer.jsp"/>
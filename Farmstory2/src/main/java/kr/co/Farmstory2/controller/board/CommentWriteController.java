package kr.co.Farmstory2.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Farmstory2.dao.ArticleDAO;
import kr.co.Farmstory2.service.ArticleService;
import kr.co.Farmstory2.vo.ArticleVO;

@WebServlet("/board/view.do")
public class CommentWriteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수신
				String no = req.getParameter("no");
				String pg = req.getParameter("pg");
				String group = req.getParameter("group");
				String cate = req.getParameter("cate");
				
				// DAO 객체 생성
				ArticleDAO dao = ArticleDAO.getInstance();
				// 글 조회수 1+
				dao.updateArticleHit(no);
				// 글 가져오기
				ArticleVO article = service.selectArticle(no);
				// 댓글 가져오기
				List<ArticleVO> comments = dao.selectComments(no);
				
				req.setAttribute("no", no);
				req.setAttribute("pg", pg);
				req.setAttribute("group", group);
				req.setAttribute("cate", cate);
				req.setAttribute("article", article);
				req.setAttribute("comments", comments);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/board/view.jsp");
				dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	

}

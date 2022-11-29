package kr.co.Farmstory2.controller.user;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Farmstory2.dao.UserDAO;
import kr.co.Farmstory2.vo.UserVO;

@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uid = req.getParameter("uid");
		String pass1 = req.getParameter("pass1");
		String pass2 = req.getParameter("pass2");
		String name = req.getParameter("name");
		String nick = req.getParameter("nick");
		String email = req.getParameter("email");
		String hp = req.getParameter("hp");
		String zip = req.getParameter("zip");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String regip = req.getRemoteAddr();
		
		// VO 데이터 생성
		UserVO vo = new UserVO();
		vo.setUid(uid);
		vo.setPass(pass2);
		vo.setName(name);
		vo.setNick(nick);
		vo.setEmail(email);
		vo.setHp(hp);
		vo.setZip(zip);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setRegip(zip);
		
		//데이터베이스처리
		UserDAO.getInstance().insertUser(vo);
		
		//리다이렉트
		resp.sendRedirect("/Farmstory2/user/login.do");
	
	}
}
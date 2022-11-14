package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.co.jboard1.bean.UserBean;
import kr.co.jboard1.db.DBCP;
import kr.co.jboard1.db.Sql;

public class UserDAO {
	
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInsatance() {
		return instance;
	}
	private UserDAO() {}
	
	// 기본 CRUD
		public void insertUser(UserBean ub) {
			try{
				Connection conn = DBCP.getConnection();
				
				   PreparedStatement psmt =  conn.prepareStatement(Sql.INSERT_USER);
				   psmt.setString(1, ub.getUid());
				   psmt.setString(2, ub.getPass());
				   psmt.setString(3, ub.getName());
				   psmt.setString(4, ub.getNick());
				   psmt.setString(5, ub.getEmail());
				   psmt.setString(6, ub.getHp());
				   psmt.setString(7, ub.getZip());
				   psmt.setString(8, ub.getAddr1());
				   psmt.setString(9, ub.getAddr2());
				   psmt.setString(10, ub.getRegip());
				   
					   
					   psmt.executeUpdate();
					   
						psmt.close();
						conn.close();	
					
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		public void selectUser() {}
		public void selectUsers() {}
		public void updateUser() {}
		public void deleteUser() {}
	

}

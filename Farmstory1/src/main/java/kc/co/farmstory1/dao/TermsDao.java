package kc.co.farmstory1.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kc.co.farmstory1.db.DBCP;
import kc.co.farmstory1.db.Sql;

public class TermsDao {
	
	
	private static TermsDao instance = new TermsDao();
	public static TermsDao getInstance () {
		return instance;
	}
	private TermsDao() {}
	
	public List<String> selectTerms() {
		
		List<String> ts = null;
		try {
			 Connection conn = DBCP.getConnection();
			 Statement stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);
			 ts = new ArrayList<>();
			 while(rs.next()) {
				 ts.add(rs.getString(1));
				 ts.add(rs.getString(2));
			 }
			 rs.close();
			 stmt.close();
			 conn.close();
			 
		} catch (Exception e) {
		 e.printStackTrace();
		} 
		return ts;
	}
}
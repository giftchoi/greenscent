package org.kosta.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO dao=new MemberDAO();
	private DataSource dataSource;
	private MemberDAO() {
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static MemberDAO getInstance() {
		return dao;
	}
	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException {
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException {
		if(rs!=null)
			rs.close();
		closeAll(pstmt, con);
	}
}
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class DiaryDAO {
	private static DiaryDAO dao=new DiaryDAO();
	private DataSource dataSource;
	private DiaryDAO() {
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static DiaryDAO getInstance() {
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
	public void registerDiary(DiaryVO dvo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql="insert into diary(dno,id,title,content,regdate,isPublic)"
			+" values(dno_seq.nextval,?,?,?,sysdate,?)";			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dvo.getVo().getId());
			pstmt.setString(2, dvo.getTitle() );
			pstmt.setString(3, dvo.getContent());
			pstmt.setInt(4,dvo.getSecretYN());
			pstmt.executeUpdate();			
			pstmt.close();
			pstmt=con.prepareStatement("select dno_seq.currval from dual");
			rs=pstmt.executeQuery();
			if(rs.next())
			dvo.setDno(rs.getInt(1));			
		}finally{
			closeAll(rs,pstmt,con);
		}
	}
}

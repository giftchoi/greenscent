package model;

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
	public MemberVO login(MemberVO mvo) throws SQLException {
		MemberVO resultVO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="select name, email, to_char(birthday,'yyyy-mm-dd') from green_member where id=? and password=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mvo.getId());
			pstmt.setString(2, mvo.getPassword());
			rs=pstmt.executeQuery();
			if(rs.next())
				resultVO = new MemberVO(mvo.getId(),mvo.getPassword(),rs.getString(1),rs.getString(2),rs.getString(3));
		}finally {
			closeAll(rs, pstmt, con);
		}
		return resultVO;
	}
	public void registerMember(MemberVO mvo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		//ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("insert into green_member(id,password,name,email,birthday,state)");
			sql.append(" values (?,?,?,?,to_date(?,'yyyy-mm-dd'),1)");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, mvo.getId());
			pstmt.setString(2, mvo.getPassword());
			pstmt.setString(3, mvo.getName());
			pstmt.setString(4, mvo.getEmail());
			pstmt.setString(5, mvo.getBirthday());
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public void deleteMember(MemberVO mvo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("update green_member set state=0 where id=?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, mvo.getId());
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
		
	}
	public MemberVO findMemberById(String id) throws SQLException {
		MemberVO resultVO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="select name, email, to_char(birthday,'yyyy-mm-dd') from green_member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
				resultVO = new MemberVO(id,null,rs.getString(1),rs.getString(2),rs.getString(3));
		}finally {
			closeAll(rs, pstmt, con);
		}
		return resultVO;
	}
	public void updateMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("update green_member set password=?, name=?, email=?, birthday=to_date(?, 'yyyy-mm-dd') where id=?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getId());
			
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
}

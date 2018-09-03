package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MarketDAO {
	private static MarketDAO dao=new MarketDAO();
	private DataSource dataSource;
	private MarketDAO() {
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static MarketDAO getInstance() {
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
	public void registerMarket(MarketVO mvo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql="insert into m_board(mno,title,content,status,regdate,id)"
			+" values(mno_seq.nextval,?,?,?,sysdate,?)";			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mvo.getTitle() );
			pstmt.setString(2, mvo.getContent());
			pstmt.setInt(3,mvo.getState());
			pstmt.setString(4, mvo.getVo().getId());
			pstmt.executeUpdate();			
			pstmt.close();
			pstmt=con.prepareStatement("select mno_seq.currval from dual");
			rs=pstmt.executeQuery();
			if(rs.next())
			mvo.setMno(rs.getInt(1));			
		}finally{
			closeAll(rs,pstmt,con);
		}
	}
	public ArrayList<MarketVO> getMarketList(PagingBean pb,String id) throws SQLException{
		ArrayList<MarketVO> list=new ArrayList<MarketVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection(); 
			String sql="select d.mno,d.title,d.regdate\r\n" + 
					"from (SELECT row_number() over(ORDER BY mno DESC) as rnum,mno,id,title," + 
					"to_char(regdate,'YYYY.MM.DD') as regdate\r\n" + 
					"FROM m_board where id=?\r\n" + 
					") d where rnum between ? and ?\r\n" + 
					"order by mno desc";
			pstmt=con.prepareStatement(sql);	
			pstmt.setString(1,id);
			pstmt.setInt(2, pb.getStartRowNumber());
			pstmt.setInt(3, pb.getEndRowNumber());
			rs=pstmt.executeQuery();	
			//목록에서 게시물 content는 필요없으므로 null로 setting
			//select no,title,time_posted,hits,id,name
			while(rs.next()){		
				MarketVO mvo=new MarketVO();
				mvo.setMno(rs.getInt(1));
				mvo.setTitle(rs.getString(2));
				mvo.setRegDate(rs.getString(3));
				list.add(mvo);
			}			
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	public MarketVO getMarketDetail(int mno) throws SQLException {
		MarketVO mvo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql="select title,content,to_char(regdate,'YYYY.MM.DD HH24:MI:SS') " + 
			"from m_board where mno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, mno);
			rs=pstmt.executeQuery();
			if(rs.next()){
				mvo=new MarketVO();
				mvo.setMno(mno);
				mvo.setTitle(rs.getString(1));
				mvo.setContent(rs.getString(2));				
				mvo.setRegDate(rs.getString(3));
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return mvo;
	} 
	
	
	public void updateMarket(MarketVO mvo) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getConnection();
			pstmt=con.prepareStatement("update m_board set title=?,content=? where mno=?");
			pstmt.setString(1, mvo.getTitle());
			pstmt.setString(2, mvo.getContent());
			pstmt.setInt(3, mvo.getMno());	
			pstmt.executeUpdate();			
		}finally{
			closeAll(pstmt,con);
		}
	}
	
	public void deleteMarket(int mno) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getConnection(); 
			pstmt=con.prepareStatement("delete from m_board where mno=?");
			pstmt.setInt(1, mno);		
			pstmt.executeUpdate();			
		}finally{
			closeAll(pstmt,con);
		}
	}
	
	/*public int getTotalMarketCount(String id) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalCount=0;
		try{
			con=getConnection();
			pstmt=con.prepareStatement("select count(*) from m_board where id=?");
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
		}finally{
			closeAll(rs,pstmt,con);
		}
		return totalCount;
	}*/
	
}

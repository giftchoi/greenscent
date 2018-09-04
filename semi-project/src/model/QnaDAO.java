package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class QnaDAO {
	private static QnaDAO dao=new QnaDAO();
	private DataSource dataSource;
	private QnaDAO() {
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static QnaDAO getInstance() {
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
	public int getTotalQnaCount() throws SQLException {
			int totalCount = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = dataSource.getConnection();
				String sql = "select count(*) from qna_board";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next())
					totalCount = rs.getInt(1);
			} finally {
				closeAll(rs, pstmt, con);
			}

			return totalCount;
		}
	public ArrayList<QnaVO> qnaList(PagingBean pagingBean) throws SQLException {
		ArrayList<QnaVO> list = new ArrayList<QnaVO>();
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT Q.qno,Q.id,Q.title,Q.regdate,M.name ");
			sql.append(" FROM ( ");
			sql.append(" SELECT qno,id,title, ");
			sql.append(" to_char(regdate,'YYYY.MM.DD') as regdate, ");
			sql.append(" row_number() over(ORDER BY qno DESC) as rnum ");
			sql.append(" FROM qna_board ) Q , green_member M WHERE Q.id=M.id AND rnum BETWEEN ? AND ?");
			sql.append(" ORDER BY qno DESC");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pagingBean.getStartRowNumber());
			pstmt.setInt(2, pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnaVO qvo = new QnaVO();
				qvo.setqNo(rs.getString(1));
				MemberVO mvo = new MemberVO();
				mvo.setId(rs.getString(2));
				qvo.setTitle(rs.getString(3));
				qvo.setRegDate(rs.getString(4));
				mvo.setName(rs.getString(5));
				qvo.setMvo(mvo);
				list.add(qvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;

	}
	public QnaVO getQnaPostByNo(int qNo) throws SQLException {
		QnaVO qvo=new QnaVO();;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql= new StringBuilder();
			sql.append(" select Q.qno,Q.id, Q.title ,Q.content,Q.regDate ");
			sql.append(" from( select row_number() over(order by qno desc) as rnum, qno , id , title ,");
			sql.append(" content, to_char(regDate,'YYYY.MM.DD') as regDate");
			sql.append(" from qna_board ) Q, green_member M");
			sql.append(" where Q.id=M.id and Q.qno = ? order by qno desc");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, qNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				qvo.setqNo(rs.getString(1));
				MemberVO mvo=new MemberVO();
				mvo.setId(rs.getString(2));
				qvo.setTitle(rs.getString(3));
				qvo.setContent(rs.getString(4));
				qvo.setRegDate(rs.getString(5));
				qvo.setMvo(mvo);
				
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		return qvo;
	}
	public void deleteQna(String qNo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			int qno=Integer.parseInt(qNo);
			con=dataSource.getConnection();
			String sql="delete from qna_board where qno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt,con);
		}
		
	}
	public void qnaUpdate(QnaVO qvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement("update qna_board set title=?,content=? where qno=? ");
			pstmt.setString(1, qvo.getTitle());
			pstmt.setString(2, qvo.getContent());
			pstmt.setString(3, qvo.getqNo());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
	public void qnaPosting(QnaVO qvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="insert into qna_board(qno,id,title,content,regdate) values(qno_seq.nextval,?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, qvo.getMvo().getId());
			pstmt.setString(2, qvo.getTitle());
			pstmt.setString(3, qvo.getContent());
			
			pstmt.executeUpdate();
			pstmt.close();
			pstmt=con.prepareStatement("select qno_seq.currval from dual");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				qvo.setqNo(rs.getString(1));
			}
		
		}finally {
			closeAll(pstmt,con);
		}
		
	}
		
}
	
	


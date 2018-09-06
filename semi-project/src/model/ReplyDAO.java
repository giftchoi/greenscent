package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ReplyDAO {
	private static ReplyDAO dao = new ReplyDAO();
	private DataSource dataSource;

	private ReplyDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static ReplyDAO getInstance() {
		return dao;
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(pstmt, con);
	}

//tip 댓글부분--------------------------------------------------------------===============
	public ArrayList<ReplyVO> getTReplyListBytNo(int tNo) throws SQLException {
		ArrayList<ReplyVO> rvoList = new ArrayList<ReplyVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select trno, id, content, regdate from tip_reply where tno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, tNo);
			rs = pstmt.executeQuery();
			while (rs.next())
				rvoList.add(new ReplyVO(rs.getString(1), tNo + "", rs.getString(2), rs.getString(3), rs.getString(4)));
		} finally {
			closeAll(rs, pstmt, con);
		}

		return rvoList;
	}

	public void writeReplyInTip(ReplyVO rvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into tip_reply(trno,tno,id,content,regDate)");
			sql.append(" values (tip_reply_seq.nextval, ?,?,?,sysdate)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, rvo.getNo());
			pstmt.setString(2, rvo.getId());
			pstmt.setString(3, rvo.getContent());
			pstmt.executeUpdate();

		} finally {
			closeAll(rs, pstmt, con);
		}

	}

	public void deleteReplyInTip(String rno) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from tip_reply where trno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, rno);
			pstmt.executeUpdate();

		} finally {
			closeAll(rs, pstmt, con);
		}

	}

// Qna 댓글부분--------------------------------------------------------------============
	public ArrayList<ReplyVO> getQReplyListByqNo(int qNo) throws SQLException {
		ArrayList<ReplyVO> rvoList = new ArrayList<ReplyVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select qrno, id, content, regdate from qno_reply where qno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, qNo);
			rs = pstmt.executeQuery();
			while (rs.next())
				rvoList.add(new ReplyVO(rs.getString(1), qNo + "", rs.getString(2), rs.getString(3), rs.getString(4)));
		} finally {
			closeAll(rs, pstmt, con);
		}

		return rvoList;
	}

	public void writeReplyInQna(ReplyVO rvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into qno_reply(qrno,qno,id,content,regDate)");
			sql.append(" values (qrno_seq.nextval, ?,?,?,sysdate)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, rvo.getNo());
			pstmt.setString(2, rvo.getId());
			pstmt.setString(3, rvo.getContent());
			pstmt.executeUpdate();

		} finally {
			closeAll(rs, pstmt, con);
		}

	}

	public void deleteReplyInQna(String rno) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from qno_reply where qrno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, rno);
			pstmt.executeUpdate();

		} finally {
			closeAll(rs, pstmt, con);
		}

	}

// Market 댓글부분--------------------------------------------------------------============
	public ArrayList<ReplyVO> getMReplyListBymNo(int mNo) throws SQLException {
		ArrayList<ReplyVO> rvoList = new ArrayList<ReplyVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select mrno, id, content, regdate from m_reply where mno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, mNo);
			rs = pstmt.executeQuery();
			while (rs.next())
				rvoList.add(new ReplyVO(rs.getString(1), mNo + "", rs.getString(2), rs.getString(3), rs.getString(4)));
		} finally {
			closeAll(rs, pstmt, con);
		}

		return rvoList;
	}

	public void writeReplyInMarket(ReplyVO rvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into m_reply(mrno,mno,id,content,regDate)");
			sql.append(" values (mrno_seq.nextval, ?,?,?,sysdate)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, rvo.getNo());
			pstmt.setString(2, rvo.getId());
			pstmt.setString(3, rvo.getContent());
			pstmt.executeUpdate();

		} finally {
			closeAll(rs, pstmt, con);
		}

	}

	public void deleteReplyInMarket(String rno) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from m_reply where mrno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, rno);
			pstmt.executeUpdate();

		} finally {
			closeAll(rs, pstmt, con);
		}

	}

// Diary 댓글부분--------------------------------------------------------------============
	public ArrayList<ReplyVO> getDReplyListBydNo(int dNo) throws SQLException {
		ArrayList<ReplyVO> rvoList = new ArrayList<ReplyVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select drno, id, content, regdate from diary_reply where dno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dNo);
			rs = pstmt.executeQuery();
			while (rs.next())
				rvoList.add(new ReplyVO(rs.getString(1), dNo + "", rs.getString(2), rs.getString(3), rs.getString(4)));
		} finally {
			closeAll(rs, pstmt, con);
		}

		return rvoList;
	}

	public void writeReplyInDiary(ReplyVO rvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into diary_reply(drno,dno,id,content,regDate)");
			sql.append(" values (drno_seq.nextval, ?,?,?,sysdate)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, rvo.getNo());
			pstmt.setString(2, rvo.getId());
			pstmt.setString(3, rvo.getContent());
			pstmt.executeUpdate();

		} finally {
			closeAll(rs, pstmt, con);
		}

	}

	public void deleteReplyInDiary(String rno) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from diary_reply where drno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, rno);
			pstmt.executeUpdate();

		} finally {
			closeAll(rs, pstmt, con);
		}

	}

}

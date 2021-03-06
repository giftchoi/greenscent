package model;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

import javax.sql.DataSource;

public class TipDAO {
	private static TipDAO dao = new TipDAO();
	private DataSource dataSource;

	private TipDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static TipDAO getInstance() {
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

	public ArrayList<TipVO> tipList(PagingBean pagingBean) throws SQLException {
		ArrayList<TipVO> list = new ArrayList<TipVO>();
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT T.tno,T.id,T.title,T.regDate,T.hits,M.name");
			sql.append(" FROM ( ");
			sql.append(" SELECT tno,id,title, ");
			sql.append(" to_char(regDate,'YYYY.MM.DD') as regDate, hits , ");
			sql.append(" row_number() over(ORDER BY tno DESC) as rnum ");
			sql.append(" FROM tip ) T , green_member M WHERE T.id=M.id AND rnum BETWEEN ? AND ?");
			sql.append(" ORDER BY tno DESC");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pagingBean.getStartRowNumber());
			pstmt.setInt(2, pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TipVO tvo = new TipVO();
				tvo.settNo(rs.getInt(1));
				MemberVO mvo = new MemberVO();
				mvo.setId(rs.getString(2));
				tvo.setTitle(rs.getString(3));
				tvo.setRegDate(rs.getString(4));
				tvo.setHits(rs.getInt(5));
				mvo.setName(rs.getString(6));
				tvo.setMemberVO(mvo);
				list.add(tvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;

	}

	public int getTotalTipCount() throws SQLException {
		int totalCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from tip";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				totalCount = rs.getInt(1);
		} finally {
			closeAll(rs, pstmt, con);
		}

		return totalCount;
	}

	public TipVO getTipPostByNo(int tNo) throws SQLException {
		TipVO tvo = null;
		MemberVO mvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" select T.tno,T.id, T.title ,T.content,T.regDate,T.hits,M.name");
			sql.append(" from( select row_number() over(order by tno desc) as rnum, tno , id , title ,");
			sql.append(" content, to_char(regDate,'YYYY.MM.DD') as regDate, hits");
			sql.append(" from tip ) T, green_member M");
			sql.append(" where T.id=M.id and T.tno = ? order by tno desc");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, tNo);
			rs = pstmt.executeQuery();
			if (rs.next())
				tvo = new TipVO();
			tvo.settNo(tNo);
			mvo = new MemberVO();
			mvo.setId(rs.getString("id"));
			tvo.setTitle(rs.getString("title"));
			tvo.setContent(rs.getString("content"));
			tvo.setRegDate(rs.getString("regDate"));
			tvo.setHits(rs.getInt("hits"));
			mvo.setName(rs.getString("name"));
			tvo.setMemberVO(mvo);

		} finally {
			closeAll(rs, pstmt, con);
		}

		return tvo;
	}

	public ArrayList<TipVO> tipPostSearch(String search, PagingBean pagingBean) throws SQLException {
		ArrayList<TipVO> list = new ArrayList<TipVO>();
		TipVO tvo = null;
		MemberVO mvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT T.tno,T.id,T.title,T.content,T.regDate,T.hits,M.name ");
			sql.append(" FROM ( ");
			sql.append("select row_number() over(order by tno desc) as rnum, ");
			sql.append(
					"tno,id,title,content,to_char(regDate,'YYYY.MM.DD')as regDate ,hits from tip where title LIKE '%'||?||'%' ) T , green_member M");
			sql.append(" WHERE T.id=M.id AND rnum BETWEEN ? and ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, search);
			pstmt.setInt(2, pagingBean.getStartRowNumber());
			pstmt.setInt(3, pagingBean.getEndRowNumber());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				tvo = new TipVO();
				tvo.settNo(rs.getInt(1));
				mvo = new MemberVO();
				mvo.setId(rs.getString(2));
				tvo.setTitle(rs.getString(3));
				tvo.setContent(rs.getString(4));
				tvo.setRegDate(rs.getString(5));
				tvo.setHits(rs.getInt(6));
				mvo.setName(rs.getString(7));
				tvo.setMemberVO(mvo);
				list.add(tvo);

			}
		} finally {
			closeAll(rs, pstmt, con);
		}

		return list;

	}

	public void updateHits(int no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String sql = "update tip set hits=hits+1 where tno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeQuery();
		} finally {
			closeAll(pstmt, con);
		}
	}

	public void tipDelete(int tno) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "delete from tip where tno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tno);
			pstmt.executeUpdate();

		} finally {
			closeAll(pstmt, con);
		}
	}

	public void tipUpdate(TipVO tvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement("update tip set title=?,content=? where tno=? ");
			pstmt.setString(1, tvo.getTitle());
			pstmt.setString(2, tvo.getContent());
			pstmt.setInt(3, tvo.gettNo());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	public void tipPosting(TipVO tvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into tip ( tno, id , title , content ,");
			sql.append(" regDate, hits)");
			sql.append(" values(tip_seq.nextval,?,?,?,sysdate,0)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, tvo.getMemberVO().getId());
			pstmt.setString(2, tvo.getTitle());
			pstmt.setString(3, tvo.getContent());
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = con.prepareStatement("select tip_seq.currval from dual");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				tvo.settNo(rs.getInt(1));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}

	}

	public void tipRegisterImg(int tno, String fileList[]) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			for (int i = 0; i < fileList.length; i++) {
				String sql = "insert into tip_img(timgno,tno,imgpath) " + " values(timgno_seq.nextval,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, tno);
				pstmt.setString(2, fileList[i]);
				pstmt.executeUpdate();
			}
		} finally {
			closeAll(pstmt, con);
		}

	}

	public ArrayList<String> getTipImgList(int tNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<String>();
		try {
			con = dataSource.getConnection();
			String sql = "select imgpath from tip_img where tno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	public void tipUpdateImg(String[] fileList, int tNo) throws SQLException {
		ArrayList<String> oldList = getTipImgList(tNo);
		ArrayList<String> newList = new ArrayList<String>();
		//System.out.println(oldList);
		//System.out.println(fileList);
		if(fileList!=null) {
			Collections.addAll(newList, fileList);
		}
		if (!newList.isEmpty()) {
			for (int i = 0; i < newList.size(); i++) {
				if (!oldList.contains(newList.get(i)))
				//System.out.println("newList");
				if (oldList.contains(newList.get(i)))
					tipRegUpImg(tNo, newList.get(i));
			}
		}
		if (!oldList.isEmpty()) {
			for (int i = 0; i < oldList.size(); i++) {
				if (!newList.contains(oldList.get(i))) {
					deleteImgInDir(oldList.get(i));
					deleteImgInTable(oldList.get(i));
				}
			}
		}
	}
	
	
	private void deleteImgInTable(String string) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("delete from tip_img where imgpath=?");
			pstmt.setString(1, string);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	public void tipRegUpImg(int tno, String fileList) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "insert into tip_img(timgno,tno,imgpath) " + " values(timgno_seq.nextval,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tno);
			pstmt.setString(2, fileList);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}

	}

	public void deleteImgInDir(String imgname) {
		String workspacePath = System.getProperty("user.home")
				+ "\\git\\greenscent\\semi-project\\WebContent\\uploadImg\\";
		File file = new File(workspacePath + imgname);
		if (file.exists())
			file.delete();
	}
}

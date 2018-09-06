package model;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

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
	public void registerImg(int dno,String filename) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
				String sql="insert into diary_img(dimgno,dno,imgpath)"
						+" values(dimgno_seq.nextval,?,?)";			
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1,dno);
				pstmt.setString(2,filename);
				pstmt.executeUpdate();
		}finally{
			closeAll(rs,pstmt,con);
		}
	}
	public ArrayList<DiaryVO> getMyDiaryList(PagingBean pb,String id) throws SQLException{
		ArrayList<DiaryVO> list=new ArrayList<DiaryVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection(); 
			String sql="select d.dno,d.title,d.regdate,d.isPublic\r\n" + 
					"from (SELECT row_number() over(ORDER BY dno DESC) as rnum,dno,id,title," + 
					"to_char(regdate,'YYYY.MM.DD') as regdate,isPublic\r\n" + 
					"FROM diary where id=?\r\n" + 
					") d where rnum between ? and ?\r\n" + 
					"order by dno desc";
			pstmt=con.prepareStatement(sql);	
			pstmt.setString(1,id);
			pstmt.setInt(2, pb.getStartRowNumber());
			pstmt.setInt(3, pb.getEndRowNumber());
			rs=pstmt.executeQuery();	
			//목록에서 게시물 content는 필요없으므로 null로 setting
			//select no,title,time_posted,hits,id,name
			while(rs.next()){		
				DiaryVO dvo=new DiaryVO();
				dvo.setDno(rs.getInt(1));
				dvo.setTitle(rs.getString(2));
				dvo.setRegDate(rs.getString(3));
				dvo.setSecretYN(rs.getInt(4));
				list.add(dvo);
			}			
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	public ArrayList<DiaryVO> getPublicDiaryList(PagingBean pb) throws SQLException {
		ArrayList<DiaryVO> list=new ArrayList<DiaryVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection(); 
			String sql="select d.dno,d.title,d.regdate,m.id,m.name\r\n" + 
					"from (SELECT row_number() over(ORDER BY dno DESC) as rnum,dno,id,title," + 
					"to_char(regdate,'YYYY.MM.DD') as regdate\r\n" + 
					"FROM diary where isPublic=1\r\n" + 
					") d,green_member m where d.id=m.id and rnum between ? and ?\r\n" + 
					"order by dno desc";
			pstmt=con.prepareStatement(sql);	
			pstmt.setInt(1, pb.getStartRowNumber());
			pstmt.setInt(2, pb.getEndRowNumber());
			rs=pstmt.executeQuery();	
			//목록에서 게시물 content는 필요없으므로 null로 setting
			//select no,title,time_posted,hits,id,name
			while(rs.next()){		
				DiaryVO dvo=new DiaryVO();
				dvo.setDno(rs.getInt(1));
				dvo.setTitle(rs.getString(2));
				dvo.setRegDate(rs.getString(3));
				MemberVO vo=new MemberVO(rs.getString(4),null,rs.getString(5));
				dvo.setVo(vo);
				list.add(dvo);
			}			
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	public DiaryVO getDiaryDetail(int dno) throws SQLException {
		DiaryVO dvo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql="select d.title,d.content,to_char(d.regdate,'YYYY.MM.DD HH24:MI:SS'),m.id,m.name,d.isPublic " + 
			"from diary d,green_member m where d.id=m.id and dno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dno);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dvo=new DiaryVO();
				dvo.setDno(dno);
				dvo.setTitle(rs.getString(1));
				dvo.setContent(rs.getString(2));				
				dvo.setRegDate(rs.getString(3));
				MemberVO vo=new MemberVO(rs.getString(4),null,rs.getString(5));
				dvo.setVo(vo);
				dvo.setSecretYN(rs.getInt(6));
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return dvo;
	} 
	public void updateDiary(DiaryVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getConnection();
			pstmt=con.prepareStatement("update diary set title=?,content=?,isPublic=? where dno=?");
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getSecretYN());
			pstmt.setInt(4, vo.getDno());	
			pstmt.executeUpdate();			
		}finally{
			closeAll(pstmt,con);
		}
	}
	public void deleteDiary(int dno) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getConnection(); 
			pstmt=con.prepareStatement("delete from diary where dno=?");
			pstmt.setInt(1, dno);		
			pstmt.executeUpdate();			
		}finally{
			closeAll(pstmt,con);
		}
	}
	public int getTotalMyDiaryCount(String id) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalCount=0;
		try{
			con=getConnection();
			pstmt=con.prepareStatement("select count(*) from diary where id=?");
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
		}finally{
			closeAll(rs,pstmt,con);
		}
		return totalCount;
	}
	public int getSearchMyDiaryCount(String id,String keyword) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalCount=0;
		try{
			con=getConnection();
			pstmt=con.prepareStatement("select count(*) from diary where id=? AND title LIKE '%'||?||'%'");
			pstmt.setString(1,id);
			pstmt.setString(2, keyword);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
		}finally{
			closeAll(rs,pstmt,con);
		}
		return totalCount;
	}
	public int getTotalPublicDiaryCount() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalCount=0;
		try{
			con=getConnection();
			pstmt=con.prepareStatement("select count(*) from diary where isPublic=1");
			rs=pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
		}finally{
			closeAll(rs,pstmt,con);
		}
		return totalCount;
	}
	public ArrayList<DiaryVO> getSearchMyDiaryList(PagingBean pb,String id,String keyword) throws SQLException{
		ArrayList<DiaryVO> list=new ArrayList<DiaryVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection(); 
			String sql="select d.dno,d.title,d.regdate\r\n" + 
					"from (SELECT row_number() over(ORDER BY dno DESC) as rnum,dno,id,title," + 
					"to_char(regdate,'YYYY.MM.DD') as regdate\r\n" + 
					"FROM diary where id=? AND title LIKE '%'||?||'%'\r\n" + 
					") d where rnum between ? and ?\r\n" + 
					"order by dno desc";
			pstmt=con.prepareStatement(sql);	
			pstmt.setString(1,id);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, pb.getStartRowNumber());
			pstmt.setInt(4, pb.getEndRowNumber());
			rs=pstmt.executeQuery();	
			//목록에서 게시물 content는 필요없으므로 null로 setting
			//select no,title,time_posted,hits,id,name
			while(rs.next()){		
				DiaryVO dvo=new DiaryVO();
				dvo.setDno(rs.getInt(1));
				dvo.setTitle(rs.getString(2));
				dvo.setRegDate(rs.getString(3));
				list.add(dvo);
			}			
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	public int getSearchPublicDiaryCount(String keyword) throws SQLException {
		// TODO Auto-generated method stub   AND title LIKE '%'||?||'%'
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalCount=0;
		try{
			con=getConnection();
			pstmt=con.prepareStatement("select count(*) from diary where isPublic=1 AND title LIKE '%'||?||'%'");
			pstmt.setString(1, keyword);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
		}finally{
			closeAll(rs,pstmt,con);
		}
		return totalCount;
	}
	public ArrayList<DiaryVO> getSearchPublicDiaryList(PagingBean pb,String keyword) throws SQLException {
		ArrayList<DiaryVO> list=new ArrayList<DiaryVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection(); 
			String sql="select d.dno,d.title,d.regdate,m.id,m.name\r\n" + 
					"from (SELECT row_number() over(ORDER BY dno DESC) as rnum,dno,id,title," + 
					"to_char(regdate,'YYYY.MM.DD') as regdate\r\n" + 
					"FROM diary where isPublic=1 and title LIKE '%'||?||'%'\r\n" + 
					") d,green_member m where d.id=m.id and rnum between ? and ?\r\n" + 
					"order by dno desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, pb.getStartRowNumber());
			pstmt.setInt(3, pb.getEndRowNumber());
			rs=pstmt.executeQuery();	
			//목록에서 게시물 content는 필요없으므로 null로 setting
			//select no,title,time_posted,hits,id,name
			while(rs.next()){		
				DiaryVO dvo=new DiaryVO();
				dvo.setDno(rs.getInt(1));
				dvo.setTitle(rs.getString(2));
				dvo.setRegDate(rs.getString(3));
				MemberVO vo=new MemberVO(rs.getString(4),null,rs.getString(5));
				dvo.setVo(vo);
				list.add(dvo);
			}			
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	public ArrayList<String> getImgList(int dno) throws SQLException {
		ArrayList<String> list=new ArrayList<String>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection(); 
			String sql="select imgpath from diary_Img where dno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dno);
			rs=pstmt.executeQuery();
			while(rs.next()){		
				list.add(rs.getString(1));
			}			
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	public void deleteImgInDir(String imgname) {
		String workspacePath=System.getProperty("user.home")+"\\git\\greenscent\\semi-project\\WebContent\\uploadImg\\";
		File file=new File(workspacePath+imgname); 
		if(file.exists()) file.delete();
	}
	public void updateDiaryImg(int dno, String[] newFilelist) throws SQLException {
		ArrayList<String> oldList=getImgList(dno);
		ArrayList<String> newlist = new ArrayList<String>();
		if(newFilelist != null) {
			Collections.addAll(newlist, newFilelist);
		}
		if(!newlist.isEmpty()) {
			for(int i=0;i<newlist.size();i++) {
				if(!oldList.contains(newlist.get(i)))
					registerImg(dno, newlist.get(i));
			}
		}
		if(!oldList.isEmpty()) {
			for(int i=0;i<oldList.size();i++) {
				if(!newlist.contains(oldList.get(i))) {
					deleteImgInDir(oldList.get(i));
					deleteImgInTable(oldList.get(i));
				}
			}
		}
		
	}
	public void deleteImgInTable(String string) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getConnection(); 
			pstmt=con.prepareStatement("delete from diary_img where imgpath=?");
			pstmt.setString(1, string);		
			pstmt.executeUpdate();			
		}finally{
			closeAll(pstmt,con);
		}
	}
}

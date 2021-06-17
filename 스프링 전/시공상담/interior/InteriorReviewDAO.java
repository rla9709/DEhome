package interior;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class InteriorReviewDAO {
private static InteriorReviewDAO instance = new InteriorReviewDAO();
	
	public static InteriorReviewDAO getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	/*--시공리뷰 insert--*/
	public int insertReiview(InteriorReviewDTO board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			
			
			con = getConnection();
			// re_no는 autoincrement로 자동증가
			sql = "insert into review (com_name, user_nick, re_title, re_content, re_file, re_date) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getCom_name());
			pstmt.setString(2, board.getUser_nick());
			pstmt.setString(3, board.getRe_title());
			pstmt.setString(4, board.getRe_content());
			pstmt.setString(5, board.getRe_file());
			pstmt.setTimestamp(6, board.getRe_date());
			
			pstmt.executeUpdate();
			
			/*--COMPANY(시공업체)테이블 업체평점(COM_RATING)추가 부분--*/
			sql = "update company set com_rating = com_rating + ? where com_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getCom_rating());
			pstmt.setString(2, board.getCom_name());
			
			pstmt.executeUpdate();
			
			re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	/*--시공리뷰 해당 상세페이지 정보 가져오기--*/
	public InteriorReviewDTO reviewShow(int re_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		InteriorReviewDTO board = null;
		
		try {
			
			con = getConnection();
			sql = "select * from review where re_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new InteriorReviewDTO();
				
				board.setRe_no(rs.getInt(1));
				board.setCom_name(rs.getString(2));
				board.setUser_nick(rs.getString(3));
				board.setRe_title(rs.getString(4));
				board.setRe_content(rs.getString(5).replace("\r\n", "<br>"));
				board.setRe_file(rs.getString(6));
				board.setRe_date(rs.getTimestamp(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return board;
	}
	
	/*--시공리뷰 도움 횟수 카운트--*/
	public int interestCount(int re_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			sql = "select count(*) from re_interest where re_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	/*--해당 유저 시공리뷰 좋아요 클릭 유무--*/
	public int searchInterest(int re_no, String session_user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			sql = "select * from re_interest where re_no = ? and user_nick = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_no);
			pstmt.setString(2, session_user);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = 1; // 유저가 해당 게시글을 좋아요 누른 적이 있으면 1을 return
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	/*--시공리뷰 좋아요 insert--*/
	public int insertInterest(int re_no, String session_user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			
			// RE_INTEREST에 insert
			sql = "insert into re_interest values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, session_user);
			pstmt.setInt(2, re_no);
			pstmt.executeUpdate();
			
			// REVIEW 테이블에 해당하는 리뷰글의 re_interest 칼럼에 +1 추가
			sql = "update review set re_interest = (re_interest + 1) where re_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_no);
			pstmt.executeUpdate();
			
			
			re = 1; // insert 성공 시 1을 return
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	/*--시공리뷰 좋아요 delete--*/
	public int deleteInterest(int re_no, String session_user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			
			// RE_INTEREST에 delete
			sql = "delete from re_interest where user_nick = ? and re_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, session_user);
			pstmt.setInt(2, re_no);
			pstmt.executeUpdate();
			
			// REVIEW 테이블에 해당하는 리뷰글의 re_interest 칼럼에 -1 감소
			sql = "update review set re_interest = (re_interest - 1) where re_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_no);
			pstmt.executeUpdate();
			
			
			re = -1; // delete 성공 시 -1을 return
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	/*--시공리뷰 수정 update--*/
	public int editReview(int re_no, String re_title, String re_content, String re_file) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			sql = "update review set re_title = ?, re_content = ?, re_file = ? where re_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, re_title);
			pstmt.setString(2, re_content);
			pstmt.setString(3, re_file);
			pstmt.setInt(4, re_no);
			pstmt.executeUpdate();
			
			re = 1; // update 성공 시 1을 return
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
}

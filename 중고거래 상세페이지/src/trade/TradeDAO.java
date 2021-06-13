package trade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class TradeDAO {
private static TradeDAO instance = new TradeDAO();
	
	public static TradeDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initCTX = new InitialContext();
		Context envCTX = (Context)initCTX.lookup("java:comp/env");
		DataSource ds = (DataSource)envCTX.lookup("jdbc/mysql");
		
		return ds.getConnection();
	}
	
	/*--중고거래 해당 상세페이지 정보 가져오기--*/
	public TradeShowDTO usedTradeBoard(int tr_no, boolean add_tr_count) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		TradeShowDTO ts = null;
		
		try {
			
			con = getConnection();
			
			/*--조회수 증가 부분--*/
			if (add_tr_count == true) {
				sql = "update usedtrade set trade_count = trade_count+1 where trade_no = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, tr_no);
				pstmt.executeUpdate();
				pstmt.close();
			}
			
			sql = "select * from usedtrade where trade_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tr_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				ts = new TradeShowDTO();
				ts.setTr_no(rs.getInt(1));
				ts.setTr_user_nick(rs.getString(2));
				ts.setTr_category(rs.getString(3));
				ts.setTr_title(rs.getString(4));
				ts.setTr_content(rs.getString(5).replace("\r\n", "<br>"));
				ts.setTr_date(rs.getTimestamp(6));
				ts.setTr_count(rs.getInt(7));
				ts.setTr_evalue(rs.getInt(8));
				ts.setTr_price(rs.getInt(9));
				ts.setTr_photo(rs.getString(10));
				ts.setTr_complete(rs.getInt(11));
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
		return ts;
	}
	
	/*--중고거래 해당 상세페이지 위치 정보 가져오기--*/
	public String tradeAddr(String tr_user_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String addr = "";
		
		try {
			con = getConnection();
			sql = "select case when left(user_addr2,1) = '경' then substring_index(user_addr2,' ', 3) when left(user_addr2,1) = '전' then substring_index(user_addr2,' ', 3) when left(user_addr2,1) = '충' then substring_index(user_addr2,' ', 3) when left(user_addr2,1) = '강' then substring_index(user_addr2,' ', 3) else substring_index(user_addr2,' ', 2) end from user where user_nick = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tr_user_nick);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				addr = rs.getString(1);
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
		return addr;
	}
	
	/*--중고거래 좋아요(관심도) 카운트--*/
	public int tradeInterest(int tr_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0; // 관심도 수
		
		try {
			
			con = getConnection();
			sql = "select count(*) from tr_interest where trade_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tr_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}
	
	
	/*--중고거래 거래글 좋아요 누르기전 세션유저가 해당 글 좋아요 누른 전적 확인--*/
	public int interestCheck(int tr_no, String session_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			sql = "select count(*) from tr_interest where trade_no = ? and user_nick = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tr_no);
			pstmt.setString(2, session_nick);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = rs.getInt(1); // 전적이 있으면 1, 없으면 0
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
	
	
	
	/*--중고거래 거래글 좋아요 누르기(중고거래 좋아요 테이블_관심도 : 1)--*/
	public int interestOn(int tr_no, String session_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "insert into tr_interest values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tr_no);
			pstmt.setString(2, session_nick);
			pstmt.setInt(3, 1);
			pstmt.executeUpdate();
			
			re = 1;
			
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
	
	
	
	/*--중고거래 판매완료 처리(trade_complete : 1)--*/
	public int tradeComplete(int tr_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "update usedtrade set trade_complete = 1 where trade_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tr_no);
			pstmt.executeUpdate();
			
			re = 1;
			
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
	
	
	
	
	
	
	
	
	
	/*
	 * //중고거래에서 거래글 작성자의 지역정보 가져와서 중고거래 메인 화면 리스트로 뿌리기 public ArrayList<TradeDTO>
	 * userAddrList(String writer_nick) { Connection con = null; PreparedStatement
	 * pstmt = null; ResultSet rs = null; String sql = ""; ArrayList<TradeDTO>
	 * tradeList = new ArrayList<TradeDTO>();
	 * 
	 * try {
	 * 
	 * sql = "select" + "case " + "when left(user_addr2,1) = '경' " +
	 * "then substring_index(user_addr2,' ', 3) " + "when left(user_addr2,1) = '전' "
	 * + "then substring_index(user_addr2,' ', 3) " +
	 * "when left(user_addr2,1) = '충' " + "then substring_index(user_addr2,' ', 3) "
	 * + "when left(user_addr2,1) = '강' " +
	 * "then substring_index(user_addr2,' ', 3) " +
	 * "else substring_index(user_addr2,' ', 2) " + "end " +
	 * "from user where user_nick = ?";
	 * 
	 * con = getConnection(); pstmt = con.prepareStatement(sql); pstmt.setString(1,
	 * writer_nick); rs = pstmt.executeQuery();
	 * 
	 * while(rs.next()) { TradeDTO dto = new TradeDTO();
	 * dto.setUser_addr2(rs.getString(1)); tradeList.add(dto); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { try { if (rs !=
	 * null) rs.close(); if (pstmt != null) pstmt.close(); if (con != null)
	 * con.close(); } catch (Exception e2) { e2.printStackTrace(); } }
	 * 
	 * return tradeList; }
	 * 
	 * public ArrayList<TradeDTO> usedTradeList() { Connection con = null;
	 * PreparedStatement pstmt = null; ResultSet rs = null; String sql = "";
	 * ArrayList<TradeDTO> tradeList = new ArrayList<TradeDTO>(); try { sql =
	 * "select * from usedtrade where trade_complete = 0"; con = getConnection();
	 * pstmt = con.prepareStatement(sql); rs = pstmt.executeQuery();
	 * while(rs.next()) { TradeDTO dto = new TradeDTO(); dto.setTr_no(rs.getInt(1));
	 * dto.setTr_user_nick(rs.getString(2)); dto.setTr_category(rs.getString(3));
	 * dto.setTr_title(rs.getString(4)); dto.setTr_content(rs.getString(5));
	 * dto.setTr_date(rs.getTimestamp(6)); dto.setTr_count(rs.getInt(7));
	 * dto.setTr_evalue(rs.getInt(8)); dto.setTr_price(rs.getInt(9));
	 * dto.setTr_photo(rs.getString(10)); dto.setTr_complete(rs.getInt(11));
	 * 
	 * tradeList.add(dto); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { try { if (rs !=
	 * null) rs.close(); if (pstmt != null) pstmt.close(); if (con != null)
	 * con.close(); } catch (Exception e2) { e2.printStackTrace(); } }
	 * 
	 * return tradeList; }
	 */
	 
}




























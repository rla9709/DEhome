package trade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import trade.TradeDTO;

//import login.LoginDAO;

public class TradeInsertDAO {
	private static TradeInsertDAO instance = new TradeInsertDAO();
	
	public static TradeInsertDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initCTX = new InitialContext();
		Context envCTX = (Context)initCTX.lookup("java:comp/env");
		DataSource ds = (DataSource)envCTX.lookup("jdbc/mysql");
		
		return ds.getConnection();
	}
	
//	//중고거래에서 거래글 작성자의 지역정보 가져와서 중고거래 메인 화면 리스트로 뿌리기
//	public ArrayList<TradeDTO> userAddrList(String writer_nick) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "";
//		ArrayList<TradeDTO> tradeList = new ArrayList<TradeDTO>();
//		
//		try {
//			sql = "select"
//					+ "case "
//					+ "when left(user_addr2,1) = '경' "
//					+ "then substring_index(user_addr2,' ', 3) "
//					+ "when left(user_addr2,1) = '전' "
//					+ "then substring_index(user_addr2,' ', 3) "
//					+ "when left(user_addr2,1) = '충' "
//					+ "then substring_index(user_addr2,' ', 3) "
//					+ "when left(user_addr2,1) = '강' "
//					+ "then substring_index(user_addr2,' ', 3) "
//					+ "else substring_index(user_addr2,' ', 2) "
//					+ "end "
//					+ "from user where user_nick = ?";
//			con = getConnection();
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, writer_nick);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				TradeDTO dto = new TradeDTO();
//				dto.setUser_addr2(rs.getString(1));
//				tradeList.add(dto);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) rs.close();
//				if (pstmt != null) pstmt.close();
//				if (con != null) con.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		
//		return tradeList;
//	}
	
//	public ArrayList<TradeDTO> usedTradeList() {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "";
//		ArrayList<TradeDTO> tradeList = new ArrayList<TradeDTO>();
//		try {
//			sql = "select * from usedtrade where trade_complete = 0";
//			con = getConnection();
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				TradeDTO dto = new TradeDTO();
//				dto.setTr_no(rs.getInt(1));
//				dto.setTr_user_nick(rs.getString(2));
//				dto.setTr_category(rs.getString(3));
//				dto.setTr_title(rs.getString(4));
//				dto.setTr_content(rs.getString(5));
//				dto.setTr_date(rs.getTimestamp(6));
//				dto.setTr_count(rs.getInt(7));
//				dto.setTr_evalue(rs.getInt(8));
//				dto.setTr_price(rs.getInt(9));
//				dto.setTr_photo(rs.getString(10));
//				dto.setTr_complete(rs.getInt(11));
//				
//				tradeList.add(dto);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) rs.close();
//				if (pstmt != null) pstmt.close();
//				if (con != null) con.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		
//		return tradeList;
//	}
	public int insertGoods(TradeDTO trDTO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = ""; 
		int number;

		try {
			con = getConnection();
			sql = "SELECT MAX(TRADE_NO) FROM USEDTRADE"; // BOARDT에서 B_ID컬럼의 최대값을 조회하는 쿼리
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 게시글이 하나 이상있는 경우
				number = rs.getInt(1) + 1; // MAX(TRADE_NO)에서 1추가
			} else { // 게시글이 하나도 없는 경우
				number = 1;
			}



			sql = "INSERT INTO USEDTRADE(TRADE_NO, USER_NICK, CATEGORY, TRADE_TITLE, TRADE_CONTENT, TRADE_DATE, TRADE_COUNT, TRADE_EVALUE, TRADE_PRICE, TRADE_PHOTO, TRADE_COMPLETE) "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)"; // 각 컬럼에 해당하는 내용을 INSERT하는 쿼리문
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, trDTO.getTr_user_nick()); // (파라미터, 입력할 데이터값)
			pstmt.setString(3, trDTO.getTr_category());
			pstmt.setString(4, trDTO.getTr_title());
			pstmt.setString(5, trDTO.getTr_content());
			pstmt.setTimestamp(6, trDTO.getTr_date());
			pstmt.setInt(7, trDTO.getTr_count());
			pstmt.setInt(8, trDTO.getTr_evalue());
			pstmt.setString(9, trDTO.getTr_price());
			pstmt.setString(10, trDTO.getTr_photo());
			pstmt.setInt(11, trDTO.getTr_complete());
			

			pstmt.executeUpdate(); // INSERT했으니 쿼리 업데이트실시
		} catch (Exception e) {
			e.printStackTrace(); // 예외상황시 예외내용출력
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				} // 자원반납
				if (con != null) {
					con.close();
				} // 자원반납
			} catch (Exception e2) {
				e2.printStackTrace(); // 예외상황시 예외내용출력
			}
		}
		return 1; // insertBoard메소드가 제대로 실행되었으면 1을 리턴함
	}
}




























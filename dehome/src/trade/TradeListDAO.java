package trade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import login.LoginDAO;

public class TradeListDAO {
private static TradeListDAO instance = new TradeListDAO();
	
	public static TradeListDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initCTX = new InitialContext();
		Context envCTX = (Context)initCTX.lookup("java:comp/env");
		DataSource ds = (DataSource)envCTX.lookup("jdbc/mysql");
		
		return ds.getConnection();
	}
	
	//중고물품 목록 화면에 뿌리는 메서드
	public ArrayList<TradeDTO> usedTradeList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<TradeDTO> tradeList = new ArrayList<TradeDTO>();
		try {
			sql = "select t1.trade_no, t1.USER_NICK, t1.category, t1.TRADE_TITLE, t1.TRADE_CONTENT,t1.TRADE_DATE,t1.TRADE_COUNT,t1.TRADE_EVALUE,format(t1.TRADE_PRICE,0),t1.TRADE_PHOTO, t1.TRADE_COMPLETE , case when left(t2.user_addr2,1) = '경' then substring_index(t2.user_addr2,' ', 3) when left(t2.user_addr2,1) = '전' then substring_index(t2.user_addr2,' ', 3) when left(t2.user_addr2,1) = '충' then substring_index(t2.user_addr2,' ', 3) when left(t2.user_addr2,1) = '강' then substring_index(t2.user_addr2,' ', 3) else substring_index(t2.user_addr2,' ', 2) end from usedtrade t1, user t2 where t1.user_nick = t2.user_nick and trade_complete = 0  order by trade_count desc";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TradeDTO dto = new TradeDTO();
				dto.setTr_no(rs.getInt(1));
				dto.setTr_user_nick(rs.getString(2));
				dto.setTr_category(rs.getString(3));
				dto.setTr_title(rs.getString(4));
				dto.setTr_content(rs.getString(5));
				dto.setTr_date(rs.getTimestamp(6));
				dto.setTr_count(rs.getInt(7));
				dto.setTr_evalue(rs.getInt(8));
				dto.setTr_price(rs.getString(9));
				dto.setTr_photo(rs.getString(10));
				dto.setTr_complete(rs.getInt(11));
				dto.setUser_addr2(rs.getNString(12));
				
				tradeList.add(dto);
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
		
		return tradeList;
	}
	
	//중고물품 목록 화면 카테고리별로 뿌리는 메서드
	public ArrayList<TradeDTO> usedTradeCategoryList(String category) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<TradeDTO> tradeList = new ArrayList<TradeDTO>();
		try {
			sql = "select t1.trade_no"
					+ ", t1.USER_NICK"
					+ ", t1.category"
					+ ", t1.TRADE_TITLE"
					+ ", t1.TRADE_CONTENT"
					+ ", t1.TRADE_DATE"
					+ ", t1.TRADE_COUNT"
					+ ", t1.TRADE_EVALUE"
					+ ", format(t1.TRADE_PRICE,0)"
					+ ", t1.TRADE_PHOTO"
					+ ", t1.TRADE_COMPLETE"
					+ ", case "
					+ "when left(t2.user_addr2,1) = '경' "
					+ "then substring_index(t2.user_addr2,' ', 3) "
					+ "when left(t2.user_addr2,1) = '전' "
					+ "then substring_index(t2.user_addr2,' ', 3) "
					+ "when left(t2.user_addr2,1) = '충' "
					+ "then substring_index(t2.user_addr2,' ', 3) "
					+ "when left(t2.user_addr2,1) = '강' "
					+ "then substring_index(t2.user_addr2,' ', 3) "
					+ "else substring_index(t2.user_addr2,' ', 2) "
					+ "end "
					+ "from usedtrade t1, user t2 "
					+ "where t1.user_nick = t2.user_nick and trade_complete = 0 and category = ? "
					+ "order by trade_count desc";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TradeDTO dto = new TradeDTO();
				dto.setTr_no(rs.getInt(1));
				dto.setTr_user_nick(rs.getString(2));
				dto.setTr_category(rs.getString(3));
				dto.setTr_title(rs.getString(4));
				dto.setTr_content(rs.getString(5));
				dto.setTr_date(rs.getTimestamp(6));
				dto.setTr_count(rs.getInt(7));
				dto.setTr_evalue(rs.getInt(8));
				dto.setTr_price(rs.getString(9));
				dto.setTr_photo(rs.getString(10));
				dto.setTr_complete(rs.getInt(11));
				dto.setUser_addr2(rs.getNString(12));
				
				tradeList.add(dto);
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
		
		return tradeList;
	}
	
	//중고물품 목록 화면에 뿌리는 메서드
	public ArrayList<TradeDTO> usedTradeAreaList(String word) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<TradeDTO> tradeList = new ArrayList<TradeDTO>();
		try {
			sql = "select t1.trade_no, t1.USER_NICK, t1.category, t1.TRADE_TITLE, t1.TRADE_CONTENT,t1.TRADE_DATE,t1.TRADE_COUNT,t1.TRADE_EVALUE,format(t1.TRADE_PRICE,0),t1.TRADE_PHOTO, t1.TRADE_COMPLETE , case when left(t2.user_addr2,1) = '경' then substring_index(t2.user_addr2,' ', 3) when left(t2.user_addr2,1) = '전' then substring_index(t2.user_addr2,' ', 3) when left(t2.user_addr2,1) = '충' then substring_index(t2.user_addr2,' ', 3) when left(t2.user_addr2,1) = '강' then substring_index(t2.user_addr2,' ', 3) else substring_index(t2.user_addr2,' ', 2) end from usedtrade t1, user t2 where t1.user_nick = t2.user_nick and trade_complete = 0 and t2.user_addr2 like concat('%',?,'%') order by trade_count desc";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, word);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TradeDTO dto = new TradeDTO();
				dto.setTr_no(rs.getInt(1));
				dto.setTr_user_nick(rs.getString(2));
				dto.setTr_category(rs.getString(3));
				dto.setTr_title(rs.getString(4));
				dto.setTr_content(rs.getString(5));
				dto.setTr_date(rs.getTimestamp(6));
				dto.setTr_count(rs.getInt(7));
				dto.setTr_evalue(rs.getInt(8));
				dto.setTr_price(rs.getString(9));
				dto.setTr_photo(rs.getString(10));
				dto.setTr_complete(rs.getInt(11));
				dto.setUser_addr2(rs.getNString(12));
				
				tradeList.add(dto);
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
		
		return tradeList;
	}
}




























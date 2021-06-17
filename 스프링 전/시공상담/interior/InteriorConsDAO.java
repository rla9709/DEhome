package interior;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class InteriorConsDAO {
	private static InteriorConsDAO instance = new InteriorConsDAO();
	
	public static InteriorConsDAO getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	/*--세션 유저 위치 정보 가져오기--*/
	public String userAddr(String in_user_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String addr = "";
		
		try {
			con = getConnection();
			sql = "select case when left(user_addr2,1) = '경' then substring_index(user_addr2,' ', 3) when left(user_addr2,1) = '전' then substring_index(user_addr2,' ', 3) when left(user_addr2,1) = '충' then substring_index(user_addr2,' ', 3) when left(user_addr2,1) = '강' then substring_index(user_addr2,' ', 3) else substring_index(user_addr2,' ', 2) end from user where user_nick = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, in_user_nick);
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
	
	
	/*--위치값에 해당하는 기업 가지고 오기--*/
	public ArrayList<InteriorDTO> locList(String select_addr) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<InteriorDTO> comList = new ArrayList<InteriorDTO>();		
		
		String addr = "%" + select_addr + "%";
		
		try {
			
			con = getConnection();
			sql = "select * from company where com_addr like ? order by com_rating desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, addr);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				InteriorDTO board = new InteriorDTO();
				
				board.setIn_com_name(rs.getString(1));
				board.setIn_com_addr(rs.getString(2));
				board.setIn_com_rating(rs.getFloat(3));
				board.setIn_com_title(rs.getString(4));
				board.setIn_com_content(rs.getString(5));
				board.setIn_com_contract(rs.getInt(6));
				board.setIn_com_file(rs.getString(7));
				
				comList.add(board);
				
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
		
		return comList;
	}
	
	/*--해당하는 기업 평점 가지고 오기--*/
	public float comRating(String com_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		float re = 0;
		
		try {
			
			con = getConnection();
			sql = "select round((com_rating / (select count(*) from review where com_name = ?)),1) from company where com_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, com_name);
			pstmt.setString(2, com_name);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = rs.getFloat(1);
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
	
	
	/*--select 위치 주소 한글처리--*/
	public String locToKor(String select_addr) {
		String addr_kor = "";
		
		switch (select_addr) {
		case "seoul":
			addr_kor = "서울";
			break;
		case "incheon":
			addr_kor = "인천";
			break;
		case "busan":
			addr_kor = "부산";
			break;
		}
		
		switch (select_addr) {
			case "busan1":
				addr_kor = "강서구";
				break;
			case "busan2":
				addr_kor = "금정구";
				break;
			case "busan3":
				addr_kor = "기장군";
				break;
		}
		
		return addr_kor;
	}
	
	/*--업체 리뷰 건수 셋팅--*/
	public int comReviewCount(String com_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			sql = "select count(*) from review where com_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, com_name);
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
	
	
}

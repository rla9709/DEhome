package interior;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class InteriorComPageDAO {
private static InteriorComPageDAO instance = new InteriorComPageDAO();
	
	public static InteriorComPageDAO getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	//선택한 해당 업체의 시공사례 리스트 화면에 뿌리기
	public ArrayList<InteriorDTO> consCaseList(String com_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<InteriorDTO> list = new ArrayList<InteriorDTO>();
		try {
			sql = "select ex_no ,ex_file, ex_title from con_example where com_name = ?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, com_name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				InteriorDTO dto = new InteriorDTO();
				dto.setIn_ex_no(rs.getInt(1));
				dto.setIn_ex_file(rs.getString(2));
				dto.setIn_ex_title(rs.getString(3));
				
				list.add(dto);
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
		
		return list;
	}
	
	/*--선택한 해당 업체의 시공리뷰 리스트 화면에 뿌리기--*/
	public ArrayList<InteriorDTO> reviewList(String com_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<InteriorDTO> reviewlist = new ArrayList<InteriorDTO>();
		try {
//			sql = "select a.* from review a, re_interest b where a.re_no = b.re_no and a.com_name = ? group by re_no order by count(b.re_no) desc";
			sql = "select * from review where com_name = ? order by re_interest desc";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, com_name);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				InteriorDTO dto = new InteriorDTO();
				dto.setRe_no(rs.getInt(1));
				dto.setCom_name(rs.getString(2));
				dto.setUser_nick(rs.getString(3));
				dto.setRe_title(rs.getString(4));
				dto.setRe_content(rs.getString(5));
				dto.setRe_file(rs.getString(6));
				dto.setRe_date(rs.getTimestamp(7));
				
				reviewlist.add(dto);
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
		
		return reviewlist;
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
	
	/*--해당 업체 정보 받아오기--*/
	public InteriorDTO company(String com_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		InteriorDTO board = new InteriorDTO();
		
		try {
			
			con = getConnection();
			sql = "select com_name, com_addr, round((com_rating / (select count(*) from review where com_name = ?)),1), com_title, com_content, com_contract, com_file from company where com_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, com_name);
			pstmt.setString(2, com_name);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board.setIn_com_name(rs.getString(1));
				board.setIn_com_addr(rs.getString(2));
				board.setIn_com_rating(rs.getFloat(3));
				board.setIn_com_title(rs.getString(4));
				board.setIn_com_content(rs.getString(5).replace("\r\n", "<br>"));
				board.setIn_com_contract(rs.getInt(6));
				board.setIn_com_file(rs.getString(7));
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
	
	/*--해당 업체 리뷰 건수 받아오기--*/
	public int reviewCount(String com_name) {
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


























package interior;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;
import trade.TradeDTO;

public class InteriorTipDAO {
	private static InteriorTipDAO instance = new InteriorTipDAO();
	
	public static InteriorTipDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initCTX = new InitialContext();
		Context envCTX = (Context)initCTX.lookup("java:comp/env");
		DataSource ds = (DataSource)envCTX.lookup("jdbc/mysql");
		
		return ds.getConnection();
	}
	
	// 인테리어 팁 작성
	public int insertTip(InteriorDTO dto, String nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "insert into interior_tip values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, dto.getTip_no());
			pstmt.setString(2, nick);
			pstmt.setString(3, dto.getTip_category());
			pstmt.setString(4, dto.getTip_title());
			pstmt.setString(5, dto.getTip_content());
			pstmt.setString(6, dto.getTip_file());
			pstmt.setTimestamp(7, dto.getTip_date());
			pstmt.setInt(8, dto.getTip_count());
			pstmt.setInt(9, dto.getTip_bookmark());

			pstmt.executeUpdate();
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
		return 1;
	}
	
	//인테리어 팁 목록 카테고리 별로 뿌리는 메소드
		public ArrayList<InteriorDTO> interiorTipCategoryList(String category) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			ArrayList<InteriorDTO> tipList = new ArrayList<InteriorDTO>();
			
			try {
				sql = "select tip_no"
						+ ", user_nick"
						+ ", category"
						+ ", tip_title"
						+ ", tip_content"
						+ ", tip_file"
						+ ", tip_date"
						+ ", tip_count"
						+ ", tip_bookmark "
						+ "from interior_tip "
						+ "where category = ? "
						+ "order by tip_count desc";
				
				con = getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					InteriorDTO dto = new InteriorDTO();
					dto.setTip_no(rs.getInt(1));
					dto.setTip_user_nick(rs.getString(2));
					dto.setTip_category(rs.getString(3));
					dto.setTip_title(rs.getString(4));
					dto.setTip_content(rs.getString(5));
					dto.setTip_file(rs.getString(6));
					dto.setTip_date(rs.getTimestamp(7));
					dto.setTip_count(rs.getInt(8));
					dto.setTip_bookmark(rs.getInt(9));
					
					tipList.add(dto);
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
			
			return tipList;
		}
		
		// 조회수 증가하는 메서드
		public void updateTipCount(int tip_no) throws SQLException {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "";
			try {
				con = getConnection();
				sql = "update interior_tip set tip_count = tip_count + 1 where tip_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, tip_no);
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (con != null)
						con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
		
		// 팁 상세 확인 메서드
		public InteriorDTO getTip(int tip_no) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			InteriorDTO dto = null;

			try {
				con = getConnection();
				sql = "select * from interior_tip where tip_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, tip_no);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					dto = new InteriorDTO();
					dto.setTip_no(rs.getInt(1));
					dto.setTip_user_nick(rs.getString(2));
					dto.setTip_category(rs.getString(3));
					dto.setTip_title(rs.getString(4));
					dto.setTip_content(rs.getString(5));
					dto.setTip_file(rs.getString(6));
					dto.setTip_date(rs.getTimestamp(7));
					dto.setTip_count(rs.getInt(8));
					dto.setTip_bookmark(rs.getInt(9));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (con != null)
						con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return dto;
		}
}

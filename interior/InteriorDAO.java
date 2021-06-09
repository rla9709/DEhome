package interior;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;
import trade.TradeDTO;

public class InteriorDAO {
	private static InteriorDAO instance = new InteriorDAO();
	
	public static InteriorDAO getInstance() {
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
			pstmt.setString(4, HanConv.toKor(dto.getTip_title()));
			pstmt.setString(5, HanConv.toKor(dto.getTip_content()));
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
				sql = "select t1.tip_no"
						+ ", t1.user_nick"
						+ ", t1.category"
						+ ", t1.tip_title"
						+ ", t1.tip_content"
						+ ", t1.tip_file"
						+ ", t1.tip_date"
						+ ", t1.tip_count"
						+ ", t1.tip_bookmark"
						+ "from interior_tip t1, user t2 "
						+ "where t1.user_nick = t2.user_nick and category = ? "
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
}

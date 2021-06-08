package interior;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

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
			pstmt.setString(3, dto.getTip_cat());
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
}

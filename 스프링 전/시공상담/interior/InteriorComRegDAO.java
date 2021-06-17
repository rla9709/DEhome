package interior;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;


public class InteriorComRegDAO {
	
	private static InteriorComRegDAO instance = new InteriorComRegDAO();
	
	public static InteriorComRegDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initCTX = new InitialContext();
		Context envCTX = (Context)initCTX.lookup("java:comp/env");
		DataSource ds = (DataSource)envCTX.lookup("jdbc/mysql");
		
		return ds.getConnection();
	}
	
	
	//업체등록 메서드
	public int insertCom(InteriorDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			con = getConnection();
			sql = "insert into company values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getIn_com_name());
			pstmt.setString(2, dto.getIn_com_addr());
			pstmt.setFloat(3, dto.getIn_com_rating());
			pstmt.setString(4, dto.getIn_com_title());
			pstmt.setString(5, dto.getIn_com_content());
			pstmt.setInt(6, dto.getIn_com_contract());
			pstmt.setString(7, dto.getIn_com_file());
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
}

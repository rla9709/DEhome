package interior;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MyInteriorReviewDAO {

private static MyInteriorReviewDAO instance = new MyInteriorReviewDAO();
	
	public static MyInteriorReviewDAO getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
/*---	내 시공리뷰		---*/
	
	public ArrayList<InteriorReviewDTO> myReview(String nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2= null;
		String sql = "";
		InteriorReviewDTO dto;
		ArrayList<InteriorReviewDTO> dtos = new ArrayList<InteriorReviewDTO>();
		
		try {
			con = getConnection();
			sql = "select RE_NO,COM_NAME,USER_NICK,RE_TITLE,RE_CONTENT from review "
					+ "where USER_NICK = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nick);

			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				String com_name = rs.getString(2);
				sql = "select com_rating from company where com_name = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,com_name);
				
				rs2 = pstmt.executeQuery();
				dto = new InteriorReviewDTO();
				
				dto.setRe_no(rs.getInt(1));
				dto.setCom_name(rs.getString(2));
				dto.setUser_nick(rs.getString(3));
				dto.setRe_title(rs.getString(4));
				dto.setRe_content(rs.getString(5).replace("\r\n", "<br>"));
				if (rs2.next()) {
					dto.setCom_rating(rs2.getInt(1));
				}else {
					dto.setCom_rating(0);
				}
				
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return dtos;
		
	}
	
	
}

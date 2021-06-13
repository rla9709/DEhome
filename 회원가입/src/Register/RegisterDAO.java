package Register;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RegisterDAO {
private static RegisterDAO instance = new RegisterDAO();
	
	public static RegisterDAO getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	
	/*--회원가입시 USER 테이블 회원닉네임 중복체크--*/
	public int searchNick(String input_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			sql = "select user_nick from user where user_nick = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_nick);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = 1;
			} else {
				re = -1;
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
	
	/*--회원가입시 USER 테이블 회원아이디 중복체크--*/
	public int searchId(String input_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			sql = "select user_id from user where user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = 1;
			} else {
				re = -1;
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
	
	
	/*--USER 테이블 회원등록--*/
	public int insertUser(RegisterDTO user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "insert into user values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			user.setReg_date(new Timestamp(System.currentTimeMillis()));
			
			
			pstmt.setString(1, user.getUser_nick());
			pstmt.setString(2, user.getUser_id());
			pstmt.setString(3, user.getUser_pw());
			pstmt.setString(4, user.getUser_name());
			pstmt.setInt(5, user.getUser_pnum());
			pstmt.setString(6, user.getUser_email());
			pstmt.setString(7, user.getUser_email2());
			pstmt.setString(8, user.getUser_sex());
			pstmt.setString(9, user.getUser_addr1());
			pstmt.setString(10, user.getUser_addr2());
			pstmt.setString(11, user.getUser_addr3());
			pstmt.setString(12, user.getUser_addr4());
			pstmt.setTimestamp(13, user.getReg_date());
			
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

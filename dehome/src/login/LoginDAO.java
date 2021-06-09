package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;


public class LoginDAO {
	
	private static LoginDAO instance = new LoginDAO();
	
	public static LoginDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initCTX = new InitialContext();
		Context envCTX = (Context)initCTX.lookup("java:comp/env");
		DataSource ds = (DataSource)envCTX.lookup("jdbc/mysql");
		
		return ds.getConnection();
	}
	
	//로그인 메서드
	public int userCheck(String id, String pw) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_pw from user where user_id = ?";
		String db_user_pw;
		int re = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_user_pw = rs.getString("user_pw");
				if(db_user_pw.equals(pw)) {
					re = 1;
				} else {
					re = 0;
				}
			} else {
				re = -1;
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return re;
	}
	
	//user 정보가져와서 세션에 담기 위한 메서드(로그인에서도 필요)
	public LoginDTO getUser(String id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		LoginDTO dto = null;
		
		try {
			sql = "select * from user where user_id = ?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new LoginDTO();
				dto.setUser_nick(rs.getString(1));
				dto.setUser_id(rs.getString(2));
				dto.setUser_pw(rs.getString(3));
				dto.setUser_name(rs.getString(4));
				dto.setUser_pnum(rs.getInt(5));
				dto.setUser_email(rs.getString(6));
				dto.setUser_email2(rs.getString(7));
				dto.setUser_sex(rs.getString(8));
				dto.setUser_addr1(rs.getString(9));
				dto.setUser_addr2(rs.getString(10));
				dto.setUser_addr3(rs.getString(11));
				dto.setUser_addr4(rs.getString(12));
				dto.setUser_addr4(rs.getString(12));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//아이디 찾기
	public String findID(String name, String email, String email2) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String id = null;
		
		try {
			sql = "select user_id from user "
					+ "where user_name = ? "
					+ "and user_email = ? "
					+ "and user_email2 = ? ";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, email2);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	//비밀번호 찾기
	public String findPW(String name, String id, String email, String email2) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String pw = null;
		
		try {
			sql = "select concat(left(user_pw,2),repeat(replace(mid(user_pw,3,length(user_pw)-4),mid(user_pw,3,length(user_pw)-4),'*'), length(mid(user_pw,3,length(user_pw)-4))),right(user_pw,2)) from user "
					+ "where user_id = ? "
					+ "and user_name = ? "
					+ "and user_email = ? "
					+ "and user_email2 = ?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, email2);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pw = rs.getString(1);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pw;
	}
}



























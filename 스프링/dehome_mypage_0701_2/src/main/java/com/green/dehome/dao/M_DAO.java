package com.green.dehome4.dao;

public class M_DAO {
	
	private static MypageDAO instance = new MypageDAO();
	
	public static MypageDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initCTX = new InitialContext();
		Context envCTX = (Context)initCTX.lookup("java:comp/env");
		DataSource ds = (DataSource)envCTX.lookup("jdbc/mysql");
		
		return ds.getConnection();
	}
	
	
	public MypageDTO getUser(String id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		MypageDTO dto = null;
		
		try {
			sql = "select * from user where user_id = ?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MypageDTO();
				dto.setUser_nick(rs.getString(1));
				dto.setUser_id(rs.getString(2));
				dto.setUser_pw(rs.getString(3));
				
				System.out.println(rs.getString(3));
				
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
	
	public int editAccount(MypageDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			con = getConnection();
			sql = "update user "
					+ "set user_nick = ?,USER_PW=?, USER_PNUM=?, USER_EMAIL=?,USER_EMAIL2=?, USER_ADDR=?,USER_ADDR2=?,USER_ADDR4=? "
					+ "where USER_NICK = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_nick());
			pstmt.setString(2, dto.getUser_pw());
			pstmt.setInt(3, dto.getUser_pnum());
			pstmt.setString(4, dto.getUser_email());
			pstmt.setString(5, dto.getUser_email2());
			pstmt.setString(6, dto.getUser_addr1());
			pstmt.setString(7, HanConv.toKor(dto.getUser_addr2()));
			pstmt.setString(8, HanConv.toKor(dto.getUser_addr4()));
			pstmt.setString(9, dto.getUser_nick());
			pstmt.executeUpdate();
			re = 1;
		}catch (Exception e) {
			 e.printStackTrace();
		}finally {

			try {
				if (rs!= null) {
					rs.close();
				}
				if (pstmt!= null) {
					pstmt.close();
				}
				if (con!= null) {
					con.close();
				}
			} catch (Exception e2) {
				 e2.printStackTrace();
			}
		
		}
		return re;
	}
	

	public int deleteAccount(String user_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		MypageDTO dto =  new MypageDTO();

		try {
			con = getConnection();
			sql = "delete from user where user_nick=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_nick);
			pstmt.executeUpdate();
			re = 1;
				
		} catch (Exception e) {
			 e.printStackTrace();
		}finally {
			try {
				if (rs!= null) {
					rs.close();
				}
				if (pstmt!= null) {
					pstmt.close();
				}
				if (con!= null) {
					con.close();
				}
			} catch (Exception e2) {
				 e2.printStackTrace();
			}
		}
		return re;

}

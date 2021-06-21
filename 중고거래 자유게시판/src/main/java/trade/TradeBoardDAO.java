package trade;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class TradeBoardDAO {

private static TradeBoardDAO instance = new TradeBoardDAO();
	
	public static TradeBoardDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	

	public int insertTradeBoard(TradeBoardDTO dto) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql ="";
		int number ;
		
		int tr_board_id = dto.getTr_board_id();
		
		try {
			con = getConnection();
//			sql = "select max(board_id) from trade_board";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {//���� ������ ��
//				number = rs.getInt(1)+1;
//			}else {
//				number = 1;
//			}
			
			sql="insert into trade_board(board_id, user_nick, board_title, board_content, "
					+ "board_date, board_count, board_pw)"
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getTr_board_id());
			pstmt.setString(2, dto.getTr_user_nick());
			pstmt.setString(3,dto.getTr_board_title());
			pstmt.setString(4, dto.getTr_board_content());
			pstmt.setTimestamp(5, dto.getTr_board_date());
			pstmt.setInt(6, dto.getTr_board_count());
			pstmt.setString(7, dto.getTr_board_pw());
			pstmt.executeUpdate();
	
			System.out.println(dto.getTr_board_pw());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}
	
	public ArrayList<TradeBoardDTO> tradeBoardList(String pageNum) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ResultSet pageSet = null;
		int dbCount = 0;
		int absolutePage = 1;
		
		
		ArrayList<TradeBoardDTO> tradeBoardList = new ArrayList<TradeBoardDTO>();
		try {
			con = getConnection();
			stmt = con.createStatement();
			sql = "select count(board_id) from trade_board ";
			pageSet =  stmt.executeQuery(sql);
			
			if (pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if (dbCount % TradeBoardDTO.pageSize == 0) {
				TradeBoardDTO.pageCount =  dbCount / TradeBoardDTO.pageSize;
			}else {
				TradeBoardDTO.pageCount =  dbCount / TradeBoardDTO.pageSize + 1;
			}
			
			if (pageNum != null) {
				TradeBoardDTO.pageNum = Integer.parseInt(pageNum);
				absolutePage = (TradeBoardDTO.pageNum-1) * TradeBoardDTO.pageSize + 1;
			}
//			stmt = con.createStatement();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			// �Ű����� 2�� -> ����¡ -��ũ��, Ŀ���� ����
			sql = "select * from trade_board order by board_id desc";
//			sql = "select t1.BOARD_ID, t1.USER_NICK, t1.BOARD_TITLE, t1.BOARD_CONTENT"
//					+ ", t1.BOARD_DATE,t1.BOARD_COUNT,t1.BOARD_PW,t1.BOARD_PAGENUM"
//					+ "from TRADE_BOARD t1, user t2 where t1.user_nick = t2.user_nick order by BOARD_ID desc";
//			String sql = "select n.* "
//					+ "from non_face n join user_tbl u "
//					+ "on n.user_tbl_u_id = u.u_id "
//					+ "order by u.u_manager desc, n.nf_num desc";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while(count < TradeBoardDTO.pageSize) {
					TradeBoardDTO dto = new TradeBoardDTO();
					dto.setTr_board_id(rs.getInt(1));
					dto.setTr_user_nick(rs.getString(2));
					dto.setTr_board_title(rs.getString(3));
					dto.setTr_board_content(rs.getString(4));
					dto.setTr_board_date(rs.getTimestamp(5));
					dto.setTr_board_count(rs.getInt(6));
					dto.setTr_board_pw(rs.getString(7));
					
					tradeBoardList.add(dto);
					
					if (rs.isLast()) {
						break;	
					}else {
						rs.next();
					}
					count ++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return tradeBoardList;
	}
	
	
	public ArrayList<TradeBoardDTO> myTradeBoardList(String nick, String pageNum) {
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ResultSet pageSet = null;
		int dbCount = 0;
		int absolutePage = 1;
		
		
		ArrayList<TradeBoardDTO> tradeBoardList = new ArrayList<TradeBoardDTO>();
		try {
			con = getConnection();
			stmt = con.createStatement();
			sql = "select count(board_id) from trade_board where user_nick=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nick);
			pageSet =  pstmt.executeQuery();
			
			if (pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if (dbCount % TradeBoardDTO.pageSize == 0) {
				TradeBoardDTO.pageCount =  dbCount / TradeBoardDTO.pageSize;
			}else {
				TradeBoardDTO.pageCount =  dbCount / TradeBoardDTO.pageSize + 1;
			}
			
			if (pageNum != null) {
				TradeBoardDTO.pageNum = Integer.parseInt(pageNum);
				absolutePage = (TradeBoardDTO.pageNum-1) * TradeBoardDTO.pageSize + 1;
			}
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			
			sql = "select * from trade_board where USER_NICK=? order by board_id desc";
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while(count < TradeBoardDTO.pageSize) {
					TradeBoardDTO dto = new TradeBoardDTO();
					dto.setTr_board_id(rs.getInt(1));
					dto.setTr_user_nick(rs.getString(2));
					dto.setTr_board_title(rs.getString(3));
					dto.setTr_board_content(rs.getString(4));
					dto.setTr_board_date(rs.getTimestamp(5));
					dto.setTr_board_count(rs.getInt(6));
					dto.setTr_board_pw(rs.getString(7));
					
					tradeBoardList.add(dto);
					
					if (rs.isLast()) {
						break;	
					}else {
						rs.next();
					}
					count ++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return tradeBoardList;
	}
//	
//	public ArrayList<TradeBoardDTO> myTradeBoardList(String nick, String pageNum) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "";
//		
//		
//		ArrayList<TradeBoardDTO> tradeBoardList = new ArrayList<TradeBoardDTO>();
//		try {
//			con = getConnection();
//			sql = "select * from trade_board where USER_NICK=? order by board_id desc";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, nick);
//			rs =  pstmt.executeQuery();
//			
//			System.out.println("닉 :"+nick);
//			
//			while (rs.next()) {
//					TradeBoardDTO dto = new TradeBoardDTO();
//					dto.setTr_board_id(rs.getInt(1));
//					dto.setTr_user_nick(rs.getString(2));
//					dto.setTr_board_title(rs.getString(3));
//					dto.setTr_board_content(rs.getString(4));
//					dto.setTr_board_date(rs.getTimestamp(5));
//					dto.setTr_board_count(rs.getInt(6));
//					dto.setTr_board_pw(rs.getString(7));
//					
//					tradeBoardList.add(dto);
//					System.out.println("리스트");
////					if (rs.isLast()) {
////						break;	
////					}else {
////						rs.next();
////					}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) rs.close();
//				if (pstmt != null) pstmt.close();
//				if (con != null) con.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		
//		return tradeBoardList;
//	}
	
	public void hitTradeBoard(int tr_b_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmtUp=null;
		ResultSet rs = null;
		String sql ="";
		TradeBoardDTO dto = null;
		
		try {
			con = getConnection();
				sql = "update trade_board set board_count = board_count +1 where board_id = ?";
				pstmtUp = con.prepareStatement(sql);
				pstmtUp.setInt(1, tr_b_id);
				pstmtUp.executeUpdate();
				pstmtUp.close();
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
			
	}
	public TradeBoardDTO getTradeBoard(int tr_b_id, boolean b) throws Exception{
		Connection con=null;
		PreparedStatement pstmtUp=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql ="";
		TradeBoardDTO dto = null;
		
		try {
			con = getConnection();
			if (b = false) {
				sql = "update trade_board set board_count = board_count +1 where board_id = ?";
				pstmtUp = con.prepareStatement(sql);
				pstmtUp.setInt(1, tr_b_id);
				pstmtUp.executeUpdate();
				pstmtUp.close();
			}
			
				sql = "select * from trade_board where board_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, tr_b_id);
				rs = pstmt.executeQuery();
				
			if (rs.next()) {
				dto = new TradeBoardDTO();
				dto.setTr_board_id(rs.getInt(1));
				dto.setTr_user_nick(rs.getString(2));
				dto.setTr_board_title(rs.getString(3));
				dto.setTr_board_content(rs.getString(4));
				dto.setTr_board_date(rs.getTimestamp(5));
				dto.setTr_board_count(rs.getInt(6));
				dto.setTr_board_pw(rs.getString(7));
			}
		}
		 catch (Exception e) {
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
	
		return dto;
	}


	public int deleteTradeBoard(int tr_b_id, String tr_b_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		String pwd = "";
		TradeBoardDTO dto =  new TradeBoardDTO();

		try {
			con = getConnection();
			sql = "select board_pw from trade_board where board_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tr_b_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				System.out.println(pwd);
				System.out.println(tr_b_pwd);
				if (! pwd.equals(tr_b_pwd)) {
					re= 0;
				}else {
					sql = "delete from trade_board where board_id=?";
//					sql = "delete trade_board";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, tr_b_id);
					pstmt.executeUpdate();
					re = 1;
				}
				
			}
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
	

	public int editTradeBoard(TradeBoardDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		String pwd="";
		
		try {
			con = getConnection();
			sql = "select board_pw from trade_board where board_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getTr_board_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				System.out.println(pwd);
				System.out.println(dto.getTr_board_pw());
				if (! pwd.equals(dto.getTr_board_pw())) {
					re= 0;
				}else {
					sql = "update trade_board "
							+ "set board_title=?, board_content=? "
							+ "where board_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,dto.getTr_board_title());
					pstmt.setString(2,dto.getTr_board_content());
					pstmt.setInt(3, dto.getTr_board_id());
					pstmt.executeUpdate();
					re = 1;
				}
				
			}
		
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
	


}

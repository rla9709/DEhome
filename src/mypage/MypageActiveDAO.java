package mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MypageActiveDAO {
	public static MypageActiveDAO instance = new MypageActiveDAO();
	
	public static MypageActiveDAO getInstance() {
		return instance;
	}
	private Connection getConnection() throws Exception {
		Context initCTX = new InitialContext();
		Context envCTX = (Context)initCTX.lookup("java:comp/env");
		DataSource ds = (DataSource)envCTX.lookup("jdbc/mysql");
		
		return ds.getConnection();
	}
	
	// 나의 QNA 출력하는 메소드
	public ArrayList<MypageDTO> myqna_list(String pageNumber, String user_nick) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int dbCount = 0;
		int absolutepage = 0;
		
		ArrayList<MypageDTO> qnaList = new ArrayList<MypageDTO>();
		
		try {
			// 페이징 처리
			con = getConnection();
			
			sql = "select count(qna_no) from qna where user_nick = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_nick);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbCount = rs.getInt(1);
				rs.close();
			}
			
			if (dbCount % MypageDTO.myqna_pageSize == 0) {
				MypageDTO.myqna_pageCount = dbCount / MypageDTO.myqna_pageSize;
			} else {
				MypageDTO.myqna_pageCount = dbCount / MypageDTO.myqna_pageSize + 1;
			}
			
			if (pageNumber != null) {
				MypageDTO.myqna_pageNum = Integer.parseInt(pageNumber);
				absolutepage = (MypageDTO.myqna_pageNum-1) * MypageDTO.myqna_pageSize + 1;
			}
			pstmt.close();
			
			// 나의 qna 뿌리기
			sql = "select qna_no, qna_type, qna_title, qna_date, qna_process from qna where user_nick = ? order by qna_no desc";
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, user_nick);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rs.absolute(absolutepage);
				int count = 0;
				while (count < MypageDTO.myqna_pageSize) {
					MypageDTO dto = new MypageDTO();
					dto.setQna_no(rs.getInt(1));
					dto.setQna_type(rs.getString(2));
					dto.setQna_title(rs.getString(3));
					dto.setQna_date(rs.getTimestamp(4));
					dto.setQna_process(rs.getString(5));

					qnaList.add(dto);
					if(rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
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
		return qnaList;
	}
	
	
}

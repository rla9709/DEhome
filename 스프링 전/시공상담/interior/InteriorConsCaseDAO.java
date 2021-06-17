package interior;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//시공사례 관련 dao파일
public class InteriorConsCaseDAO {
	private static InteriorConsCaseDAO instance = new InteriorConsCaseDAO();
	
	public static InteriorConsCaseDAO getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	//시공사례 상세페이지 화면에 내용 뿌리는 메서드
	public InteriorDTO consDetail(int ex_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		InteriorDTO dto = null;
		
		try {
			sql = "select * from con_example where ex_no = ?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ex_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new InteriorDTO();
				dto.setIn_ex_no(rs.getInt(1));
				dto.setIn_com_name(rs.getString(2));
				dto.setIn_ex_title(rs.getString(3));
				dto.setIn_ex_content(rs.getString(4).replace("\r\n", "<br>"));
				dto.setIn_ex_file(rs.getString(5));
				dto.setIn_reg_date(rs.getTimestamp(6));
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
		
		return dto;
	}
	
	//시공사례 작성하는 메서드
	public int insertCase(InteriorDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = 0;
		
		try {
			con = getConnection();
			sql = "insert into con_example(com_name, ex_title,ex_content,ex_file,reg_date) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getIn_com_name());
			pstmt.setString(2, dto.getIn_ex_title());
			pstmt.setString(3, dto.getIn_ex_content());
			pstmt.setString(4, dto.getIn_ex_file());
			pstmt.setTimestamp(5, dto.getIn_reg_date());
			
			re = pstmt.executeUpdate();
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
	
	//시공사례 수정하는 메서드
	public int updateCase(String title, String content, String file, int ex_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			sql = "update con_example set ex_title = ?, ex_content = ?, ex_file = ? where ex_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, file);
			pstmt.setInt(4, ex_no);
			pstmt.executeUpdate();
			
			re = 1; //성공시 1을 리턴
			
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



























package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.InsuranceInfoDTO;
import db.dto.MemberInfoDTO;
import db.dto.PaymentInfoDTO;
import db.util.DBConnectionManager;

public class PaymentInfoDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 결제정보찾기리스트
	public List<PaymentInfoDTO> findPaymentInfoList() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM payment_info ";

		List<PaymentInfoDTO> paymentInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			paymentInfoList = new ArrayList<PaymentInfoDTO>();

			while (rs.next()) {
				PaymentInfoDTO paymentInfoDTO = new PaymentInfoDTO(rs.getInt("payment_number"),rs.getInt("payment_price"),rs.getString("payment_type"),rs.getString("payment_time"),rs.getInt("reservation_number"),rs.getInt("payment_state"));

				paymentInfoList.add(paymentInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return paymentInfoList;
	}
	
	
	// 저장   ... 
	
		public int savePaymentInfo(int payment_price , String Payment_type, int Reservation_number) {

			conn = DBConnectionManager.connectDB();

			String sql = " INSERT INTO payment_info VALUES( (SELECT NVL(MAX(payment_number), 0) + 1 FROM payment_info) , ?, ? , TO_CHAR(sysdate, 'YYYY-MM-DD HH:MM') , ? , 1 ) "   ;

			int result = 0;

			try {
				psmt = conn.prepareStatement(sql);

				psmt.setInt(1,payment_price );
				psmt.setString(2, Payment_type);
				psmt.setInt(3, Reservation_number);
		
				result = psmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}

			return result;
		}
		
		
		//결제 타입만 보여주는 리스트
		public List<PaymentInfoDTO> findPaymentTypeInfoList() {

			conn = DBConnectionManager.connectDB();

			String sql = " SELECT payment_type FROM payment_info "
					+ " GROUP BY payment_type ";

			List<PaymentInfoDTO> paymentInfoList = null;

			try {
				psmt = conn.prepareStatement(sql);
				

				rs = psmt.executeQuery();
				paymentInfoList = new ArrayList<PaymentInfoDTO>();

				while (rs.next()) {
					PaymentInfoDTO paymentInfoDTO = new PaymentInfoDTO(rs.getString("payment_type"));

					paymentInfoList.add(paymentInfoDTO);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}

			return paymentInfoList;
		}
	
	
}

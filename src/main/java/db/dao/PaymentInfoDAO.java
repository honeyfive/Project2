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
	
	// 결제정보찾기리스트
		public List<PaymentInfoDTO> dailyPaymentsList() {

			conn = DBConnectionManager.connectDB();

			String sql = " SELECT PAYMENT_DATE, TOTAL_AMOUNT, PAYMENT_COUNT FROM (SELECT TO_CHAR(TO_DATE(PAYMENT_TIME, 'YYYY-MM-DD HH24:MI'), 'YYYY-MM-DD') AS PAYMENT_DATE, SUM(PAYMENT_PRICE) AS TOTAL_AMOUNT, COUNT(PAYMENT_PRICE) AS PAYMENT_COUNT FROM PAYMENT_INFO GROUP BY TO_CHAR(TO_DATE(PAYMENT_TIME, 'YYYY-MM-DD HH24:MI'), 'YYYY-MM-DD') UNION ALL SELECT 'TOTAL', SUM(PAYMENT_PRICE), COUNT(PAYMENT_PRICE) FROM PAYMENT_INFO) Result ORDER BY CASE WHEN PAYMENT_DATE = 'TOTAL' THEN 1 ELSE 0 END, PAYMENT_DATE ";

			List<PaymentInfoDTO> paymentInfoList = null;

			try {
				psmt = conn.prepareStatement(sql);

				rs = psmt.executeQuery();
				paymentInfoList = new ArrayList<PaymentInfoDTO>();

				while (rs.next()) {
					PaymentInfoDTO paymentInfoDTO = new PaymentInfoDTO(rs.getString("PAYMENT_DATE"), rs.getString("TOTAL_AMOUNT"), rs.getString("PAYMENT_COUNT"));

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
	
		public int savePaymentInfo(int payment_number, int payment_price , String Payment_type, String Payment_time, int Reservation_number, int Payment_state) {

			conn = DBConnectionManager.connectDB();

			String sql = " INSERT INTO payment_info VALUES( ?, ?, ? , ?, ? , ? ) "   ;

			int result = 0;

			try {
				psmt = conn.prepareStatement(sql);

				psmt.setInt(1, payment_number);
				psmt.setInt(2, payment_price);
				psmt.setString(3, Payment_type);
				psmt.setString(4, Payment_time);
				psmt.setInt(5, Reservation_number);
				psmt.setInt(6, Payment_state);

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

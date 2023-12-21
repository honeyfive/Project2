package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.InsuranceInfoDTO;
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
}
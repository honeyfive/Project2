package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.dto.ReservationCancelDTO;
import db.util.DBConnectionManager;

public class ReservationCancelDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 예약 취소 테이블에 추가하기
	public ReservationCancelDTO saveReservationCancel(int targetReservationNumber, int targetMembershipNumber) {

		conn = DBConnectionManager.connectDB();
		String sql = " INSERT INTO reservation_cancellation (reservation_number, membership_number, cancellation_fee, cancellation_date) "
				+ " VALUES ( "
				+ "    ? , "
				+ "    ? , "
				+ "    NVL( "
				+ "        (SELECT 0.1 * crm.rental_costs "
				+ "         FROM car_rental_management crm, reservation_information ri "
				+ "         WHERE crm.car_number = ri.car_number "
				+ "           AND ROWNUM = 1), "
				+ "        0  "
				+ "    ), "
				+ "    TO_CHAR(SYSDATE) "
				+ ") ";

		ReservationCancelDTO reservationCancelDTO = null;
		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, targetReservationNumber);
			psmt.setInt(2, targetMembershipNumber);	
			
			psmt.executeUpdate();
			reservationCancelDTO = new ReservationCancelDTO(targetReservationNumber, targetReservationNumber, 0, null);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationCancelDTO;
	}
}
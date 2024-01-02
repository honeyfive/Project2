package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.HistoryInfoDTO;
import db.dto.ReservationHistoryDTO;
import db.util.DBConnectionManager;

public class ReservationHistoryDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 회원번호를 이용해서 마이페이지에서 렌트내역 확인하기
	public List<ReservationHistoryDTO> findReservationHistoryListByMembershipNumber(int targetMembershipNumber) {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT r.rental_date rental_date, r.rental_place rental_place, h.real_return_date real_return_date, r.return_place return_place, "
				+ " h.overdue_history overdue_history, round((TO_DATE(real_return_date, 'YYYY-MM-DD HH24:MI') - TO_DATE(rental_date, 'YYYY-MM-DD HH24:MI')) * 24 * 60) total_rental_date, "
				+ " r.car_number car_number " + " FROM reservation_information r, history_info h "
				+ " WHERE r.reservation_number = h.reservation_number AND r.membership_number = ? ";

		List<ReservationHistoryDTO> reservationHistoryList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, targetMembershipNumber);
			rs = psmt.executeQuery();
			reservationHistoryList = new ArrayList<ReservationHistoryDTO>();

			while (rs.next()) {
				ReservationHistoryDTO reservationHistoryDTO = new ReservationHistoryDTO(rs.getString("rental_date"),
						rs.getString("rental_place"), rs.getString("real_return_date"), rs.getString("return_place"),
						rs.getInt("overdue_history"), rs.getInt("total_rental_date"), rs.getString("car_name"));

				reservationHistoryList.add(reservationHistoryDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationHistoryList;
	}
}
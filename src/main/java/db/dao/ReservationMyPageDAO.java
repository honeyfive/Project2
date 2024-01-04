package db.dao;

// 회원번호로 예약 내역 리스트 불러오기

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.ReservationMyPageDTO;
import db.util.DBConnectionManager;

public class ReservationMyPageDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public List<ReservationMyPageDTO> findReservationListByMembershipNumber(int targetNumber) {
		conn = DBConnectionManager.connectDB();
		String sql = " select reservation_number, rental_date, rental_place, return_date, return_place, car_number "
				+ " from reservation_information " + " where membership_number = ? ";

		List<ReservationMyPageDTO> reservationMyPageList = new ArrayList<ReservationMyPageDTO>();

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, targetNumber);

			rs = psmt.executeQuery();

			while (rs.next()) {
				ReservationMyPageDTO reservationMyPageDTO = new ReservationMyPageDTO(rs.getInt("reservation_number"),
						rs.getString("rental_date"), rs.getString("rental_place"), rs.getString("return_date"),
						rs.getString("return_place"), rs.getString("car_number"));

				reservationMyPageList.add(reservationMyPageDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationMyPageList;

	}
}
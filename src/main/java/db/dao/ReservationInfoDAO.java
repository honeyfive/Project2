package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.ReservationInfoDTO;
import db.util.DBConnectionManager;

public class ReservationInfoDAO {
	
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	//예약확인찾기 리스트
	
		public List<ReservationInfoDTO> findReservationInfoList() {

			conn = DBConnectionManager.connectDB();

			String sql = " select * from reservation_information";

			List<ReservationInfoDTO> reservationInfoList = null;

			try {
				psmt = conn.prepareStatement(sql);

				rs = psmt.executeQuery();
				reservationInfoList = new ArrayList<ReservationInfoDTO>();

				while (rs.next()) {
					ReservationInfoDTO reservationInfoDTO = new ReservationInfoDTO(
							rs.getInt("reservation_number"),rs.getString("rental_place"),rs.getString("return_place"),rs.getString("rental_date"),
							rs.getString("return_date"),rs.getInt("total_rental_date"),rs.getInt("total_rental_time"),
							rs.getInt("insurance_number"),rs.getString("car_number"),rs.getInt("membership_number"),rs.getInt("payment_number") );

					reservationInfoList.add(reservationInfoDTO);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}

			return reservationInfoList;
		
}
}

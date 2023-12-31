package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.ReservationInfoDTO;
import db.dto.ReservationInfoDTO2;
import db.util.DBConnectionManager;
import oracle.sql.ConcreteProxyUtil;

public class ReservationInfoDAO2 {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 예약확인찾기 리스트
	// 예약 전체 리스트
	public List<ReservationInfoDTO2> findReservationInfoList() {

		conn = DBConnectionManager.connectDB();

		String sql = " select * from reservation_information";

		List<ReservationInfoDTO2> reservationInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			reservationInfoList = new ArrayList<ReservationInfoDTO2>();

			while (rs.next()) {
				ReservationInfoDTO2 reservationInfoDTO = new ReservationInfoDTO2(rs.getInt("reservation_number"),
						rs.getString("rental_place"), rs.getString("return_place"), rs.getString("rental_date"),
						rs.getString("return_date"), rs.getInt("total_rental_date"), rs.getInt("total_rental_time"),
						rs.getInt("insurance_number"), rs.getString("car_number"), rs.getInt("membership_number"),
						rs.getInt("payment_number"));

				reservationInfoList.add(reservationInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationInfoList;
	}

	// 예약번호
	public ReservationInfoDTO2 findReservationInfoByRsrvNumber(int reservation_number) {
		conn = DBConnectionManager.connectDB();
		String sql = " select * from reservation_information " + " where reservation_number = ? ";

		ReservationInfoDTO2 reservationInfoDTO = null;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, reservation_number);

			rs = psmt.executeQuery();

			if (rs.next()) {
				reservationInfoDTO = new ReservationInfoDTO2(rs.getInt("reservation_number"),
						rs.getString("rental_place"), rs.getString("return_place"), rs.getString("rental_date"),
						rs.getString("return_date"), rs.getInt("total_rental_date"), rs.getInt("total_rental_time"),
						rs.getInt("insurance_number"), rs.getString("car_number"), rs.getInt("membership_number"),
						rs.getInt("payment_number"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationInfoDTO;

	}

	// 아산지역 대여장소리스트
	public List<ReservationInfoDTO2> findReservationInfoListByRentalPlaceAsan2() {

		conn = DBConnectionManager.connectDB();

		String sql = " select rental_place from reservation_information " + " where rental_place = '천안아산역 KTX 광장1' "
				+ " or rental_place = '선문대학교 본관 앞' " + " or rental_place = '배방 농협 하나로 마트' "
				+ " or rental_place = '아산 고속버스터미널 앞' " + " or rental_place = '탕정역 앞' " + " or rental_place = '온양온천역' "
				+ " or rental_place = '순천향대 정문 앞' ";

		List<ReservationInfoDTO2> reservationInfoListByRentalPlaceAsan = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			reservationInfoListByRentalPlaceAsan = new ArrayList<ReservationInfoDTO2>();

			while (rs.next()) {
				ReservationInfoDTO2 reservationInfoDTO = new ReservationInfoDTO2(rs.getString("rental_place"));

				reservationInfoListByRentalPlaceAsan.add(reservationInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationInfoListByRentalPlaceAsan;
	}

	// 천안지역 대여장소리스트
	public List<ReservationInfoDTO2> findReservationInfoListByRentalPlaceCheonan() {

		conn = DBConnectionManager.connectDB();

		String sql = " select rental_place from reservation_information where rental_place NOT IN('천안아산역 KTX 광장1', '선문대학교 본관 앞', '배방 농협 하나로 마트', '아산 고속버스터미널 앞', '탕정역 앞', '온양온천역', '순천향대 정문 앞') ";

		List<ReservationInfoDTO2> reservationInfoListByRentalPlaceCheonan = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			reservationInfoListByRentalPlaceCheonan = new ArrayList<ReservationInfoDTO2>();

			while (rs.next()) {
				ReservationInfoDTO2 reservationInfoDTO = new ReservationInfoDTO2(rs.getString("rental_place"));

				reservationInfoListByRentalPlaceCheonan.add(reservationInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationInfoListByRentalPlaceCheonan;
	}
	
	public int saveReservationInfo(int reservation_number, String rental_place, String return_place, String rental_date, String return_date,
			int total_rental_date, int total_rental_time, int insurance_number, String car_number, int membership_number, int payment_number) {

		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO car_info_check VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, reservation_number);
			psmt.setString(2, rental_place);
			psmt.setString(3, return_place);
			psmt.setString(4, rental_date);
			psmt.setString(5, return_date);
			psmt.setInt(6, total_rental_date);
			psmt.setInt(7, total_rental_time);
			psmt.setInt(8, insurance_number);
			psmt.setString(9, car_number);
			psmt.setInt(10, membership_number);
			psmt.setInt(11, payment_number);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}

}

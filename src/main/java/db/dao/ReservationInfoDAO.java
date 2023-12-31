package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.ReservationInfoDTO;
import db.util.DBConnectionManager;
import oracle.sql.ConcreteProxyUtil;

public class ReservationInfoDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 예약확인찾기 리스트
	// 예약 전체 리스트
	public List<ReservationInfoDTO> findReservationInfoList() {

		conn = DBConnectionManager.connectDB();

		String sql = " select * from reservation_information order by reservation_number";

		List<ReservationInfoDTO> reservationInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			reservationInfoList = new ArrayList<ReservationInfoDTO>();

			while (rs.next()) {
				ReservationInfoDTO reservationInfoDTO = new ReservationInfoDTO(rs.getInt("reservation_number"),
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
	public ReservationInfoDTO findReservationInfoByRsrvNumber(int reservation_number) {
		conn = DBConnectionManager.connectDB();
		String sql = " select * from reservation_information " + " where reservation_number = ? ";

		ReservationInfoDTO reservationInfoDTO = null;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, reservation_number);

			rs = psmt.executeQuery();

			if (rs.next()) {
				reservationInfoDTO = new ReservationInfoDTO(rs.getInt("reservation_number"),
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
	
	public ReservationInfoDTO findReservationByMembershipNumber(int membership_number) {
		conn = DBConnectionManager.connectDB();
		String sql = " select MAX(reservation_number) reservation_number from reservation_information " + " where membership_number = ? ";

		ReservationInfoDTO reservationInfoDTO = null;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, membership_number);

			rs = psmt.executeQuery();

			if (rs.next()) {
				reservationInfoDTO = new ReservationInfoDTO();
				reservationInfoDTO.setReservation_number(rs.getInt("reservation_number"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationInfoDTO;

	}

	// 아산지역 대여장소리스트
	public List<ReservationInfoDTO> findReservationInfoListByRentalPlaceAsan() {

		conn = DBConnectionManager.connectDB();

		String sql = " select rental_place from reservation_information " + " where rental_place = '천안아산역 KTX 광장1' "
				+ " or rental_place = '선문대학교 본관 앞' " + " or rental_place = '배방 농협 하나로 마트' "
				+ " or rental_place = '아산 고속버스터미널 앞' " + " or rental_place = '탕정역 앞' " + " or rental_place = '온양온천역' "
				+ " or rental_place = '순천향대 정문 앞' ";

		List<ReservationInfoDTO> reservationInfoListByRentalPlaceAsan = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			reservationInfoListByRentalPlaceAsan = new ArrayList<ReservationInfoDTO>();

			while (rs.next()) {
				ReservationInfoDTO reservationInfoDTO = new ReservationInfoDTO(rs.getString("rental_place"));

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
	public List<ReservationInfoDTO> findReservationInfoListByRentalPlaceCheonan() {

		conn = DBConnectionManager.connectDB();

		String sql = " select rental_place from reservation_information where rental_place NOT IN('천안아산역 KTX 광장1', '선문대학교 본관 앞', '배방 농협 하나로 마트', '아산 고속버스터미널 앞', '탕정역 앞', '온양온천역', '순천향대 정문 앞') ";

		List<ReservationInfoDTO> reservationInfoListByRentalPlaceCheonan = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			reservationInfoListByRentalPlaceCheonan = new ArrayList<ReservationInfoDTO>();

			while (rs.next()) {
				ReservationInfoDTO reservationInfoDTO = new ReservationInfoDTO(rs.getString("rental_place"));

				reservationInfoListByRentalPlaceCheonan.add(reservationInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationInfoListByRentalPlaceCheonan;
	}
	
	
	//결제하면 결제번호 수정
		public int modifyPaymentNumber(ReservationInfoDTO reservationInfo) {

	        conn = DBConnectionManager.connectDB();

	        String sql = " UPDATE reservation_information" 
	        			+ " SET payment_number = (select payment_number from payment_info where reservation_number = ? ) where reservation_number = ? " ;

	        int result = 0;

	        try {
	            psmt = conn.prepareStatement(sql);

	            psmt.setInt(1, reservationInfo.getReservation_number());
	            psmt.setInt(2, reservationInfo.getReservation_number());

	            result = psmt.executeUpdate();  

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBConnectionManager.closeDB(conn, psmt, rs);
	        }
	        return result;
	    }
	public int saveReservationInfo(String rental_place, String return_place, String rental_date, String return_date,
			String return_date1, String rental_date1, String return_date2, String rental_date2, int insurance_number, String car_number,
			int membership_number, int payment_number) {

		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO reservation_information VALUES((SELECT MAX(reservation_number) + 1 FROM reservation_information), ?, ?, ?, ?, CEIL(TO_DATE(?, 'YYYY-MM-DD HH24:MI') - TO_DATE(?, 'YYYY-MM-DD HH24:MI')), round((TO_DATE(?, 'YYYY-MM-DD HH24:MI') - TO_DATE(?, 'YYYY-MM-DD HH24:MI'))*24*60), ?, ?, ?, ?) ";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, rental_place);
			psmt.setString(2, return_place);
			psmt.setString(3, rental_date);
			psmt.setString(4, return_date);
			
			psmt.setString(5, return_date1);
			psmt.setString(6, rental_date1);
			psmt.setString(7, return_date2);
			psmt.setString(8, rental_date2);
			psmt.setInt(9, insurance_number);
			psmt.setString(10, car_number);
			psmt.setInt(11, membership_number);
			psmt.setInt(12, payment_number);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}

}

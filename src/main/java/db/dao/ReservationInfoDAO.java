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
	
	//예약확인찾기 리스트
		//예약 전체 리스트
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
		
		
		//예약번호 기준으로 예약정보 한개만 읽어오는 메소드 
		public ReservationInfoDTO findReservationInfoByRsrvNumber(int reservation_number) {
			 conn = DBConnectionManager.connectDB();
			 String sql = " select * from reservation_information "
					 		+ " where reservation_number = ? " ;
			 
			 ReservationInfoDTO reservationInfoDTO = null; 
			
			 try {
				 psmt = conn.prepareStatement(sql);
				 
				 psmt.setInt(1,reservation_number);
				 
				 rs = psmt.executeQuery(); 
				 
				 if(rs.next()) {
					 reservationInfoDTO = new ReservationInfoDTO (
							 rs.getInt("reservation_number"),rs.getString("rental_place"),rs.getString("return_place"),rs.getString("rental_date"),
								rs.getString("return_date"),rs.getInt("total_rental_date"),rs.getInt("total_rental_time"),
								rs.getInt("insurance_number"),rs.getString("car_number"),rs.getInt("membership_number"),rs.getInt("payment_number")
							 );
				 }
				 
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}
			
			return reservationInfoDTO ;
} }
		

		
		


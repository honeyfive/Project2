package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.CarInfoCheckDTO;
import db.util.DBConnectionManager;

public class CarInfoCheckDAO {
	
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 조회
	// 멤버정보찾기리스트
	public List<CarInfoCheckDTO> findCarInfoList() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM car_info ";

		List<CarInfoCheckDTO> carInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			carInfoList = new ArrayList<CarInfoCheckDTO>();

			while (rs.next()) {

				CarInfoCheckDTO carInfoDTO = new CarInfoCheckDTO(rs.getString("car_number"), rs.getString("car_name"),
						rs.getString("car_size"), rs.getString("car_type"), rs.getInt("passenger_count"), rs.getInt("vehicle_rating"),
						rs.getString("company"), rs.getString("color"), rs.getInt("model_year"),
						rs.getString("management_status"), rs.getString("option1"), rs.getString("option2"),
						rs.getInt("accident_history") );

				carInfoList.add(carInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return carInfoList;
	}
	
	public int findCarByTypeGasoline() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT COUNT(*) FROM car_info " + " WHERE car_type='G' ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findCarByTypeDiesel() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT COUNT(*) FROM car_info " + " WHERE car_type='D' ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findCarByTypeElectronic() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT COUNT(*) FROM car_info " + " WHERE car_type='E' ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findCarByTypeHydrogen() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT COUNT(*) FROM car_info " + " WHERE car_type='H' ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findCarByVehicleRating_1() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT count(*) FROM CAR_INFO WHERE vehicle_rating BETWEEN 0 AND 999 ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findCarByVehicleRating_2() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT count(*) FROM CAR_INFO WHERE vehicle_rating BETWEEN 1000 AND 2999 ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findCarByVehicleRating_3() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT count(*) FROM CAR_INFO WHERE vehicle_rating BETWEEN 3000 AND 4999 ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findCarByVehicleRating_4() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT count(*) FROM CAR_INFO WHERE vehicle_rating > 5000 ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
}

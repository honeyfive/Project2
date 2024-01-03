package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.CarMaintenanceDTO;
import db.util.DBConnectionManager;

public class CarMaintenanceDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 조회
	public List<CarMaintenanceDTO> findCarMaintenanceInfoList() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM vehicle_maintenance_info ";

		List<CarMaintenanceDTO> carMaintenanceInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			carMaintenanceInfoList = new ArrayList<CarMaintenanceDTO>();

			while (rs.next()) {

				CarMaintenanceDTO carInfoDTO = new CarMaintenanceDTO(rs.getString("maintenance_num"), rs.getString("car_number"),
						rs.getString("start_date"), rs.getString("completion_date"), rs.getString("maintenance_history"));

				carMaintenanceInfoList.add(carInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return carMaintenanceInfoList;
	}
	
	public int saveMaintenanceCarInfo(String maintenance_num, String car_number, String start_date, 
			String completion_date, String maintenance_history) {

		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO vehicle_maintenance_info VALUES(?, ?, ?, ?, ?) ";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, maintenance_num);
			psmt.setString(2, car_number);
			psmt.setString(3, start_date);
			psmt.setString(4, completion_date);
			psmt.setString(5, maintenance_history);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}
}

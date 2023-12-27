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
}

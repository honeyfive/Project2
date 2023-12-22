package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.CarInfoDTO;
import db.dto.PaymentInfoDTO;
import db.util.DBConnectionManager;

public class CarInfoDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	//차정보테이블 찾기 리스트
	public List<CarInfoDTO> findCarInfoList(){
		
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM car_info ";

		List<CarInfoDTO> carInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			carInfoList = new ArrayList<CarInfoDTO>();

			while (rs.next()) {
				CarInfoDTO carInfoDTO = new CarInfoDTO(rs.getString("car_number"),rs.getString("car_name"),rs.getString("car_size"),
						rs.getString("car_type"),rs.getInt("passanger_count"),rs.getInt("vehicle_rating"),
						rs.getString("company"),rs.getString("color"),rs.getInt("model_year"),rs.getString("management_status"),
						rs.getString("option1"),rs.getString("option2"),rs.getInt("accident_history"));

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


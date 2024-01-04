package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.CarRentalInfoDTO;
import db.dto.InsuranceInfoDTO;
import db.util.DBConnectionManager;

public class CarRentalInfoDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 차량 정보랑 렌탈 비용 찾기 ..
	public List<CarRentalInfoDTO> findCarRentalInfo() {
		conn = DBConnectionManager.connectDB();
		String sql = " select ci.car_number, ci.car_name, ci.car_size, ci.car_type, ci.model_year, crm.rental_costs, ci.car_image "
				+ " from car_info ci, car_rental_management crm " + " where ci.car_number = crm.car_number "
				+ " order by ci.car_number ";

		List<CarRentalInfoDTO> carRentalInfoList = new ArrayList<CarRentalInfoDTO>();

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				CarRentalInfoDTO carRentalInfoDTO = new CarRentalInfoDTO(rs.getString("car_number"),
						rs.getString("car_name"), rs.getString("car_size"), rs.getString("car_type"),
						rs.getInt("model_year"), rs.getInt("rental_costs"), rs.getString("car_image"));

				carRentalInfoList.add(carRentalInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return carRentalInfoList;

	}

}
package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.CarInfoDTO;
import db.dto.InsuranceInfoDTO;
import db.dto.PaymentInfoDTO;
import db.util.DBConnectionManager;

public class CarInfoDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 차정보테이블 찾기 리스트
	public List<CarInfoDTO> findCarInfoList() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM car_info ";

		List<CarInfoDTO> carInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			carInfoList = new ArrayList<CarInfoDTO>();

			while (rs.next()) {
				CarInfoDTO carInfoDTO = new CarInfoDTO(rs.getString("car_number"), rs.getString("car_name"),
						rs.getString("car_size"), rs.getString("car_type"), rs.getInt("passenger_count"),
						rs.getInt("vehicle_rating"), rs.getString("company"), rs.getString("color"),
						rs.getInt("model_year"), rs.getString("management_status"), rs.getString("option1"),
						rs.getString("option2"), rs.getInt("accident_history"), rs.getString("car_image"));

				carInfoList.add(carInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return carInfoList;
	}

	private List<CarInfoDTO> getCarInfoByCategory(String category) {
		conn = DBConnectionManager.connectDB();

		String sql = "SELECT cf.car_image, cf.car_number, cf.car_name, cf.car_size, cf.model_year "
				+ "FROM car_info cf, car_introduce ct " + "WHERE cf.car_number = ct.car_number "
				+ "AND car_category = ? ";

		List<CarInfoDTO> carInfoList2 = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, category);
			rs = psmt.executeQuery();

			while (rs.next()) {
				CarInfoDTO carInfoDTO = new CarInfoDTO(rs.getString("car_image"), rs.getString("car_number"),
						rs.getString("car_name"), rs.getString("car_size"), rs.getInt("model_year"));
				carInfoList2.add(carInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return carInfoList2;
	}

	// 차량 크기별 리스트
	public List<CarInfoDTO> findCarInfoListBySize() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT DISTINCT car_size FROM car_info";

		List<CarInfoDTO> carInfoList3 = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			carInfoList3 = new ArrayList<>();

			while (rs.next()) {
				CarInfoDTO carInfoDTO = new CarInfoDTO();
				carInfoDTO.setCar_size(rs.getString("car_size"));

				carInfoList3.add(carInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return carInfoList3;
	}

	public List<CarInfoDTO> findCarInfoListByType() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT DISTINCT car_type FROM car_info ";

		List<CarInfoDTO> carInfoList4 = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			carInfoList4 = new ArrayList<>();

			while (rs.next()) {
				CarInfoDTO carInfoDTO = new CarInfoDTO();
				carInfoDTO.setCar_type(rs.getString("car_type"));

				carInfoList4.add(carInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return carInfoList4;
	}

	// 추천 차량 정보 조회
	public List<CarInfoDTO> showRecommendCarInfo() {
		return getCarInfoByCategory("R");
	}

	// Y2K 차량 정보 조회
	public List<CarInfoDTO> showOldCarInfo() {
		return getCarInfoByCategory("Y");
	}

	// 가성비 차량 정보 조회
	public List<CarInfoDTO> showCheapCarInfo() {
		return getCarInfoByCategory("C");
	}

	// 인기 차량 정보 조회
	public List<CarInfoDTO> showPopularCarInfo() {
		return getCarInfoByCategory("P");
				
	}
	
	
	// carnumber로 
	public CarInfoDTO findCarInfoByCarNumber(String Car_number) {
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM car_info "
					+ " where car_number = ? ";

		CarInfoDTO carInfoDTO = null;
		
		 try {
			 psmt = conn.prepareStatement(sql);

			 
			 psmt.setString(1,Car_number);
			 
			 rs = psmt.executeQuery(); 	
			 
			 if(rs.next()) {
				 carInfoDTO = new CarInfoDTO(rs.getString("car_number"),rs.getString("car_name"),rs.getString("car_size"),
							rs.getString("car_type"),rs.getInt("passenger_count"),rs.getInt("vehicle_rating"),
							rs.getString("company"),rs.getString("color"),rs.getInt("model_year"),rs.getString("management_status"),
							rs.getString("option1"),rs.getString("option2"),rs.getInt("accident_history"),rs.getString("car_image"));
			 }
			 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return carInfoDTO;	
		
	}	

	public List<CarInfoDTO> findCarInfoListByCarSize() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM car_info WHERE car_size = '?' ";

		List<CarInfoDTO> carInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			carInfoList = new ArrayList<CarInfoDTO>();

			while (rs.next()) {
				CarInfoDTO carInfoDTO = new CarInfoDTO(rs.getString("car_number"), rs.getString("car_name"),
						rs.getString("car_size"), rs.getString("car_type"), rs.getInt("passenger_count"),
						rs.getInt("vehicle_rating"), rs.getString("company"), rs.getString("color"),
						rs.getInt("model_year"), rs.getString("management_status"), rs.getString("option1"),
						rs.getString("option2"), rs.getInt("accident_history"), rs.getString("car_image"));

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

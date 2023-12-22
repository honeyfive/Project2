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
						rs.getString("car_type"),rs.getInt("passenger_count"),rs.getInt("vehicle_rating"),
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
	
	//추천차량정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 람보르기니 우라칸
	public CarInfoDTO showRecommendCarInfo1(){
		
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT car_name, car_size, model_year FROM car_info "
					+ " WHERE car_name =  '람보르기니 우라칸' ";

		CarInfoDTO showRecommendCarInfo1 = null;

		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				CarInfoDTO carInfoDTO1 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
						rs.getInt("model_year"));
				showRecommendCarInfo1 = carInfoDTO1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return showRecommendCarInfo1;
	}
	
	//추천 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 카니발 4세대
	public CarInfoDTO showRecommendCarInfo2(){
		
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT car_name, car_size, model_year FROM car_info "
					+ " WHERE car_name =  '카니발 4세대' ";

		CarInfoDTO showRecommendCarInfo2 = null;

		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				CarInfoDTO carInfoDTO2 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
						rs.getInt("model_year"));
				showRecommendCarInfo2 = carInfoDTO2;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return showRecommendCarInfo2;
	}
	
	//추천 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- EV 1세대
		public CarInfoDTO showRecommendCarInfo3(){
			
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
						+ " WHERE car_name =  'EV 1세대' ";

			CarInfoDTO showRecommendCarInfo3 = null;

			try {
				psmt = conn.prepareStatement(sql);
				
				rs = psmt.executeQuery();
				
				while (rs.next()) {
					CarInfoDTO carInfoDTO3 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
							rs.getInt("model_year"));
					showRecommendCarInfo3 = carInfoDTO3;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}

			return showRecommendCarInfo3;
		}
	
	//추천 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 카니발 4세대
		public CarInfoDTO showRecommendCarInfo4(){
					
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
								+ " WHERE car_name =  '카니발 4세대' ";

			CarInfoDTO showRecommendCarInfo4 = null;

			try {
				psmt = conn.prepareStatement(sql);
						
				rs = psmt.executeQuery();
						
				while (rs.next()) {
					CarInfoDTO carInfoDTO4 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showRecommendCarInfo4 = carInfoDTO4;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
						DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showRecommendCarInfo4;
			}	
		
	//가성비 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 베이비 EV9
	public CarInfoDTO showCheapCarInfo1(){
		
		conn = DBConnectionManager.connectDB();
	
		String sql = " SELECT car_name, car_size, model_year FROM car_info "
							+ " WHERE car_name =  '베이비 EV9' ";
	
		CarInfoDTO showCheapCarInfo1 = null;
	
		try {
			psmt = conn.prepareStatement(sql);
					
			rs = psmt.executeQuery();
					
			while (rs.next()) {
				CarInfoDTO cheapCarInfo1 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
				rs.getInt("model_year"));
				showCheapCarInfo1 = cheapCarInfo1;
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
					DBConnectionManager.closeDB(conn, psmt, rs);
		}
	
			return showCheapCarInfo1;
		}	
		
		//가성비 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 2022 모닝
		public CarInfoDTO showCheapCarInfo2(){
					
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
										+ " WHERE car_name =  '2022 모닝' ";

			CarInfoDTO showCheapCarInfo2 = null;

			try {
				psmt = conn.prepareStatement(sql);
								
				rs = psmt.executeQuery();
								
				while (rs.next()) {
					CarInfoDTO cheapCarInfo2 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showCheapCarInfo2 = cheapCarInfo2;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
								DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showCheapCarInfo2;
			}	

//가성비 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 캐스퍼 1.0 가솔린 (BLACK)
		public CarInfoDTO showCheapCarInfo3(){
					
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
										+ " WHERE car_name =  '캐스퍼 1.0 가솔린'"
										+ "AND color = 'BLACK'";

			CarInfoDTO showCheapCarInfo3 = null;

			try {
				psmt = conn.prepareStatement(sql);
								
				rs = psmt.executeQuery();
								
				while (rs.next()) {
					CarInfoDTO cheapCarInfo3 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showCheapCarInfo3 = cheapCarInfo3;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
								DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showCheapCarInfo3;
			}	

		//가성비 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 캐스퍼 1.0 가솔린 (KHAKI)
		public CarInfoDTO showCheapCarInfo4(){
					
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
										+ " WHERE car_name =  '캐스퍼 1.0 가솔린'"
										+ "AND color = 'KHAKI'";

			CarInfoDTO showCheapCarInfo4 = null;

			try {
				psmt = conn.prepareStatement(sql);
								
				rs = psmt.executeQuery();
								
				while (rs.next()) {
					CarInfoDTO cheapCarInfo4 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showCheapCarInfo4 = cheapCarInfo4;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
								DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showCheapCarInfo4;
			}	
		
	//Y2K 버전 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 2011 마티즈
	public CarInfoDTO showOldCarInfo1(){
		
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT car_name, car_size, model_year FROM car_info "
									+ " WHERE car_name =  '2011 마티즈'";

		CarInfoDTO showOldCarInfo1 = null;

		try {
			psmt = conn.prepareStatement(sql);
							
			rs = psmt.executeQuery();
							
			while (rs.next()) {
				CarInfoDTO oldCarInfo1 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
				rs.getInt("model_year"));
				showOldCarInfo1 = oldCarInfo1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
							DBConnectionManager.closeDB(conn, psmt, rs);
		}

			return showOldCarInfo1;
		}			

//Y2K 버전 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- EV3
		public CarInfoDTO showOldCarInfo2(){
			
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
										+ " WHERE car_name =  '2011 마티즈'";

			CarInfoDTO showOldCarInfo2 = null;

			try {
				psmt = conn.prepareStatement(sql);
								
				rs = psmt.executeQuery();
								
				while (rs.next()) {
					CarInfoDTO oldCarInfo2 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showOldCarInfo2 = oldCarInfo2;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
						DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showOldCarInfo2;
			}	
		
//Y2K 버전 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 에쿠스 2세대
		public CarInfoDTO showOldCarInfo3(){
			
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
										+ " WHERE car_name =  '에쿠스 2세대'";

			CarInfoDTO showOldCarInfo3 = null;

			try {
				psmt = conn.prepareStatement(sql);
								
				rs = psmt.executeQuery();
								
				while (rs.next()) {
					CarInfoDTO oldCarInfo3 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showOldCarInfo3 = oldCarInfo3;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
						DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showOldCarInfo3;
			}
		
//Y2K 버전 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 올 뉴 마티즈
		public CarInfoDTO showOldCarInfo4(){
			
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
										+ " WHERE car_name =  '올 뉴 마티즈'";

			CarInfoDTO showOldCarInfo4 = null;

			try {
				psmt = conn.prepareStatement(sql);
								
				rs = psmt.executeQuery();
								
				while (rs.next()) {
					CarInfoDTO oldCarInfo4 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showOldCarInfo4 = oldCarInfo4;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
						DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showOldCarInfo4;
			}	

//인기 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- K5 2.0
		public CarInfoDTO showPopularCarInfo1(){
			
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
										+ " WHERE car_name =  'K5 2.0'";

			CarInfoDTO showPopularCarInfo1 = null;

			try {
				psmt = conn.prepareStatement(sql);
								
				rs = psmt.executeQuery();
								
				while (rs.next()) {
					CarInfoDTO popularCar1 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showPopularCarInfo1 = popularCar1;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
						DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showPopularCarInfo1;
			}	
//인기 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 스파크 F/L 2세대
		public CarInfoDTO showPopularCarInfo2(){
			
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
										+ " WHERE car_name =  '스파크 F/L 2세대'";

			CarInfoDTO showPopularCarInfo2 = null;

			try {
				psmt = conn.prepareStatement(sql);
								
				rs = psmt.executeQuery();
								
				while (rs.next()) {
					CarInfoDTO popularCar2 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showPopularCarInfo2 = popularCar2;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
						DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showPopularCarInfo2;
			}	
		
//인기 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 스파크 F/L 2세대
		public CarInfoDTO showPopularCarInfo3(){
			
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
										+ " WHERE car_name =  '셀토스 F/L 1세대'";

			CarInfoDTO showPopularCarInfo3 = null;

			try {
				psmt = conn.prepareStatement(sql);
								
				rs = psmt.executeQuery();
								
				while (rs.next()) {
					CarInfoDTO popularCar3 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showPopularCarInfo3 = popularCar3;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
						DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showPopularCarInfo3;
			}
		
//인기 차량 정보 (차량명, 차 사이즈, 연식) 보여주는 쿼리 -- 스파크 F/L 2세대
		public CarInfoDTO showPopularCarInfo4(){
			
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT car_name, car_size, model_year FROM car_info "
										+ " WHERE car_name =  '스타리아 2.2 디젤 카고'";

			CarInfoDTO showPopularCarInfo4 = null;

			try {
				psmt = conn.prepareStatement(sql);
								
				rs = psmt.executeQuery();
								
				while (rs.next()) {
					CarInfoDTO popularCar4 = new CarInfoDTO(rs.getString("car_name"),rs.getString("car_size"),
					rs.getInt("model_year"));
					showPopularCarInfo4 = popularCar4;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
						DBConnectionManager.closeDB(conn, psmt, rs);
			}

				return showPopularCarInfo4;
			}	



		
		
	}


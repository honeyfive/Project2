package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import db.dto.CarRentalManagementDTO;
import db.util.DBConnectionManager;

public class CarRentalManagementDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	// carnumber로 
		public CarRentalManagementDTO findCarRentalManagementInfoByCarNumber(String Car_number) {
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT * FROM car_rental_management "
						+ " where car_number = ? ";

			CarRentalManagementDTO carRentalManagementDTO = null;
			
			 try {
				 psmt = conn.prepareStatement(sql);

				 
				 psmt.setString(1,Car_number);
				 
				 rs = psmt.executeQuery(); 	
				 
				 if(rs.next()) {
					 carRentalManagementDTO = new CarRentalManagementDTO(
							 rs.getString("car_number"),rs.getInt("rental_costs"),
							 rs.getInt("rental_oil_reserves"),rs.getInt("return_oil_reserves")
							);
				 }
				 
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}
			
			return carRentalManagementDTO;	
			
		}
		
		
}

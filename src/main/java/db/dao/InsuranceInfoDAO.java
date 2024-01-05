package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.InsuranceInfoDTO;
import db.dto.ReservationInfoDTO;
import db.util.DBConnectionManager;

public class InsuranceInfoDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 보험정보찾기리스트
	public List<InsuranceInfoDTO> findInsuranceInfoList() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM insurance_Info ";

		List<InsuranceInfoDTO> insuranceInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			insuranceInfoList = new ArrayList<InsuranceInfoDTO>();

			while (rs.next()) {
				InsuranceInfoDTO insuranceInfoDTO = new InsuranceInfoDTO(rs.getInt("insurance_number"),
						rs.getString("insurance_type"), rs.getInt("insurance_price"));

				insuranceInfoList.add(insuranceInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return insuranceInfoList;
	}
	
	//보험번호로 하나의 정보 
	public InsuranceInfoDTO findInsuranceInfoByInsuNumber(int insurance_number) {
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM insurance_Info "
					+ " where insurance_number = ? ";

		InsuranceInfoDTO insuranceInfoDTO = null;
		
		 try {
			 psmt = conn.prepareStatement(sql);

			 
			 psmt.setInt(1,insurance_number);
			 
			 rs = psmt.executeQuery(); 	
			 
			 if(rs.next()) {
				 insuranceInfoDTO = new InsuranceInfoDTO(
						 rs.getInt("insurance_number"), rs.getString("insurance_type"), rs.getInt("insurance_price"));
			 }
			 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return insuranceInfoDTO;	
		
	}

}

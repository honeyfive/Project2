package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.InsuranceInfoDTO;
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

}

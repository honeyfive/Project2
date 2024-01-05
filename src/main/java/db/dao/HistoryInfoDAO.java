package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.HistoryInfoDTO;
import db.util.DBConnectionManager;

public class HistoryInfoDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 이력정보찾기리스트
	public List<HistoryInfoDTO> findHistodyInfoList() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM history_Info ";

		List<HistoryInfoDTO> historyInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			historyInfoList = new ArrayList<HistoryInfoDTO>();

			while (rs.next()) {
				HistoryInfoDTO historyInfoDTO = new HistoryInfoDTO(rs.getInt("reservation_number"),
						rs.getInt("membership_number"), rs.getString("return_date"),rs.getString("real_return_date"),rs.getInt("overdue_history"),rs.getString("accident_history"));

				historyInfoList.add(historyInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return historyInfoList;
	}
	
	// 회원번호로 이력정보찾기
	public List<HistoryInfoDTO> findHistoryInfoListByMembershipNumber(int targetMembershipNumber) {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM history_Info WHERE membership_number = ? ";

		List<HistoryInfoDTO> historyInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, targetMembershipNumber);
			rs = psmt.executeQuery();
			historyInfoList = new ArrayList<HistoryInfoDTO>();

			while (rs.next()) {
				HistoryInfoDTO historyInfoDTO = new HistoryInfoDTO(rs.getInt("reservation_number"),
						rs.getInt("membership_number"), rs.getString("return_date"),rs.getString("real_return_date"),rs.getInt("overdue_history"),rs.getString("accident_history"));

				historyInfoList.add(historyInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return historyInfoList;
	}
}

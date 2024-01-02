package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.MemberInfoDTO;
import db.util.DBConnectionManager;

public class Top5MemberDAO {
	
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 조회
	public List<MemberInfoDTO> findTop5MemberList() {

		conn = DBConnectionManager.connectDB();

		String sql = "select NAME from ( SELECT * FROM member_info ORDER BY (USE_COUNT-OVERDUE_HISTORY)DESC ) WHERE ROWNUM <= 5 ";

		List<MemberInfoDTO> memberInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			memberInfoList = new ArrayList<MemberInfoDTO>();

			while (rs.next()) {

				MemberInfoDTO memberInfoDTO = new MemberInfoDTO(rs.getString("name"));

				memberInfoList.add(memberInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return memberInfoList;
	}
	
	//블랙리스트
	public List<MemberInfoDTO> findBlackListMember() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT NAME "
				+ " FROM member_info "
				+ " WHERE OVERDUE_HISTORY >=3 ";

		List<MemberInfoDTO> memberInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			memberInfoList = new ArrayList<MemberInfoDTO>();

			while (rs.next()) {

				MemberInfoDTO memberInfoDTO = new MemberInfoDTO(rs.getString("name"));

				memberInfoList.add(memberInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return memberInfoList;
	}
}
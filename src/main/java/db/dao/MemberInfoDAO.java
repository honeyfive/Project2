package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.MemberInfoDTO;
import db.util.DBConnectionManager;

public class MemberInfoDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 멤버정보찾기리스트
	public List<MemberInfoDTO> findMemberList() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM member_info ORDER BY membership_number ";

		List<MemberInfoDTO> memberInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			memberInfoList = new ArrayList<MemberInfoDTO>();

			while (rs.next()) {

				MemberInfoDTO memberInfoDTO = new MemberInfoDTO(rs.getInt("membership_number"), rs.getString("name"),
						rs.getInt("age"), rs.getString("tel"), rs.getString("id"), rs.getString("password"),
						rs.getString("email"), rs.getString("membership_level"), rs.getString("lisence_number"),
						rs.getString("gender"), rs.getString("birthday"), rs.getString("lisence_acquisition_date"),
						rs.getInt("overdue_history"), rs.getInt("use_count"));

				memberInfoList.add(memberInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return memberInfoList;
	}

	// 고객이 입력한 id랑 pw가 서버에 똑같은 게 있나 확인하는 클래스
	public List<MemberInfoDTO> findMemberListById(String targetId, String targetPw) {
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM member_info WHERE id = ? and password = ? ";

		System.out.println(targetId + targetPw);
		
		List<MemberInfoDTO> memberInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, targetId);
			psmt.setString(2, targetPw);
			rs = psmt.executeQuery();
			memberInfoList = new ArrayList<MemberInfoDTO>(); // 못 찾아도 null이 아님

			while (rs.next()) {

				MemberInfoDTO memberInfoDTO = new MemberInfoDTO(rs.getInt("membership_number"), rs.getString("name"),
						rs.getInt("age"), rs.getString("tel"), rs.getString("id"), rs.getString("password"),
						rs.getString("email"), rs.getString("membership_level"), rs.getString("lisence_number"),
						rs.getString("gender"), rs.getString("birthday"), rs.getString("lisence_acquisition_date"),
						rs.getInt("overdue_history"), rs.getInt("use_count"));

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

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

	// 조회
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

	// 저장
	public int saveMemberInfo(MemberInfoDTO memberInfo) {

		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO member_info"
				+ " VALUES((SELECT NVL(MAX(membership_number), 0) + 1 FROM member_info), ?,"
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, memberInfo.getMembership_number());
			psmt.setString(2, memberInfo.getName());
			psmt.setInt(3, memberInfo.getAge());
			psmt.setString(4, memberInfo.getTel());
			psmt.setString(5, memberInfo.getId());
			psmt.setString(6, memberInfo.getPassword());
			psmt.setString(7, memberInfo.getEmail());
			psmt.setString(8, memberInfo.getMembership_level());
			psmt.setString(9, memberInfo.getLisence_number());
			psmt.setString(10, memberInfo.getGender());
			psmt.setString(11, memberInfo.getBirthday());
			psmt.setString(12, memberInfo.getLisence_acquisition_date());
			psmt.setInt(13, memberInfo.getOverdue_history());
			psmt.setInt(14, memberInfo.getUse_count());

			result = psmt.executeUpdate();
			// rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!

			/*
			 * SELECT 쿼리 : psmt.executeQuery(); -> 결과로 ResultSet INSERT, UPDATE, DELETE 쿼리 :
			 * psmt.executeUpdate(); -> 결과로 적용된 행의 숫자
			 */

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}

	public MemberInfoDTO findMemberById(int membership_number) {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM member_info " + " WHERE membership_number = ? ";

		MemberInfoDTO memberInfo = null;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, membership_number);

			rs = psmt.executeQuery();

			if (rs.next()) {
				memberInfo = new MemberInfoDTO(rs.getInt("membership_number"), rs.getString("name"), rs.getInt("age"),
						rs.getString("tel"), rs.getString("id"), rs.getString("password"), rs.getString("email"),
						rs.getString("membership_level"), rs.getString("lisence_number"), rs.getString("gender"),
						rs.getString("birthday"), rs.getString("lisence_acquisition_date"),
						rs.getInt("overdue_history"), rs.getInt("use_count"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return memberInfo;
	}

//삭제

	public int removeMemberById(int membership_number) {

		conn = DBConnectionManager.connectDB();

		String sql = " DELETE FROM member_info " + " WHERE membership_number = ? ";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, membership_number);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}

	// 수정
	public int modifyMembershipLevel(MemberInfoDTO memberInfo) {

		conn = DBConnectionManager.connectDB();

		String sql = " UPDATE member_info" + " SET membership_level = ? " + " WHERE Membership_number = ? ";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(2, memberInfo.getMembership_number());
			psmt.setString(1, memberInfo.getMembership_level());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}
	
	public int modifyOverdue(MemberInfoDTO memberInfo) {

		conn = DBConnectionManager.connectDB();

		String sql = " UPDATE member_info" + " SET overdue_history = ? " + " WHERE Membership_number = ? ";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(2, memberInfo.getMembership_number());
			psmt.setInt(1, memberInfo.getOverdue_history());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}
	
	public int modifyUseCount(MemberInfoDTO memberInfo) {

		conn = DBConnectionManager.connectDB();

		String sql = " UPDATE member_info" + " SET use_count = ? " + " WHERE Membership_number = ? ";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(2, memberInfo.getMembership_number());
			psmt.setInt(1, memberInfo.getUse_count());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
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

//	회원가입 시 이미 있는 아이딘가 확인하는 메소드
	public List<MemberInfoDTO> findMemberListById(String targetId) {
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM member_info WHERE id = ? ";

		System.out.println(targetId);
		
		List<MemberInfoDTO> memberInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, targetId);
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
	
//	회원가입 시 이미 있는 비번인가 확인하는 메소드
	public List<MemberInfoDTO> findMemberListByPw(String targetPw) {
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM member_info WHERE password = ? ";

		System.out.println(targetPw);
		
		List<MemberInfoDTO> memberInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, targetPw);
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
	
//	회원가입 시 이미 있는 운전면허번호인가 확인하는 메소드
	public List<MemberInfoDTO> findMemberListByLisenceNumber
	(String targetLisence1, String targetLisence2, String targetLisence3, String targetLisence4) {
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM member_info "
				+ " WHERE lisence_number = ' ? '|| '-' || ' ? ' || '-' || ' ? ' || '-' || ' ? ' "
				+ " ORDER BY membership_number ";

		System.out.println(targetLisence1 + "-" + targetLisence2 + "-" + targetLisence3 + "-" + targetLisence4);
		
		List<MemberInfoDTO> memberInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, targetLisence1);
			psmt.setString(2, targetLisence2);
			psmt.setString(3, targetLisence3);
			psmt.setString(4, targetLisence4);

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
	
	
	
	
	

//	새 고객 추가 메소드 > 수정중
	public List<MemberInfoDTO> saveMemberList(String targetName, String targetBirthYear, String targetTel1,
			String targetTel2, String targetTel3, String targetId, String targetPassword, String targetEmail,
			String targetLicense1, String targetLicense2, String targetLicense3, String targetLicense4,
			String targetGender, String targetBirthYear2, String targetBirthMonth, String targetBirthDate,
			String targetLicenseYear, String targetLicenseMonth, String targetLicenseDate) {
		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO member_info " // 이거 별명 붙여야함 !! 다시
				+ " VALUES( (SELECT max()+1 FROM member_info), ? , (EXTRACT(YEAR FROM sysdate) - ? ), concat( ? , '-', ? , '-', ? ), ? , ? , ? , NULL, "
				+ " concat( ? , '-', ? , '-', ? , '-', ? , '-'), ? , concat(? , '-', ? , '-', ? ), "
				+ " concat( ? , '-', ? , '-', ? ), NULL, NULL); ";

		System.out.println(targetName + targetBirthYear + targetTel1 + targetTel2 + targetTel3 + targetId
				+ targetPassword + targetEmail + targetLicense1 + targetLicense2 + targetLicense3 + targetLicense4
				+ targetGender + targetBirthYear2 + targetBirthMonth + targetBirthDate + targetLicenseYear
				+ targetLicenseMonth + targetLicenseDate);

		List<MemberInfoDTO> memberInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, targetName);
			psmt.setString(2, targetBirthYear);
			psmt.setString(3, targetTel1);
			psmt.setString(4, targetTel2);
			psmt.setString(5, targetTel3);
			psmt.setString(6, targetId);
			psmt.setString(7, targetPassword);
			psmt.setString(8, targetEmail);
			psmt.setString(9, targetLicense1);
			psmt.setString(10, targetLicense2);
			psmt.setString(11, targetLicense3);
			psmt.setString(12, targetLicense4);
			psmt.setString(13, targetGender);
			psmt.setString(14, targetBirthYear2);
			psmt.setString(15, targetBirthMonth);
			psmt.setString(16, targetBirthDate);
			psmt.setString(17, targetLicenseYear);
			psmt.setString(18, targetLicenseMonth);
			psmt.setString(19, targetLicenseDate);

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
	
	public int findMemberByAge_1() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT count(*) FROM member_info WHERE age BETWEEN 20 AND 25 ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findMemberByAge_2() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT count(*) FROM member_info WHERE age BETWEEN 26 AND 29 ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findMemberByAge_3() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT count(*) FROM member_info WHERE age BETWEEN 30 AND 35 ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findMemberByAge_4() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT count(*) FROM member_info WHERE age BETWEEN 36 AND 39 ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
	
	public int findMemberByAge_5() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT count(*) FROM member_info WHERE age >= 40 ";

		int count = 0;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return count;
	}
}


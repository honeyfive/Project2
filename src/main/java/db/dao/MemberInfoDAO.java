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

	// 고객이 입력한 id랑 pw가 서버에 똑같은 게 있나 확인하는 클래스
	public List<MemberInfoDTO> findMemberListById(String targetId, String targetPw) {
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM member_info WHERE id = ? and password = ? ";

		System.out.println("변수 값 확인 : " + targetId + targetPw);

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

		System.out.println("변수 값 확인 : " + targetId);
		
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

		System.out.println("변수 값 확인 : " + targetPw);
		
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
	public List<MemberInfoDTO> findMemberListByTel(String targetTel1, String targetTel2, String targetTel3) {
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM member_info "
				+ " WHERE tel = ? || '-' || ? || '-' || ? "
				+ " ORDER BY membership_number ";

		System.out.println("변수 값 확인 : " + targetTel1 + "-" + targetTel2 + "-" + targetTel3);
		
		List<MemberInfoDTO> memberInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, targetTel1);
			psmt.setString(2, targetTel2);
			psmt.setString(3, targetTel3);

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
				+ " WHERE lisence_number = ? || '-' || ? || '-' || ? || '-' || ? "
				+ " ORDER BY membership_number ";

		System.out.println("변수 값 확인 : " + targetLisence1 + "-" + targetLisence2 + "-" + targetLisence3 + "-" + targetLisence4);
		
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
	
//	회원가입 시 이미 있는 이메일인가 확인하는 메소드
	public List<MemberInfoDTO> findMemberListByEmail
	(String targetEmail) {
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM member_info "
				+ " WHERE email = ? ";

		System.out.println("변수 값 확인 : " + targetEmail);
		
		List<MemberInfoDTO> memberInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, targetEmail);

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
		

//	새 고객 추가 메소드
	public int saveMemberList(String targetName, String targetBirthYear, String targetTel1,
			String targetTel2, String targetTel3, String targetId, String targetPassword, String targetEmail,
			String targetLisence1, String targetLisence2, String targetLisence3, String targetLisence4,
			String targetGender, String targetBirthMonth, String targetBirthDate,
			String targetLisenceYear, String targetLisenceMonth, String targetLisenceDate) {
		
		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO member_info (membership_number, name, age, tel, id, password, email, "
				+ " membership_level, lisence_number, gender, birthday, lisence_acquisition_date, overdue_history, use_count) "
				+ " VALUES ((SELECT MAX(membership_number) + 1 FROM member_info), ? , (EXTRACT(YEAR FROM SYSDATE) - ?), "
				+ " ? || '-' || ? || '-' || ? , ? , ? , ? , NULL, ? || '-' || ? || '-' || ? || '-' || ? , "
				+ " ? , ? || '-' || ? || '-' || ? , ? || '-' || ? || '-' || ?, NULL, NULL )";

		System.out.println("변수 확인 > 아이디" + targetId + " 비번" + targetPassword + " 이름" + targetName +
				" 출생년도" + targetBirthYear + " 출생월" + targetBirthMonth + " 출생일" + targetBirthDate +
				" 성별" + targetGender + " 운전면허1" + targetLisence1 + " 운전면허2" + targetLisence2 +
				" 운전면허3" + targetLisence3 + " 운전면허4" + targetLisence4 + " 면허취득년" + targetLisenceYear +
				" 면허취득월" + targetLisenceMonth + " 면허취득일" + targetLisenceDate +
				" 전화번호1" + targetTel1 + " 전화번호2" + targetTel2 + " 전화번호3" + targetTel3 +
				" 이메일" + targetEmail);

		int result = 0;

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
			psmt.setString(9, targetLisence1);
			psmt.setString(10, targetLisence2);
			psmt.setString(11, targetLisence3);
			psmt.setString(12, targetLisence4);
			psmt.setString(13, targetGender);
			psmt.setString(14, targetBirthYear);
			psmt.setString(15, targetBirthMonth);
			psmt.setString(16, targetBirthDate);
			psmt.setString(17, targetLisenceYear);
			psmt.setString(18, targetLisenceMonth);
			psmt.setString(19, targetLisenceDate);

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;

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


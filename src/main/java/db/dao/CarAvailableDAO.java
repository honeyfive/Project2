package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.dto.CarAvailableDTO;
import db.util.DBConnectionManager;

public class CarAvailableDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public int findCarAvailable() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT COUNT(*) FROM (SELECT DISTINCT TRIM(CAR_NUMBER), MAX(STATE) STATE FROM (SELECT CAR_NUMBER,CASE WHEN SYSDATE BETWEEN TO_DATE(start_date, 'YYYY-MM-DD') AND TO_DATE(completion_date, 'YYYY-MM-DD') THEN 'M' ELSE 'A' END AS STATE FROM vehicle_maintenance_info UNION SELECT  CAR_NUMBER, CASE WHEN SYSDATE BETWEEN TO_DATE(rental_date, 'YYYY-MM-DD HH24:MI') AND TO_DATE(return_date, 'YYYY-MM-DD HH24:MI') THEN 'U' ELSE 'A' END AS STATE FROM reservation_information ) GROUP BY CAR_NUMBER ) States WHERE States.STATE = 'A' " ;

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

	public int findCarMaintenance() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT COUNT(*) FROM (SELECT DISTINCT TRIM(CAR_NUMBER), MAX(STATE) STATE FROM (SELECT CAR_NUMBER,CASE WHEN SYSDATE BETWEEN TO_DATE(start_date, 'YYYY-MM-DD') AND TO_DATE(completion_date, 'YYYY-MM-DD') THEN 'M' ELSE 'A' END AS STATE FROM vehicle_maintenance_info UNION SELECT  CAR_NUMBER, CASE WHEN SYSDATE BETWEEN TO_DATE(rental_date, 'YYYY-MM-DD HH24:MI') AND TO_DATE(return_date, 'YYYY-MM-DD HH24:MI') THEN 'U' ELSE 'A' END AS STATE FROM reservation_information ) GROUP BY CAR_NUMBER ) States WHERE States.STATE = 'M' " ;

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

	public int findCarUsing() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT COUNT(*) FROM (SELECT DISTINCT TRIM(CAR_NUMBER), MAX(STATE) STATE FROM (SELECT CAR_NUMBER, CASE WHEN SYSDATE BETWEEN TO_DATE(start_date, 'YYYY-MM-DD') AND TO_DATE(completion_date, 'YYYY-MM-DD') THEN 'M' ELSE 'A' END AS STATE FROM vehicle_maintenance_info UNION SELECT CAR_NUMBER, CASE WHEN SYSDATE BETWEEN TO_DATE(rental_date, 'YYYY-MM-DD HH24:MI') AND TO_DATE(return_date, 'YYYY-MM-DD HH24:MI') THEN 'U' ELSE 'A' END AS STATE FROM reservation_information ) GROUP BY CAR_NUMBER ) States WHERE States.STATE = 'U' " ;

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

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

		String sql = " SELECT COUNT(*) FROM car_rental_available " + " WHERE STATE='A' ";

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

		String sql = " SELECT COUNT(*) FROM car_rental_available " + " WHERE STATE='M' ";

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

		String sql = " SELECT COUNT(*) FROM car_rental_available " + " WHERE STATE='U' ";

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

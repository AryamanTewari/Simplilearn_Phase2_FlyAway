package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.flyaway.model.Admin;
import com.flyaway.model.Fare;
import com.flyaway.model.Flight;

public class AdminDAO {

	private Connection con = null;
	private PreparedStatement pst = null;

	public int addFlight(Flight flight) {

		int flightNumber = 0;
		String sql = "insert into flight (airline , weekdays , src_airport_code , dest_airport_code) "
				+ " values(? , ? ,? , ?)";



		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql , Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, flight.getAirline());
			pst.setString(2, flight.getWeekdays());
			pst.setString(3, flight.getSource());
			pst.setString(4, flight.getDestination());

			if (pst.executeUpdate() == 1) {
				ResultSet rs = pst.getGeneratedKeys();
				if(rs.next()) {
					flightNumber = rs.getInt(1);
				}

			}else {
				flightNumber = 0;
			}

		} catch (SQLException e) {
			flightNumber = 0;
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return flightNumber;
	}


	public String addFare(Fare fare) {

		String status = "";
		String sql = "insert into fare (flight_number , class , fare) "
				+ " values(? , ? ,?)";



		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, fare.getFlightNumber());
			pst.setString(2, fare.getTravelClass());
			pst.setDouble(3, fare.getFare());

			if (pst.executeUpdate() == 1) {
				status = "SUCCESS";

			}else {
				status = "FAIL";
			}

		} catch (SQLException e) {
			status = "FAIL";
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return status;

	}




	public String updatePasswordAdmin(int Id , String password) {
		String sql = "update admin set password=? WHERE admin_id = ?";
		String status = "";

		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, password);
			pst.setInt(2, Id);

			if (pst.executeUpdate() == 1) {
				status = "SUCCESS";
			} else
				status = "FAIL";
		} catch (Exception e) {
			status = "FAIL";
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}
		return status;
	}


	public int adminLogin(String email , String password) {

		String sql = "select * from admin where email = ? and password = ?";
		int adminId = 0;

		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				adminId = rs.getInt(1);
			}else {
				adminId = 0;
			}

		} catch (SQLException e) {
			adminId = 0;
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return adminId;
	}

	public Admin getAdmin(int adminId) {

		String sql = "select * from admin where admin_id = ?";
		Admin admin = new Admin();

		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, adminId);
			ResultSet rs = pst.executeQuery();
			rs.next();
			admin.setAdminId(rs.getInt(1));
			admin.setFirstName(rs.getString(2));
			admin.setLastName(rs.getString(3));
			admin.setEmail(rs.getString(4));
			admin.setPassword(rs.getString(5));

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return admin;
	}	

}

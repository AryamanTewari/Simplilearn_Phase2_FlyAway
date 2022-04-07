package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.flyaway.model.Airport;
import com.flyaway.model.Customer;
import com.flyaway.model.Fare;
import com.flyaway.model.Flight;
import com.flyaway.model.Reservation;


public class CustomerDAO {

	private Connection con = null;
	private PreparedStatement pst = null;

	public int addCustomer(Customer custBean) {

		int customerId = 0;
		String sql = "insert into customer (first_name , last_name , email , password , phone)"
				+ " values(? , ? , ? , ? , ?)";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql , Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, custBean.getFirstName());
			pst.setString(2, custBean.getLastName());
			pst.setString(3, custBean.getEmail());
			pst.setString(4, custBean.getPassword());
			pst.setString(5, custBean.getPhone());



			if(pst.executeUpdate() == 1) {
				ResultSet rs = pst.getGeneratedKeys();
				if(rs.next()) {
					customerId = rs.getInt(1);
				}

			}else {
				customerId = 0;
			}

		} catch (SQLException e) {
			customerId = 0;
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return customerId;
	}




	public String updatePassword(int Id , String password) {
		String sql = "update customer set password=? WHERE customer_id = ?";
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

	public int customerLogin(String email , String password) {

		String sql = "select * from customer where email = ? and password = ?";
		int customerId = 0;


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				customerId =  rs.getInt(1);
			}else {
				customerId = 0;
			}

		} catch (SQLException e) {
			customerId = 0;
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return customerId;
	}


	public Customer getCustomer(int customerId) {

		String sql = "select * from customer where customer_id = ?";
		Customer customer = new Customer();

		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, customerId);
			ResultSet rs = pst.executeQuery();
			rs.next();
			customer.setCustomerId(rs.getInt(1));
			customer.setFirstName(rs.getString(2));
			customer.setLastName(rs.getString(3));
			customer.setEmail(rs.getString(4));
			customer.setPassword(rs.getString(5));
			customer.setPhone(rs.getString(6));

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return customer;
	}



	public int addReservation(Reservation resBean) {

		int bookingId = 0;
		String sql = "insert into reservations (flight_number,class,travel_date,"
				+ "no_of_passengers,total_fare,customer_id) values(?,?,?,?,?,?)";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql , Statement.RETURN_GENERATED_KEYS);
			pst.setInt(1, resBean.getFlightNumber());
			pst.setString(2, resBean.getTravelClass());
			pst.setDate(3, getSQLDate(resBean.getTravelDate()));
			pst.setInt(4, resBean.getPassengers());
			pst.setDouble(5, resBean.getTotalFare());
			pst.setInt(6, resBean.getCustomerId());

			if (pst.executeUpdate() == 1) {
				ResultSet rs = pst.getGeneratedKeys();
				if(rs.next()) {
					bookingId = rs.getInt(1);
				}
			}else {
				bookingId = 0;
			}

		} catch (SQLException e) {

			bookingId = 0;

		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return bookingId;

	}

	public List<Reservation> showReservations(int customerId) {

		List<Reservation> lrev = new ArrayList<>();
		String sql = "select r.booking_id, r.flight_number, r.class, r.travel_date,"
				+ " r.no_of_passengers , r.total_fare , r.customer_id from "
				+ " reservations r where r.customer_id = ? ";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, customerId);
			ResultSet rs = pst.executeQuery();

			while(rs.next()) {

				Reservation rserv = new Reservation();
				rserv.setBookingId(rs.getInt(1));
				rserv.setFlightNumber(rs.getInt(2));
				rserv.setTravelClass(rs.getString(3));
				rserv.setTravelDate(rs.getDate(4));
				rserv.setPassengers(rs.getInt(5));
				rserv.setTotalFare(rs.getDouble(6));
				rserv.setCustomerId(rs.getInt(7));

				lrev.add(rserv);

			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return lrev;
	}


	public Reservation getReservation(int bookingId ) {

		Reservation reservation = new Reservation();
		String sql = "select r.booking_id, r.flight_number, r.class, r.travel_date,"
				+ " r.no_of_passengers , r.total_fare , r.customer_id from "
				+ " reservations r where r.booking_id = ? ";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, bookingId);
			ResultSet rs = pst.executeQuery();

			rs.next();

			reservation.setBookingId(rs.getInt(1));
			reservation.setFlightNumber(rs.getInt(2));
			reservation.setTravelClass(rs.getString(3));
			reservation.setTravelDate(rs.getDate(4));
			reservation.setPassengers(rs.getInt(5));
			reservation.setTotalFare(rs.getDouble(6));
			reservation.setCustomerId(rs.getInt(7));

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return reservation;
	}





	public double getFare(int flightNumber , String travelClass) {

		double fare = 0.0;

		String sql = "select fare from fare where flight_number = ? and class = ?";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, flightNumber);
			pst.setString(2,travelClass);
			ResultSet st = pst.executeQuery();
			st.next();
			fare = st.getDouble(1);

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Cannot find fare");
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}


		return fare;

	}

	public double calculateFare(int flightNumber , String travelClass , int passengers) {

		double totalFare = 0.0;
		double fare = 0.0;

		fare = getFare(flightNumber , travelClass);

		totalFare = fare * passengers;

		return totalFare;

	}


	public List<Flight>flightList(String src, String dest , Date travelDate){

		List<Flight> flightList = new ArrayList<Flight>();
		SimpleDateFormat sdf = new SimpleDateFormat("E");
		String day = sdf.format(travelDate);

		String sql = "select f.flight_number , f.airline , f.weekdays , f.src_airport_code , "
				+ " f.dest_airport_code from flight f  where"
				+ " f.src_airport_code = ? and"
				+ " f.dest_airport_code = ? and (find_in_set(? , replace(f.weekdays , '_' , ',')) > 0) ";



		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, src);
			pst.setString(2, dest);
			pst.setString(3, day);

			ResultSet rs = pst.executeQuery();

			while(rs.next()) {

				Flight flight = new Flight();
				flight.setFlightNumber(rs.getInt(1));
				flight.setAirline(rs.getString(2));
				flight.setWeekdays(rs.getString(3));
				flight.setSource(rs.getString(4));
				flight.setDestination(rs.getString(5));

				flightList.add(flight);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return flightList;

	}


	public List<Flight>showFlightList(){

		List<Flight> flightList = new ArrayList<Flight>();
		String sql = "select f.flight_number , f.airline , f.weekdays , f.src_airport_code , "
				+ " f.dest_airport_code from flight f ";



		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();

			while(rs.next()) {

				Flight flight = new Flight();
				flight.setFlightNumber(rs.getInt(1));
				flight.setAirline(rs.getString(2));
				flight.setWeekdays(rs.getString(3));
				flight.setSource(rs.getString(4));
				flight.setDestination(rs.getString(5));

				flightList.add(flight);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return flightList;

	}



	public Flight getFlight(int flightNumber){

		Flight flight = new Flight();

		String sql = "select f.flight_number , f.airline , f.weekdays , f.src_airport_code , "
				+ " f.dest_airport_code from flight f  where"
				+ " f.flight_number = ? ";



		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, flightNumber);

			ResultSet rs = pst.executeQuery();

			rs.next();

			flight.setFlightNumber(rs.getInt(1));
			flight.setAirline(rs.getString(2));
			flight.setWeekdays(rs.getString(3));
			flight.setSource(rs.getString(4));
			flight.setDestination(rs.getString(5));


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return flight;

	}





	public List<Fare>showFareList(int flightNumber){

		List<Fare> fareList = new ArrayList<>();
		String sql = "select * from fare where flight_number = ?";

		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, flightNumber);

			ResultSet rs = pst.executeQuery();

			while(rs.next()) {

				Fare fare = new Fare();
				fare.setFlightNumber(rs.getInt(1));
				fare.setTravelClass(rs.getString(2));
				fare.setFare(rs.getDouble(3));

				fareList.add(fare);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return fareList;

	}


	public Fare getFareRecord(int flightNumber , String travelClass){

		Fare fare = new Fare();
		String sql = "select * from fare where flight_number = ? and class = ?";

		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, flightNumber);
			pst.setString(2, travelClass);

			ResultSet rs = pst.executeQuery();
			rs.next();

			fare.setFlightNumber(rs.getInt(1));
			fare.setTravelClass(rs.getString(2));
			fare.setFare(rs.getDouble(3));



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return fare;

	}


	public String getAirport(String airportCode) {

		String airport = "";
		String sql = "select a.airport from airport a where a.airport_code = ?";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, airportCode);

			ResultSet rs = pst.executeQuery();
			rs.next();
			airport = rs.getString(1);

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return airport;

	}

	public String getCountryCode(String airportCode) {

		String countryCode = "";
		String sql = "select a.country_code from airport a where a.airport_code = ?";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, airportCode);

			ResultSet rs = pst.executeQuery();
			rs.next();
			countryCode = rs.getString(1);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return countryCode;

	}


	public String getCountry(String airportCode) {

		String country = "";
		String sql = "select a.country from airport a where a.airport_code = ?";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, airportCode);

			ResultSet rs = pst.executeQuery();
			rs.next();
			country = rs.getString(1);

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return country;

	}

	public Date getDate(String date) {

		Date theDate = new Date();

		try {
			theDate = DateUtils.parseDate(date);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return theDate;
	}

	public java.sql.Date getSQLDate(Date date){

		return new java.sql.Date(date.getTime());
	}


	public List<Airport> listAirport(){
		List<Airport> airportList = new ArrayList<>();
		String sql = "select * from airport";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			while(rs.next()){

				Airport airport = new Airport();
				airport.setAirportCode(rs.getString(1));
				airport.setAirport(rs.getString(2));
				airport.setCountryCode(rs.getString(3));
				airport.setCountry(rs.getString(4));

				airportList.add(airport);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return airportList;

	}

	public List<String> listAirportCode(){
		List<String> codeList = new ArrayList<>();
		String sql = "select airport_code from airport";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			while(rs.next()){

				String code = rs.getString(1);
				codeList.add(code);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return codeList;

	}

	public List<String> listAirline(){
		List<String> airList = new ArrayList<>();
		String sql = "select * from airline";


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			while(rs.next()){

				String airline = rs.getString(1);
				airList.add(airline);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return airList;

	}


	public Airport getAirportObject(String airportCode){
		String sql = "select * from airport where airport_code = ?";
		Airport airport = new Airport();


		try {
			con = DBConnect.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, airportCode);
			ResultSet rs = pst.executeQuery();

			rs.next();

			airport.setAirportCode(rs.getString(1));
			airport.setAirport(rs.getString(2));
			airport.setCountryCode(rs.getString(3));
			airport.setCountry(rs.getString(4));


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return airport;

	}

	public String getDay(Date theDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
		String day = sdf.format(theDate);
		return day;
	}


}

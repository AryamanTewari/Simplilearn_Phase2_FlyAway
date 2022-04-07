package com.flyaway.model;

import java.util.Date;

public class Reservation {

	private int bookingId;
	private int flightNumber;
	private String travelClass;
	private Date travelDate;
	private int passengers;
	private double totalFare;
	private int customerId;

	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reservation(int flightNumber, String travelClass, Date travelDate, int passengers, double totalFare,
			int customerId) {
		super();
		this.flightNumber = flightNumber;
		this.travelClass = travelClass;
		this.travelDate = travelDate;
		this.passengers = passengers;
		this.totalFare = totalFare;
		this.customerId = customerId;
	}
	public int getBookingId() {
		return bookingId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public int getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(int flightNumber) {
		this.flightNumber = flightNumber;
	}
	public String getTravelClass() {
		return travelClass;
	}
	public void setTravelClass(String travelClass) {
		this.travelClass = travelClass;
	}
	public Date getTravelDate() {
		return travelDate;
	}
	public void setTravelDate(Date travelDate) {
		this.travelDate = travelDate;
	}
	public int getPassengers() {
		return passengers;
	}
	public void setPassengers(int passengers) {
		this.passengers = passengers;
	}
	public double getTotalFare() {
		return totalFare;
	}
	public void setTotalFare(double totalFare) {
		this.totalFare = totalFare;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	@Override
	public String toString() {
		return "Reservation [bookingId=" + bookingId + ", flightNumber=" + flightNumber + ", travelClass=" + travelClass
				+ ", travelDate=" + travelDate + ", passengers=" + passengers + ", totalFare=" + totalFare
				+ ", customerId=" + customerId + "]";
	}





}

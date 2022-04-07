package com.flyaway.model;

public class Fare {

	private int flightNumber;
	private String travelClass;
	private double fare;
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
	public double getFare() {
		return fare;
	}
	public void setFare(double fare) {
		this.fare = fare;
	}
	@Override
	public String toString() {
		return "Fare [flightNumber=" + flightNumber + ", travelClass=" + travelClass + ", fare=" + fare + "]";
	}




}

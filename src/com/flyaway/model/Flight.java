package com.flyaway.model;

public class Flight {

	private int flightNumber;
	private String airline;
	private String weekdays;
	private String source;
	private String destination;

	public int getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(int flightNumber) {
		this.flightNumber = flightNumber;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getWeekdays() {
		return weekdays;
	}
	public void setWeekdays(String weekdays) {
		this.weekdays = weekdays;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}


	@Override
	public String toString() {
		return "Flight [flightNumber=" + flightNumber + ", airline=" + airline + ", weekdays=" + weekdays + ", source="
				+ source + ", destination=" + destination + "]";
	}



}

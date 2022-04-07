package com.flyaway.model;

public class Airport {

	private String airportCode;
	private String airport;
	private String countryCode;
	private String country;

	public String getAirportCode() {
		return airportCode;
	}
	public void setAirportCode(String airportCode) {
		this.airportCode = airportCode;
	}
	public String getAirport() {
		return airport;
	}
	public void setAirport(String airport) {
		this.airport = airport;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}

	@Override
	public String toString() {
		return "Airport [airportCode=" + airportCode + ", airport=" + airport + ", countryCode=" + countryCode
				+ ", country=" + country + "]";
	}



}

package com.xpediant;

import java.util.ArrayList;

public class Search {
	
	private String firstName;
	private String passportNumber;
	private String gender;
	private ArrayList<User> al;
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getPassportNumber() {
		return passportNumber;
	}
	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public ArrayList<User> getAl() {
		return al;
	}

	public void setAl(ArrayList<User> al) {
		this.al = al;
	}

}

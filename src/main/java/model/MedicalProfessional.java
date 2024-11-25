package model;

public class MedicalProfessional {
	protected String name;
	protected String gender;
	protected String dob;
	protected String phone;
	protected String email;
	protected String address;
	protected String joiningDate;
	
	public MedicalProfessional() {
		this.name = null;
		this.gender = null;
		this.dob = null;
		this.phone = null;
		this.email = null;
		this.address = null;
		this.joiningDate = null;
	}

	public MedicalProfessional(String name, String gender, String dob, String phone, String email, String address,
			String joiningDate) {
		this.name = name;
		this.gender = gender;
		this.dob = dob;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.joiningDate = joiningDate;
	}

	public String getName() {
		return name;
	}

	public String getGender() {
		return gender;
	}

	public String getDob() {
		return dob;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}

	public String getJoiningDate() {
		return joiningDate;
	}

}

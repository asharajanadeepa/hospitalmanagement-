package model;

public class Doctor extends MedicalProfessional {

	private int id;
	private String Specialization;
	
	

	public Doctor() {
		super();
		this.id = 0;
		Specialization = null;
	}

	public Doctor(int id, String name, String specialization, String gender, String dob, String phone, String email,
			String address, String joiningDate) {

		super(name, gender, dob, phone, email, address, joiningDate);

		this.id = id;
		this.Specialization = specialization;
	}

	public int getId() {
		return id;
	}

	public String getSpecialization() {
		return Specialization;
	}

}
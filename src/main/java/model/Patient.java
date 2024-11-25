package model;

import java.time.LocalDate;

public class Patient {
	private int id; // Assuming you have an ID field in the database
	private String name;
	private String diagnosis;
	private String allergies;
	private String prescriptionStatus;
	private LocalDate appointmentDate;

	public Patient() {
		this.name = null;
		this.diagnosis = null;
		this.allergies = null;
		this.prescriptionStatus = null;
		this.appointmentDate = null;
	}

	public Patient(String name, String diagnosis, String allergies, String prescriptionStatus) {
		this.name = name;
		this.diagnosis = diagnosis;
		this.allergies = allergies;
		this.prescriptionStatus = prescriptionStatus;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public String getAllergies() {
		return allergies;
	}

	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}

	public String getPrescriptionStatus() {
		return prescriptionStatus;
	}

	public void setPrescriptionStatus(String prescriptionStatus) {
		this.prescriptionStatus = prescriptionStatus;
	}

	public LocalDate getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(LocalDate appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
}
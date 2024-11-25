package model;

import java.time.LocalDate;

public class LabTest {
	private int tid; // Test ID
	private String name; // Name of the patient
	private String labTest; // Type of lab test
	private LocalDate testDate; // Date of the test
	private String reportStatus; // Status of the report
	private String paymentStatus; // Payment status
	
	//default constructor
	public LabTest() {
		
		this.tid = 0;
		this.name = null;
		this.labTest = null;
		this.testDate = null;
		this.reportStatus = null;
		this.paymentStatus = null;
	}
	
	//overloaded constructor
	public LabTest(int tid, String name, String labTest, LocalDate testDate, String reportStatus,
			String paymentStatus) {

		this.tid = tid;
		this.name = name;
		this.labTest = labTest;
		this.testDate = testDate;
		this.reportStatus = reportStatus;
		this.paymentStatus = paymentStatus;
	}

	// Getters and Setters
	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLabTest() {
		return labTest;
	}

	public void setLabTest(String labTest) {
		this.labTest = labTest;
	}

	public LocalDate getTestDate() {
		return testDate;
	}

	public void setTestDate(LocalDate testDate) {
		this.testDate = testDate;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
}

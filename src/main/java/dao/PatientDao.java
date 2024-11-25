package dao;

import db.DbConnect;
import exceptions.InvalidPatientException;
import model.Patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PatientDao {

    // Method to add a new patient
    public boolean addPatient(Patient patient) throws InvalidPatientException {

        validatePatient(patient);

        String query = "INSERT INTO Patient (Name, Diagnosis, Allergies, Prescription_Status, Appointment_Date) VALUES (?, ?, ?, ?, ?)";
        try (DbConnect dbConnect = new DbConnect();
             Connection connection = dbConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, patient.getName());
            preparedStatement.setString(2, patient.getDiagnosis());
            preparedStatement.setString(3, patient.getAllergies());
            preparedStatement.setString(4, patient.getPrescriptionStatus());
            preparedStatement.setDate(5, java.sql.Date.valueOf(patient.getAppointmentDate()));

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private void validatePatient(Patient patient) throws InvalidPatientException {
        if (patient.getName() == null || patient.getName().isEmpty()) {
            throw new InvalidPatientException("Name cannot be null or empty.");
        }
        if (patient.getName().matches(".*\\d.*")) {
            throw new InvalidPatientException("Name cannot contain numbers.");
        }
        if (patient.getDiagnosis() == null || patient.getDiagnosis().isEmpty()) {
            throw new InvalidPatientException("Diagnosis cannot be null or empty.");
        }
        if (patient.getAllergies() == null || patient.getAllergies().isEmpty()) {
            throw new InvalidPatientException("Allergies cannot be null or empty.");
        }
        if (patient.getPrescriptionStatus() == null || patient.getPrescriptionStatus().isEmpty()) {
            throw new InvalidPatientException("Prescription Status cannot be null or empty.");
        }
        if (patient.getAppointmentDate() == null) {
            throw new InvalidPatientException("Appointment Date cannot be null.");
        }
        if (patient.getName().matches(".[^a-zA-Z ].")) {
            throw new InvalidPatientException("Name cannot contain symbols.");
        }
    }


	// Method to retrieve all patients
	public List<Patient> getAllPatients() {
		List<Patient> patients = new ArrayList<>();
		String query = "SELECT * FROM patient";

		try (DbConnect dbConnect = new DbConnect();
				Connection connection = dbConnect.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				ResultSet resultSet = preparedStatement.executeQuery()) {

			while (resultSet.next()) {
				Patient patient = new Patient();
				patient.setId(resultSet.getInt("PID"));
				patient.setName(resultSet.getString("Name"));
				patient.setDiagnosis(resultSet.getString("Diagnosis"));
				patient.setAllergies(resultSet.getString("Allergies"));
				patient.setPrescriptionStatus(resultSet.getString("Prescription_Status"));
				patient.setAppointmentDate(resultSet.getDate("Appointment_Date").toLocalDate());

				patients.add(patient);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return patients;
	}

	// Method to get a patient by ID
	public Patient getPatientById(int id) {
		String query = "SELECT * FROM Patient WHERE PID = ?";
		try (DbConnect dbConnect = new DbConnect();
				Connection connection = dbConnect.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				Patient patient = new Patient();
				patient.setId(resultSet.getInt("PID"));
				patient.setName(resultSet.getString("Name"));
				patient.setDiagnosis(resultSet.getString("Diagnosis"));
				patient.setAllergies(resultSet.getString("Allergies"));
				patient.setPrescriptionStatus(resultSet.getString("Prescription_Status"));
				patient.setAppointmentDate(resultSet.getDate("Appointment_Date").toLocalDate());

				return patient;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// Method to update an existing patient
	public boolean updatePatient(Patient patient){

		String query = "UPDATE Patient SET Name = ?, Diagnosis = ?, Allergies = ?, Prescription_Status = ?, Appointment_Date = ? WHERE PID = ?";

		try (DbConnect dbConnect = new DbConnect();
				Connection connection = dbConnect.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setString(1, patient.getName());
			preparedStatement.setString(2, patient.getDiagnosis());
			preparedStatement.setString(3, patient.getAllergies());
			preparedStatement.setString(4, patient.getPrescriptionStatus());
			preparedStatement.setDate(5, java.sql.Date.valueOf(patient.getAppointmentDate()));
			preparedStatement.setInt(6, patient.getId());

			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// Method to delete a patient by ID
	public boolean deletePatient(int id) {
		String query = "DELETE FROM Patient WHERE PID = ?";

		try (DbConnect dbConnect = new DbConnect();
				Connection connection = dbConnect.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setInt(1, id);

			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0; // Return true if a row was deleted
		} catch (SQLException e) {
			e.printStackTrace();
			return false; // Return false if there was an error
		}
	}
}

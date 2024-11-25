package dao;

import db.DbConnect;
import model.LabTest;
import exceptions.InvalidLabTestException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LabTestDao {

    // Method to add a new lab test
    public boolean addLabTest(LabTest labTest) throws InvalidLabTestException {
        // Validate the lab test object
        validateLabTest(labTest);
        
        String query = "INSERT INTO LabTest (Name, Lab_Test, Test_Date, Report_Status, Payment_Status) VALUES (?, ?, ?, ?, ?)";
        try (DbConnect dbConnect = new DbConnect();
             Connection connection = dbConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, labTest.getName());
            preparedStatement.setString(2, labTest.getLabTest());
            preparedStatement.setDate(3, java.sql.Date.valueOf(labTest.getTestDate()));
            preparedStatement.setString(4, labTest.getReportStatus());
            preparedStatement.setString(5, labTest.getPaymentStatus());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private void validateLabTest(LabTest labTest) throws InvalidLabTestException {
        if (labTest.getName() == null || labTest.getName().isEmpty()) {
            throw new InvalidLabTestException("Name cannot be null or empty.");
        }
        if (labTest.getName().matches(".*\\d.*")) {
            throw new InvalidLabTestException("Name cannot contain numbers.");
        }
        if (!labTest.getName().matches("[a-zA-Z ]+")) {
            throw new InvalidLabTestException("Name cannot contain symbols.");
        }
    }


    // Method to retrieve all lab tests
    public List<LabTest> getAllLabTests() {
        List<LabTest> labTests = new ArrayList<>();
        String query = "SELECT * FROM labtest";

        try (DbConnect dbConnect = new DbConnect();
             Connection connection = dbConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                LabTest labTest = new LabTest();
                labTest.setTid(resultSet.getInt("TID"));
                labTest.setName(resultSet.getString("Name"));
                labTest.setLabTest(resultSet.getString("Lab_Test"));
                labTest.setTestDate(resultSet.getDate("Test_Date").toLocalDate());
                labTest.setReportStatus(resultSet.getString("Report_Status"));
                labTest.setPaymentStatus(resultSet.getString("Payment_Status"));

                labTests.add(labTest);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return labTests;
    }

    // Method to get a lab test by ID
    public LabTest getLabTestById(int id) {
        String query = "SELECT * FROM labtest WHERE TID = ?";
        try (DbConnect dbConnect = new DbConnect();
             Connection connection = dbConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                LabTest labTest = new LabTest();
                labTest.setTid(resultSet.getInt("TID"));
                labTest.setName(resultSet.getString("Name"));
                labTest.setLabTest(resultSet.getString("Lab_Test"));
                labTest.setTestDate(resultSet.getDate("Test_Date").toLocalDate());
                labTest.setReportStatus(resultSet.getString("Report_Status"));
                labTest.setPaymentStatus(resultSet.getString("Payment_Status"));

                return labTest;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to update an existing lab test
    public boolean updateLabTest(LabTest labTest) {
        String query = "UPDATE labtest SET Name = ?, Lab_Test = ?, Test_Date = ?, Report_Status = ?, Payment_Status = ? WHERE TID = ?";

        try (DbConnect dbConnect = new DbConnect();
             Connection connection = dbConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, labTest.getName());
            preparedStatement.setString(2, labTest.getLabTest());
            preparedStatement.setDate(3, java.sql.Date.valueOf(labTest.getTestDate()));
            preparedStatement.setString(4, labTest.getReportStatus());
            preparedStatement.setString(5, labTest.getPaymentStatus());
            preparedStatement.setInt(6, labTest.getTid());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a lab test by ID
    public boolean deleteLabTest(int id) {
        String query = "DELETE FROM labtest WHERE TID = ?";

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

package dao;

import java.sql.Connection;
import java.sql.ResultSet;
//import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.Dbconnecter;
import exceptions.InvalidMedicationException;
import model.medicine;

public class pharmacistDBUtil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;

	public static boolean insertMedicine(String medName, String medDescription, int medQuantity, String medPrice) throws InvalidMedicationException {
	    boolean isSuccess = false;

	    // Validate the medicine details before inserting
	    MedicineValidator.validateMedicine(medName, medDescription, medQuantity, medPrice); // This line may throw InvalidMedicationException

	    try {
	        con = Dbconnecter.getConnection();
	        if (con != null) {
	            stmt = con.createStatement();
	            String sql = "INSERT INTO medicine VALUES (0, '" + medName + "', '" + medDescription + "', '"
	                    + medQuantity + "', '" + medPrice + "')";
	            int rs = stmt.executeUpdate(sql);

	            if (rs > 0) {
	                isSuccess = true;
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (stmt != null)
	                stmt.close();
	            if (con != null)
	                con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    return isSuccess;
	}


	// retrieve medicines(read)
	public static List<medicine> getMedicines() {
		List<medicine> medicines = new ArrayList<>();

		try {
			Connection con = Dbconnecter.getConnection();
			String sql = "SELECT * FROM medicine"; // Update the table name
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("medName");
				String description = rs.getString("medDescription");
				int quantity = rs.getInt("medQuantity");
				String price = rs.getString("medPrice");

				medicine medicine = new medicine(id, name, description, quantity, price);
				medicines.add(medicine);

			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return medicines;
	}

	public static boolean updateMedicine(String id, String name, String description, int Quantity, String price) {

		try {

			Connection con = Dbconnecter.getConnection();
			stmt = con.createStatement();

			String sql = "update medicine set medName='" + name + "', medDescription='" + description
					+ "', medQuantity='" + Quantity + "', medPrice='" + price + "' where id='" + id + "'";

			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {

				isSuccess = true;

			} else {

				isSuccess = false;
			}

			con.close();
		} catch (Exception e) {

			e.printStackTrace();
		}

		return isSuccess;

	}

	public static boolean deleteMedicine(String id) {

		int convertedId = Integer.parseInt(id);

		try {

			Connection con = Dbconnecter.getConnection();
			Statement stmt = con.createStatement();

			String sql = "delete from medicine where id = " + convertedId + " ";

			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {

				isSuccess = true;

			} else {

				isSuccess = false;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return isSuccess;
	}

	// Validator for medicine input

	public static class MedicineValidator {
		public static void validateMedicine(String medName, String medDescription, int medQuantity, String medPrice)
				throws InvalidMedicationException {
			if (medName == null || medName.isEmpty()) {
				throw new InvalidMedicationException("Medicine name cannot be null or empty.");
			}
			if (medDescription == null || medDescription.isEmpty()) {
				throw new InvalidMedicationException("Medicine description cannot be null or empty.");
			}
			if (medQuantity <= 0) {
				throw new InvalidMedicationException("Medicine quantity must be greater than zero.");
			}
			if (medPrice == null || !medPrice.matches("\\d+(\\.\\d{1,2})?")) {
				throw new InvalidMedicationException("Invalid medicine price. Must be a valid number.");
			}
		}
	}

}

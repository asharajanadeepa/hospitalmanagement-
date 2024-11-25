package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import exceptions.InvalidPhoneNumberException;

import db.Dbconnecter;
import model.Doctor;

public class DoctorDBUtil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;

	public static boolean insertDoctor(String name, String gender, String dob, String specialization, String phone,
			String email, String address, String joiningDate) {

		boolean isSuccess = false;

		try {

			con = Dbconnecter.getConnection();

			stmt = con.createStatement();

			String sql = "insert into doctor values(0,'" + name + "','" + specialization + "','" + gender + "','" + dob
					+ "','" + phone + "','" + email + "','" + address + "','" + joiningDate + "') ";

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

	public static List<Doctor> getDoctorDetails() {
		ArrayList<Doctor> doc = new ArrayList<>();

		try {
			// Get the database connection
			con = Dbconnecter.getConnection();
			Statement stmt = con.createStatement();

			String sql = "SELECT * FROM doctor";

			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt(1); // Assuming your column name is 'id'
				String name = rs.getString(2);
				String specialization = rs.getString(3);
				String gender = rs.getString(4);
				String dob = rs.getString(5);
				String phone = rs.getString(6);
				String email = rs.getString(7);
				String address = rs.getString(8);
				String joiningDate = rs.getString(9);

				Doctor d = new Doctor(id, name, specialization, gender, dob, phone, email, address, joiningDate);
				doc.add(d);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doc;

	}

	public static boolean updateDoctor(String id, String name, String gender, String dob, String specialization,
			String phone, String email, String address, String joiningDate) {

		try {

			con = Dbconnecter.getConnection();
			stmt = con.createStatement();

			String sql = "update doctor set Name='" + name + "', Specialization='" + specialization + "', Gender='"
					+ gender + "', DateOfBirth='" + dob + "',Phone='" + phone + "',Email='" + email + "', "
					+ "Address='" + address + "', JoiningDate = '" + joiningDate + "' where DoctorId='" + id + "' ";

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

	public static boolean deleteDoctor(String id) {

		int convertedId = Integer.parseInt(id);

		try {

			con = Dbconnecter.getConnection();
			stmt = con.createStatement();

			String sql = "delete from doctor where DoctorId = '" + convertedId + "' ";

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

	public static void validatePhoneNumber(String phoneNumber) throws InvalidPhoneNumberException {
			if (phoneNumber.length() != 10 || !phoneNumber.startsWith("0")) {
				throw new InvalidPhoneNumberException("Phone number must be 10 digits long and start with '0'.");
			}
		}
	

}

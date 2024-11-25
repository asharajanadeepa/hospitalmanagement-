package test;

import java.time.LocalDate;

import dao.LabTestDao;
import exceptions.InvalidLabTestException;
import model.LabTest;

public class LabApp {
	public static void main(String[] args) {
        LabTestDao labTestDao = new LabTestDao();
        
        LabTest newTest = new LabTest();
        newTest.setName("John Doe");
        newTest.setLabTest("Blood Test");
        newTest.setTestDate(LocalDate.now());
        newTest.setReportStatus("Pending");
        newTest.setPaymentStatus("Paid");

        try {
            boolean success = labTestDao.addLabTest(newTest);
            if (success) {
                System.out.println("Lab test added successfully.");
            } else {
                System.out.println("Failed to add lab test.");
            }
        } catch (InvalidLabTestException e) {
            System.out.println("Validation Error: " + e.getMessage());
        }
    }

}

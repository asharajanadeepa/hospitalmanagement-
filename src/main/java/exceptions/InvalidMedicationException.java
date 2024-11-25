package exceptions;

public class InvalidMedicationException extends Exception {
	private static final long serialVersionUID = 1L;

	public InvalidMedicationException(String message) {
		super(message);
	}
}

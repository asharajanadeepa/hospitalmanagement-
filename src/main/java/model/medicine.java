package model;

public class medicine {

	private int id;
	private String medName;
	private String medDiscription;
	private int medQuantity;
	private String medPrice;
	
	public medicine() {
		
		this.id = 0;
		this.medName = null;
		this.medDiscription = null;
		this.medQuantity = 0;
		this.medPrice = null;
	}

	public medicine(int id, String medName, String medDiscription, int medQuantity, String price) {
		super();
		this.id = id;
		this.medName = medName;
		this.medDiscription = medDiscription;
		this.medQuantity = medQuantity;
		this.medPrice = price;
	}

	public int getId() {
		return id;
	}

	public String getMedName() {
		return medName;
	}

	public String getMedDiscription() {
		return medDiscription;
	}

	public int getMedQuantity() {
		return medQuantity;
	}

	public String getMedPrice() {
		return medPrice;
	}

}

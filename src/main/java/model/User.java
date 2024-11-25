package model;

public class User {
	private int id;
	private String username;
	private String name;
	private String password;
	private String role;

	//static instance of User
	private static User instance;

	//Making the constructor private to prevent instantiation
	private User() {
	}

	//Provide a public static method to get the instance
	public static User getInstance() {
		if (instance == null) {
			instance = new User();
		}
		return instance;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
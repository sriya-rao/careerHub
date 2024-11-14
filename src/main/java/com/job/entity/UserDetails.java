package com.job.entity;


public class UserDetails {

	private Integer id;
	
	public UserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String name;
	
	private String email;
	
	private String pwd;
	
	private String phone;
	
	private String role;

	
	public UserDetails(String name, String email, String pwd, String phone, String role) {
		super();
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.phone = phone;
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", pwd=" + pwd + ", phone=" + phone
				+ ", role=" + role + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	
	
}

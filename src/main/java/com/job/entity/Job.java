package com.job.entity;


public class Job {

    private Integer id;
	
	private String title;
	
	private String description;
	
	private String location;
	
	private String category;
	
	private String status;
	
	private String date;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Job(String title, String description, String location, String category, String status, String date) {
		super();
		this.title = title;
		this.description = description;
		this.location = location;
		this.category = category;
		this.status = status;
		this.date = date;
	}

	@Override
	public String toString() {
		return "Job [id=" + id + ", title=" + title + ", description=" + description + ", location=" + location
				+ ", category=" + category + ", status=" + status + ", date=" + date + "]";
	}

	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}

	

}

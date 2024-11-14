package com.job.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.job.entity.Job;

public class JobDao {

	private Connection connection;

	public JobDao(Connection connection) {
		super();
		this.connection=connection;
		// TODO Auto-generated constructor stub
	}
	
	public Boolean addjob(Job job) throws SQLException {
		PreparedStatement ps=
       connection.prepareStatement("insert into Job(title,description,location,category,status,dt)values(?,?,?,?,?,?)");
		ps.setString(1, job.getTitle());
		ps.setString(2, job.getDescription());
		ps.setString(3, job.getLocation());
		ps.setString(4, job.getCategory());
		ps.setString(5, job.getStatus());
		ps.setString(6, job.getDate().toString());
		int i=ps.executeUpdate();
		if(i==1)
		return true;
		else {
			return false;
		}
	}
	
	
	public List<Job> getAllJobs(){
		List<Job> list=new ArrayList<>();
		
		try {
			PreparedStatement preparedStatement=connection.prepareStatement("SELECT * from job order by id desc");
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				Job job=new Job();
				job.setId(rs.getInt(1));
				job.setTitle(rs.getString(2));
				job.setDescription(rs.getString(3));
				job.setLocation(rs.getString(4));
				job.setCategory(rs.getString(5));
				job.setStatus(rs.getString(6));
				job.setDate(rs.getString(7));
				list.add(job);
			}
			
		} catch (Exception e) {
           e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	public List<Job> getAllActiveJobs(){
		List<Job> list=new ArrayList<>();
		
		try {
			PreparedStatement preparedStatement=connection.prepareStatement("SELECT * from job where status=? order by id desc");
			preparedStatement.setString(1, "active");
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				Job job=new Job();
				job.setId(rs.getInt(1));
				job.setTitle(rs.getString(2));
				job.setDescription(rs.getString(3));
				job.setLocation(rs.getString(4));
				job.setCategory(rs.getString(5));
				job.setStatus(rs.getString(6));
				job.setDate(rs.getString(7));
				list.add(job);
			}
			
		} catch (Exception e) {
           e.printStackTrace();
		}
		
		return list;
	}
	
	
	public Job getJobById(Integer id){
		
		Job job=null;
		try {
			PreparedStatement preparedStatement=connection.prepareStatement("SELECT * from job WHERE id=?");
			preparedStatement.setInt(1, id);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				job=new Job();
				job.setId(rs.getInt(1));
				job.setTitle(rs.getString(2));
				job.setDescription(rs.getString(3));
				job.setLocation(rs.getString(4));
				job.setCategory(rs.getString(5));
				job.setStatus(rs.getString(6));
				job.setDate(rs.getString(7));
			}
			
		} catch (Exception e) {
           e.printStackTrace();
		}
		
		return job;
	}
	
	
	
	public Boolean updateJob(Job job) throws SQLException {
		PreparedStatement ps=
 connection.prepareStatement("update Job set title=?,description=?,location=?,category=?,status=? where id=?");
					ps.setString(1, job.getTitle());
					ps.setString(2, job.getDescription());
					ps.setString(3, job.getLocation());
					ps.setString(4, job.getCategory());
					ps.setString(5, job.getStatus());
					ps.setInt(6, job.getId());
					int i=ps.executeUpdate();
					if(i==1)
					return true;
					else {
						return false;
					}

	}
	
	
	public boolean deleteJob(Integer id) throws SQLException {
		PreparedStatement pStatement=connection.prepareStatement("DELETE from job where id=?");
		pStatement.setInt(1, id);
	  Integer i=pStatement.executeUpdate();
		if(i==1)
			return true;
			else {
				return false;
			}
	}
	
	
	public List<Job> getAllJobsByCategoryAndLocation(String loc,String cat){
		
         List<Job> list=new ArrayList<>();
		
		try {
			PreparedStatement preparedStatement=connection.prepareStatement("SELECT * from job where category=? and location=? and status=? order by id desc");
			preparedStatement.setString(1, cat);
			preparedStatement.setString(2,loc);
			preparedStatement.setString(3,"active");
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				Job job=new Job();
				job.setId(rs.getInt(1));
				job.setTitle(rs.getString(2));
				job.setDescription(rs.getString(3));
				job.setLocation(rs.getString(4));
				job.setCategory(rs.getString(5));
				job.setStatus(rs.getString(6));
				job.setDate(rs.getString(7));
				list.add(job);
			}
			
		} catch (Exception e) {
           e.printStackTrace();
		}
		
		return list;

		
		
		
		
	}
	
	
	
	public List<Job> getAllJobsByCategoryOrLocation(String loc,String cat){
		
        List<Job> list=new ArrayList<>();
		
		try {
			PreparedStatement preparedStatement=connection.prepareStatement("SELECT * from job where category=? or location=? and status=? order by id desc");
			preparedStatement.setString(1, cat);
			preparedStatement.setString(2,loc);
			preparedStatement.setString(3,"active");

			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				Job job=new Job();
				job.setId(rs.getInt(1));
				job.setTitle(rs.getString(2));
				job.setDescription(rs.getString(3));
				job.setLocation(rs.getString(4));
				job.setCategory(rs.getString(5));
				job.setStatus(rs.getString(6));
				job.setDate(rs.getString(7));
				list.add(job);
			}
			
		} catch (Exception e) {
          e.printStackTrace();
		}
		
		return list;

		
		
		
		
	}

}

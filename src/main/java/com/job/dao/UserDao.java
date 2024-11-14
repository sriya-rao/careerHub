package com.job.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.job.entity.UserDetails;

public class UserDao {
	
	private Connection connection;
	
	

	public UserDao(Connection connection) {
		super();
		this.connection=connection;
		// TODO Auto-generated constructor stub
	}



	public Boolean saveUser(UserDetails user) throws SQLException {
		
		PreparedStatement preparedStatement=connection.prepareStatement("insert into UserDetails(name,email,pwd,phone,role) values(?,?,?,?,?)");
		preparedStatement.setString(1, user.getName());
		preparedStatement.setString(2, user.getEmail());
		preparedStatement.setString(3, user.getPwd());
		preparedStatement.setString(4, user.getPhone());
		preparedStatement.setString(5, user.getRole());
	Integer i=	preparedStatement.executeUpdate();
	if(i==1)
		return true;
	else
		return false;
	}
	
	
    public Boolean updateUser(UserDetails user) throws SQLException {
		
		PreparedStatement preparedStatement=connection.prepareStatement("update UserDetails set name=?,email=?,phone=? where id=?");
		preparedStatement.setString(1, user.getName());
		preparedStatement.setString(2, user.getEmail());
		preparedStatement.setString(3, user.getPhone());
		preparedStatement.setInt(4, user.getId());
	Integer i=	preparedStatement.executeUpdate();
	if(i==1)
		return true;
	else
		return false;
	}
	
	public UserDetails validateUser(String email,String pwd) {
		UserDetails userDetails=null;
		try {	
			
			PreparedStatement preparedStatement=connection.prepareStatement("select * from UserDetails where email=? and pwd=?");
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, pwd);
		 ResultSet rs=	preparedStatement.executeQuery();
		 while(rs.next()) {
			 userDetails=new UserDetails();
			 userDetails.setId(rs.getInt(1)); 
			 userDetails.setName(rs.getString(2));
			 userDetails.setEmail(rs.getString(3));
			 userDetails.setPwd(rs.getString(4));
			 userDetails.setPhone(rs.getString(5));
			 userDetails.setRole(rs.getString(6));
			 
		 }
		 
		 
		} catch (Exception e) {
          e.printStackTrace();		
		}
		
		return userDetails;
	}
	
	public UserDetails getUserById(Integer id) {
		UserDetails userDetails=null;
		try {	
			
			PreparedStatement preparedStatement=connection.prepareStatement("select * from UserDetails where id=?");
			preparedStatement.setInt(1, id);
		 ResultSet rs=	preparedStatement.executeQuery();
		 while(rs.next()) {
			 userDetails=new UserDetails();
			 userDetails.setId(rs.getInt(1)); 
			 userDetails.setName(rs.getString(2));
			 userDetails.setEmail(rs.getString(3));
			 userDetails.setPwd(rs.getString(4));
			 userDetails.setPhone(rs.getString(5));
			 userDetails.setRole(rs.getString(6));		 
		 }
	
		} catch (Exception e) {
          e.printStackTrace();		
		}
		
		return userDetails;
	}
}

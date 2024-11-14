package com.job.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.job.entity.Profile;

public class ProfileDao {
	
	private Connection connection;

	public ProfileDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean saveProfile(Profile profile) throws SQLException{
	PreparedStatement preparedStatement=connection.prepareStatement("insert into Profile(user_id,education,exp,years) values(?,?,?,?)");
	preparedStatement.setObject(1, profile.getUser_id());
	preparedStatement.setString(2, profile.getEducation());
	preparedStatement.setString(3, profile.getExp());
	preparedStatement.setString(4, profile.getYears());
		
	Integer i=	preparedStatement.executeUpdate();
	if(i==1)
		return true;
	else
		return false;
	}
	
	public Profile getProfileByUserId(Integer id) throws SQLException{
		PreparedStatement preparedStatement=connection.prepareStatement("select * from Profile where user_id=?");
		preparedStatement.setInt(1, id);
		Profile profile=null;
		ResultSet rs=	preparedStatement.executeQuery();
		 while(rs.next()) {
			 profile=new Profile();
			 profile.setId(rs.getInt(1)); 
			 profile.setUser_id(rs.getInt(2));
			 profile.setEducation(rs.getString(3));
			 profile.setExp(rs.getString(4));
			 profile.setYears(rs.getString(5));
		 } 
		
		return profile;		
	}
		
}

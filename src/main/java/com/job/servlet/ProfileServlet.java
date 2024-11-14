package com.job.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.conn.DBCon;
import com.job.dao.ProfileDao;
import com.job.dao.UserDao;
import com.job.entity.Profile;
import com.job.entity.UserDetails;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			
			Integer user_id=Integer.parseInt(req.getParameter("id"));
			
	        
			
	        String name=req.getParameter("name");
	        String phone=req.getParameter("phone");
	        String email=req.getParameter("email");
	        String education=req.getParameter("edu");
	        String experience=req.getParameter("exp");
	        String years=req.getParameter("years");

	        
	        Profile profile=new Profile();
	        profile.setUser_id(user_id);
	        profile.setEducation(education);
	        profile.setExp(experience);
	        profile.setYears(years);
	        
	        UserDetails details=new UserDetails();
	        details.setId(user_id);
	        details.setName(name);
	        details.setEmail(email);
	        details.setPhone(phone);
	        
			
	        ProfileDao profileDao=new ProfileDao(DBCon.getConnection());
	        boolean isSaved=profileDao.saveProfile(profile);
	        
	        UserDao dao=new UserDao(DBCon.getConnection());
	        Boolean isUpdated=dao.updateUser(details);
	        if(isSaved && isUpdated) {
				session.setAttribute("msg", "Profile updated Successfully");
				resp.sendRedirect("profile.jsp");
			}
			else {
				session.setAttribute("error", "Error in updating profile");
				resp.sendRedirect("profile.jsp");
			}
		
		} catch (Exception e) {

		}
	
	
	
	}

	
}

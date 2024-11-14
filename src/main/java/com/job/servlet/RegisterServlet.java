package com.job.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.conn.DBCon;
import com.job.dao.UserDao;
import com.job.entity.UserDetails;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
	  try {
		
		  String name=req.getParameter("name");
		  String email=req.getParameter("email");
		  String password=req.getParameter("pwd");
		  String phone=req.getParameter("phone");
		  
		  UserDetails user=new UserDetails();
		  user.setEmail(email);
		  user.setName(name);
		  user.setPhone(phone);
		  user.setPwd(password);
		  user.setRole("user");
		  
		  
		  UserDao userDao=new UserDao(DBCon.getConnection());
		 Boolean isSaved= userDao.saveUser(user);
		 if(isSaved) {
			 session.setAttribute("msg", "Registered Successfully");
				resp.sendRedirect("Register.jsp");
		 }else {
			 session.setAttribute("error", "Error! Something went wrong..Try again!!");
				resp.sendRedirect("Register.jsp");
		}
		  
		 
	}
	  catch (Exception e) {
      e.printStackTrace();
	}
	}

	
	
}

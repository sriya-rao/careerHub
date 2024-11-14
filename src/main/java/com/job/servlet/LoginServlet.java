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

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		try {
			
			String email=req.getParameter("email");
			
			String password=req.getParameter("pwd");
			
			UserDetails user=new UserDetails();
			
			
			if("sri@gmail.com".equals(email)&& "sri".equals(password)) {
				session.setAttribute("obj", user);
				user.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}
			else {
			 	UserDao dao=new UserDao(DBCon.getConnection());
			   UserDetails userDetails=	dao.validateUser(email, password);
			    if(userDetails!=null) {
			      session.setAttribute("obj", userDetails);

				resp.sendRedirect("Home.jsp");
			    }
			    else {
			    	session.setAttribute("error", "Invalid credentials!!");
					resp.sendRedirect("login.jsp");
				}
			}
			
		} catch (Exception e) {
           e.printStackTrace();
		}
	}

}

package com.job.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.conn.DBCon;
import com.job.dao.JobDao;
import com.job.entity.Job;


@WebServlet("/add")
public class PostServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
		String title=req.getParameter("title");
		String description=req.getParameter("description");
		String location=req.getParameter("location");
		String category=req.getParameter("category");
		String status=req.getParameter("status");
		
		HttpSession session=req.getSession();

		Job job=new Job();
		job.setTitle(title);
		job.setCategory(category);
		job.setDescription(description);
		job.setLocation(location);
		job.setStatus(status);
		job.setDate(LocalDate.now().toString());
		
		JobDao jobDao=new JobDao(DBCon.getConnection());
		boolean isSaved=jobDao.addjob(job);
		if(isSaved) {
			session.setAttribute("msg", "Job Post Successfully");
			resp.sendRedirect("post_job.jsp");
		}
		else {
			session.setAttribute("error", "Error in Posting job");
			resp.sendRedirect("post_job.jsp");
		}
    	  
	} catch (Exception e) {
          e.printStackTrace();
	}
	
	}
	
	
	
	
	

}

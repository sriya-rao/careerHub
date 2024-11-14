package com.job.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.conn.DBCon;
import com.job.dao.JobDao;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();

		try {
			Integer id=Integer.parseInt(req.getParameter("id"));
			JobDao jobDao=new JobDao(DBCon.getConnection());
	  Boolean isDeleted=    	jobDao.deleteJob(id);
			if(isDeleted) {
				session.setAttribute("msg", "Job deleted Successfully");
				resp.sendRedirect("view.jsp");
			}
			else {
				session.setAttribute("error", "Error in deleting job");
				resp.sendRedirect("view.jsp");
			}
			
		} catch (Exception e) {
           e.printStackTrace();
		}
	
	
	}

}

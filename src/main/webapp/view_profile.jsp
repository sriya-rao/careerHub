<%@page import="com.job.entity.UserDetails"%>
<%@page import="com.job.dao.UserDao"%>
<%@page import="com.job.entity.Profile"%>
<%@page import="com.job.dao.ProfileDao"%>
<%@page import="com.job.entity.Job"%>
<%@page import="com.job.conn.DBCon"%>
<%@page import="com.job.dao.JobDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:if test="${empty obj}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp"%>
<div class="container mt-4">


<%ProfileDao dao=new ProfileDao(DBCon.getConnection());
Profile p=dao.getProfileByUserId(Integer.parseInt(request.getParameter("id")));
UserDao user=new UserDao(DBCon.getConnection());
UserDetails details=user.getUserById(Integer.parseInt(request.getParameter("id")));
%>

<div class="row">
<div class="col">
    
  <div class="row mt-4">
 <div class="col">
     
   <div class="card">
    <div class="card-header text-center">
    <h5>My Profile</h5>
    </div>
    <div class="container text-center mt-2">
  </div>
  <div class="card-body">
  
  <table class="table">
  
  <tr>
  <th>Full name</th>
  <td>  <input type="text" value="<%=details.getName() %>" class="form-control" readonly></td>
  </tr>
  
  
  
  <tr>
  <th>Email</th>
  <td>  <input type="text" value="<%=details.getEmail() %>" class="form-control" readonly></td>
  </tr>
  
  <tr>
  <th>Phone</th>
  <td>  <input type="text" value="<%=details.getPhone() %>" class="form-control" readonly></td>
  </tr>
  
  <tr>
  <th>Education</th>
  <td>  <input type="text" value="<%=p.getEducation() %>" class="form-control" readonly></td>
  </tr>
  
  <tr>
  <th>Experience</th>
  <td>  <input type="text" value="<%=p.getExp() %>" class="form-control" readonly></td>
  </tr>
  
  <tr>
  <th>Years of Exp</th>
  <td>  <input type="text" value="<%=p.getYears() %>" class="form-control" readonly></td>
  </tr>
  
  
  </table>
  
  
   
   <div class="text-center">
   <a class="btn btn-primary" href="profile.jsp">Update profile</a>
   </div>
  </div>
</div> 
    	 
   
    
 </div>
    </div>
    
    </div>
    
    </div>

  </div>
</body>
</html>
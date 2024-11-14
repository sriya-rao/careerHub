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


<%JobDao jobDao=new JobDao(DBCon.getConnection());
Job job=jobDao.getJobById(Integer.parseInt(request.getParameter("id")));

%>

<div class="row">
<div class="col">
    
  <div class="row mt-4">
 <div class="col">
     
   <div class="card">
    <div class="card-header text-center"><h5>Title: <%=job.getTitle() %></h5>
    <b>Publish date: <%=job.getDate() %></b>
  
    </div>
    <div class="container text-center mt-2">
  </div>
  <div class="card-body">
  <div class="row">
  <div class="col-3">
  <h5>Location</h5>
  </div>
  <div class="col-3">
  <input type="text" value="<%=job.getLocation() %>" class="form-control" readonly>
  </div>
  <div class="col-3">
  <h5>Category</h5>
  </div>
  <div class="col-3">
  <input type="text" value="<%=job.getCategory() %>" class="form-control" readonly>
  </div>
  
  </div>
  <hr>
  <hr>
  <div class="row">
  <div class="col-8">
  <h5>Description:</h5>
  
  <p><%=job.getDescription() %></p>
  
  </div>
  
  <div class="col-4">
  
  <a href="apply.jsp" class="btn btn-primary">Apply</a>
  
  </div>
  
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
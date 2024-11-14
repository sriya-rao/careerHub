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
<c:if test="${obj.role ne 'admin'}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp"%>
<div class="container mt-4">

<div class="card">
<div class="card-header text-center">
<%JobDao jobDao=new JobDao(DBCon.getConnection());
Job job=jobDao.getJobById(Integer.parseInt(request.getParameter("id")));

%>
<h4>Edit Jobs</h4>
</div>
<div class="card-body">
<form action=update method=post>
<div class="row">
<div class="col-12">
   <div class="form-group">
    <label>Job Id</label>
    <input type="text" value="<%=job.getId() %>" name="id" class="form-control" readonly>
  </div>

  <div class="form-group">
    <label>Job Title</label>
    <input type="text" value="<%=job.getTitle() %>" name="title" class="form-control" >
  </div>
 </div>
 </div>
 <div class="row">
<div class="col-4">
<div class="form-group">
    <label>Location</label>
    <select class="form-control" name="location">
        <option value="<%=job.getLocation()%>" ><%=job.getLocation() %></option>
    <option value="hyderabad">Hyderabad</option>
        <option value="bangalore">Bangalore</option>
        <option value="chennai">Chennai</option>
        <option value="coimbatore">Coimbatore</option>
    </select>   
  </div>
</div>

<div class="col-4">
<div class="form-group">
    <label>Category</label>
      <select class="form-control" name="category">
        <option value="<%=job.getCategory()%>" ><%=job.getCategory()%></option>
    <option value="it">IT services</option>
        <option value="bank">Banking sector</option>
        <option value="consult">Consulting</option>
        <option value="bpo">BPO</option>
    </select>  
       </div>
</div>

<div class="col-4">
<div class="form-group">
    <label>Status</label>
<select class="form-control" name="status">
        <option value="<%=job.getStatus()%>" ><%=job.getStatus()%></option>

    <option value="active">Active</option>
        <option value="inactive">In-Active</option>
    </select>     
    </div>
</div>
</div> 
  
  <div class="row">
<div class="col-12">
  <div class="form-group">
    <label>Job Description</label>
    <textarea class="form-control" name="description"><%=job.getDescription() %></textarea>
  </div>
  
  
  
  
  
  <div class="text-center">
  <button type="submit" class="btn btn-primary">Update Job</button>
  </div><br>
  
  <c:if test="${not empty msg}">
  <div class="alert alert-success alert-dismissible fade show" role="alert">

  <strong>${msg} </strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
  
</div>
<c:remove var="msg"/>
</c:if>
<c:if test="${not empty error}">
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>${error} </strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<c:remove var="error"/>
</c:if>
  </div>
  </div>
</form>
</div>
</div>
</div>
</body>
</html>
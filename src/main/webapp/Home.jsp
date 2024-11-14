<%@page import="com.job.entity.Job"%>
<%@page import="java.util.List"%>
<%@page import="com.job.conn.DBCon"%>
<%@page import="com.job.dao.JobDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%-- <c:if test="${obj.role ne 'user'}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp"%> --%>
<%@include file="navbar.jsp"%>

<div class="container mb-4">
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
<div class="container mt-4">
<form class="form-inline" action="sort.jsp" method="get">

<div class="form-group col-md-5">
    <label>Location:</label>
    <select class="form-control" name="loc">
        <option value="lo">-select-</option>
    <option value="HYDERABAD">HYDERABAD</option>
        <option value="BANGALORE">BANGALORE</option>
        <option value="CHENNAI">CHENNAI</option>
        <option value="TAMILNADU">TAMILNADU</option>
    </select>   
  </div>

<div class="form-group col-md-5">
    <label>Category</label>
      <select class="form-control" name="category">
              <option value="cat">-select-</option>
    <option value="IT">IT services</option>
        <option value="Bank">Banking sector</option>
        <option value="Consulting">Consulting</option>
        <option value="BPO">BPO</option>    </select>  
       </div>
       <input type="submit" class="btn btn-success" value="Search"> 
</form>
</div>

<div class="row">
<div class="col">
    
  <div class="row mt-4">
 <div class="col">
     
    <%JobDao dao=new JobDao(DBCon.getConnection());
     List<Job> list=dao.getAllActiveJobs();
     for(Job j:list){%>
    	<div class="card">
    <div class="card-header">
    <h5>Title: <%=j.getTitle() %></h5>
    </div>
    <div class="container text-center mt-2">
  </div>
  <div class="card-body">
	<table class="table">
	<tr>
	<th>Description</th>
	<th>Location</th>
	<th>Category</th>
	<th>Publish Date</th>
	<th>Action</th>
</tr>
<tr>
	<td><%=j.getDescription() %></td>
	
	<td><%=j.getLocation() %></td>
	<td><%=j.getCategory() %></td>
	<td><%=j.getDate() %></td>
	<td>      	 <a href="apply.jsp" class="btn btn-warning">Apply</a>
	      	 <a href="single.jsp?id=<%=j.getId() %>" class="btn btn-primary">About</a>
	
	</td>
	</tr>
	</table>
	</div>
  </div> 
   <%}
    %>
    
 </div>
    </div>
    
    </div>
    
    </div>
    </div>
     
</body>
</html>
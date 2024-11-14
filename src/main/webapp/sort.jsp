<%@page import="java.util.ArrayList"%>
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
<c:if test="${obj.role ne 'user'}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
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
</div><c:remove var="error"/>
</c:if>
<div class="container mt-4">
<form class="form-inline" action="sort.jsp" method="get">


<div class="form-group col-md-5">
    <label>Location</label>
    <select class="form-control" name="loc">
        <option value="lo">-select-</option>
    <option value="hyderabad">Hyderabad</option>
        <option value="bangalore">Bangalore</option>
        <option value="chennai">Chennai</option>
        <option value="coimbatore">Coimbatore</option>
    </select>   
  </div>

<div class="form-group col-md-5">
    <label>Category</label>
      <select class="form-control" name="category">
              <option value="ca">-select-</option>
    <option value="it">IT services</option>
        <option value="bank">Banking sector</option>
        <option value="consult">Consulting</option>
        <option value="bpo">BPO</option>
    </select>  
       </div>
       <input type="submit" class="btn btn-success" value="submit"> 
</form>





<%
String location=request.getParameter("loc");
String category=request.getParameter("category");

JobDao jobDao=new JobDao(DBCon.getConnection());
List<Job> list=null;
if("lo".equals(location)&& "ca".equals(category)) {
	list=jobDao.getAllActiveJobs();
}
else if ("lo".equals(location) || "ca".equals(category)) {
	list=jobDao.getAllJobsByCategoryOrLocation(location, category);

}
else {
	list=jobDao.getAllJobsByCategoryAndLocation(location, category);

}
if(list.isEmpty()) {
	%>
	<h5>Not Available</h5>
	<%
}




     
    if(list!=null){
    
    for(Job j:list){%>
    
    <div class="row">
<div class="col">
    
  <div class="row mt-4">
 <div class="col">
    
    	<div class="card">
    <div class="card-header">
    <h5>Title: <%=j.getTitle() %></h5>
    </div>
    <div class="container text-center mt-2">
  </div>
  <div class="card-body">
    <p>Description: <%=j.getDescription() %> </p>
         
     <div class="card-text">
     <p>Location:<%=j.getLocation() %></p>
     <p>Category:<%=j.getCategory() %></p>
     <p>Status:<%=j.getStatus() %></p>
   </div>
   
   
  </div>
  Publish date: <%=j.getDate() %>
  <div class="container text-center mb-2">
      	 <a href="single.jsp?id=<%=j.getId() %>" class="btn btn-success">View More</a>
  
  </div>
</div> 
   <%}
    }
    %>
    
 </div>
    </div>
    
    </div>
    
    </div>
    </div>
     </div>
</body>
</html>
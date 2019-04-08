<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Tech Publishing</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
  background-color: #666;
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 30%;
  height: 300px; /* only for demonstration, should be removed */
  background: #ccc;
  padding: 20px;
}

/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 70%;
  background-color: #f1f1f1;
  height: 300px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
footer {
  background-color: #777;
  padding: 10px;
  text-align: center;
  color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  /*text-align: center;*/
  background-color: #f1f1f1;
  white-space: nowrap; 
  width: 200px; 
  overflow: hidden;
  text-overflow: ellipsis; 
 /* border: 1px solid #000000;*/
}
</style>
</head>
<body>


<header>
  <h2>DashBoard</h2>
</header>

<section> 
<article>
<div class="container">
<table class="table table-striped">
<caption><h3>Articles</h3></caption>
<thead>
<tr class="tr tr-success">
<td>Description</td>
<td>Author Name</td>
<td>Topic</td>
<td>Ratings</td>
<td>Date</td>

</tr>
</thead>
<tbody>
<c:forEach items="${dashboard1}" var="temp">
	<tr>
	<td><div class="card">${temp[0].description} </div>
	<form action="/readmore" method="post">
	<input type="hidden" name ="aid" value="${temp[0].aid }"/>
	 <button type="submit">Read More>></button>
	</form>
	
		
	</td>
	<td>${temp[0].authname}</td>
	<td>${temp[1].areaname}</td>
	<td>${temp[0].rating}</td>
	<td>${temp[0].postdate}</td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>
</article>
  
   <nav>
    <ul>
      <li><a href="#">Profile</a></li>
      <li><a href="/editor">Create Articles</a></li>
   
    </ul>
  </nav>
</section>
<%=session.getAttribute("id") %>
<footer>
 <a href="/logoutUser">Logout</a>
</footer>

</body>
</html>


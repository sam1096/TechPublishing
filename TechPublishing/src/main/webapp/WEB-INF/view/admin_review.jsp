<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<title>Reviewing Articles</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
* {
  box-sizing: border-box;
}

table, th, td {
  border: 1px solid black;
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
  float: right;
  width: 15%;
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
  width: 85%;
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



 
.bt {
    background:none!important;
     border:none; 
     padding:0!important;
    
    /*optional*/
    font-family:arial,sans-serif; /*input has OS specific font-family*/
     color:#069;
     text-decoration:underline;
     cursor:pointer;
}

</style>

<script>
 function publishdata(id)
 { 
   if (confirm("Do you want to publish an article")) {
	   
	 	$.ajax({ type :'POST',
	 		contentType :"application/json",
	 		url:"publisharticle/"+id,
	 		success: function(data)
	 		{ alert("Article has been published!");
	 		  setTimeout(function(){
	 	           location.reload();
	 	      }, 100);
	 		},
	 		error: function(data)
	 		{alert("some error has occured in publishing an article");
	 			
	 		}
	 		
	 	});
	  } else {alert("Article has not been published!");
	   
 }
 }

</script>




<script>
 function deletedata(id)
 {   if (confirm("Do you want to reject an article")) { 
	  var reason = prompt("Please enter Reason for Rejection:", "");
	  if (reason == null || reason == "") {
             alert("please specify the reason for rejecting the article.");
	  } else { id=id+"_"+reason;
	           alert(id);
	  $.ajax({ type :'POST',
	 		contentType :"application/json",
	 		url:"rejectarticle/"+id,
            success: function(data)
	 		{ alert("Article has been rejected!");
	 	      setTimeout(function(){
	 	           location.reload();
	 	      }, 100);
	 		},
	 		error: function(data)
	 		{alert("failed");
	 			
	 		}
	 		
	 	});
	  }
 }
 else {alert("Article has not been rejected");
 
 }
 }

</script> 








<script type="text/javascript">
$(document).ready(function(){
	var maxLength = 25;
	$(".show-read-more").each(function(){
		var myStr = $(this).text();
		if($.trim(myStr).length > maxLength){
			var newStr = myStr.substring(0, maxLength);
			
			$(this).empty().html(newStr);
			$(this).append(' ...');
			$(this).append(' ');

		}
	});

});
</script>



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
<td>Author name</td>
<td>Post Date</td>
<td>Review</td>
</tr>
</thead>
<tbody>
<c:forEach items="${articles}" var="temp">
	<tr>
   	<td>
   	
   	    <p class="show-read-more">${temp.description} </p>
    	
     	 <form  class="read" action="/read_article" id='form1' method='POST' >
            <input type='hidden' id='newfield' name='newfield' value="${temp.aid}"/>
            <button class="bt"type="submit" id='b1' >read more.. </button> 
         </form>
      

    </td> 

	<td>${temp.authname}</td>
	<td>${temp.postdate}</td>

 
      <td>
    <button onclick="publishdata(${temp.aid})"  class="btn btn-success btn-md"><span class="glyphicon glyphicon-ok"></span> </button>
    
    <button onclick="deletedata(${temp.aid})" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button>
  
 
      </td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>
</article>
  
   <nav>
    <ul>
      <li><a href="/admin_profile">Profile</a></li>
      <li><a href="/editor">Create Articles</a></li>
      
    </ul>
  </nav>
</section>

<footer>
  <p>Footer</p>
  <a href="/logoutAdmin">Logout</a>
</footer>


</body>
</html>
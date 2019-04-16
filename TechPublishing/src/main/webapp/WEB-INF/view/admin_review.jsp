<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>TechPublishing</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">



<link href="static/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<link href="static/js/bootstrap.min.js" rel="stylesheet">


<!-- for media images ex facebook google -->
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<link href="static/css/style.css" rel="stylesheet">

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
	<nav class="navbar navbar-expand-md  sticky-top ">
		<div class="container-fluid ">
			<a class="navbar-brand" href="welcomepage"><img
				src="static/images/tech_geek_logo"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav ml-auto">
					<li><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Connect</a></li>
					<li><a href="/admin_profile">Profile</a></li>
					<li><a href="/logoutUser">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">
		<div class="row">

			<div class="col-sm-2">
				<h3>EDITOR</h3>
				<p>Something on mind write here!!!</p>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a href="/editor">Create Article</a></li>
				</ul>
			</div>

			<div class="col-sm-10">
				<article>
					<div class="container">
						<table>
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

											<p class="show-read-more">${temp.description}</p>

											<form class="read" action="/read_article" id='form1'
												method='POST'>
												<input type='hidden' id='newfield' name='newfield'
													value="${temp.aid}" />
												<button class="bt" type="submit" id='b1'>read
													more..</button>
											</form>


										</td>

										<td>${temp.authname}</td>
										<td>${temp.postdate}</td>


										<td>
											<button onclick="publishdata(${temp.aid})"
												class="btn btn-success btn-md">
												<span class="glyphicon glyphicon-ok"></span>
											</button>

											<button onclick="deletedata(${temp.aid})"
												class="btn btn-danger">
												<span class="glyphicon glyphicon-remove"></span>
											</button>


										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</article>
			</div>
		</div>
	</div>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>


</body>
</html>
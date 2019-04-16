<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<title>Reviewing Articles</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

	<nav class="navbar navbar-inverse">
		<div class="container-fluid" style="background-color: #34495e;">
			<a class="navbar-brand" href="welcomepage"><img
				src="static/images/tech_geek_logo"></a>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/welcomepage">Home</a></li>

				<li><a href="#">About</a></li>
				<li><a href="#">Connect</a></li>

				<li><a href="/admin_profile">Profile</a></li>
				<li><a href="/logoutAdmin">Logout</a></li>
			</ul>

		</div>
	</nav>
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-2">
				<h3>EDITOR</h3>
				<p>Something on mind write here!!!</p>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a href="/editor_admin">Create
							Article</a></li>
				</ul>

				<hr class="d-sm-none">
			</div>
			<div class="col-sm-10">
				<article>
					<div class="container">
						<table class="table table-striped">
							<caption>
								<h3>Articles</h3>
							</caption>
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




	<footer class="page-footer font-small blue footer">

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3 footer_align">©
			2019 Copyright: TechPublishing.com</div>
		<!-- Copyright -->

	</footer>


</body>
</html>
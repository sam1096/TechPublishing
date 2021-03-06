<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>TechPublishing</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="static/css/bootstrap.min.css" rel="stylesheet">
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" -->
<!-- 	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" -->
<!-- 	crossorigin="anonymous"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<link href="static/js/bootstrap.min.js" rel="stylesheet"> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<link href="static/css/style.css" rel="stylesheet">


<script type="text/javascript">
$(document).ready(function(){
	var maxLength = 12;
	$(".show-read-more").each(function(){
		var myStr = $(this).text();
		if($.trim(myStr).length > maxLength){
			var newStr = myStr.substring(0, maxLength);
			
			$(this).empty().html(newStr);
			$(this).append(' ...');
			

		}
	});

});
</script>




</head>


<body>

	<nav class="navbar navbar-expand-md sticky-top usernav">
		<div class="container-fluid ">
			<a class="navbar-brand" href="welcomepage"><img
				src="static/images/tech_geek_logo"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class=" nav navbar-nav ml-auto">
					<li><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Connect</a></li>

					<li><a href="/userprofile">Profile</a></li>
					<li><a href="/logoutUser">Logout</a></li>

				</ul>
			</div>
		</div>
	</nav>


	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-2" style="margin-left:-8%;">
				<h3>EDITOR</h3>
				<p>Something on mind write here!!!</p>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a href="/editor">Create Article</a></li>
				</ul>

				<hr class="d-sm-none">
			</div>

			<div class="col-sm-4">
				<article>
					<div class="container">
						<table style="margin-left:3%;width:90%;">
							<thead>
								<tr class="tr tr-success">
									<th>Description</th>
									<th>Author Name</th>
									<th>Topic</th>
									<th>Ratings</th>
									<th>Date</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dashboard1}" var="temp">
									<tr>
										<td >
											
											<p class="show-read-more" style="width:50%;">
${temp[0].description}
</p>
												
												<form action="/readmore" method="post">
													<input type="hidden" name="aid" value="${temp[0].aid }" />
													<button class="readmoreButton" type="submit">
														<span>Read more</span>
													</button>
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
			</div>
		</div>
	</div>
	<footer id="footer">
		<p>© 2019 Copyright: TechPublishing.com</p>
	</footer>

</body>
</html>


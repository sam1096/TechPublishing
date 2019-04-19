<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>TechPublishing</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/js/bootstrap.min.js" rel="stylesheet"> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="static/css/style.css" rel="stylesheet">


<script type="text/javascript">
	$(document).ready(function() {
		var maxLength = 100;
		$(".show-read-more").each(function() {
			var myStr = $(this).text();
			if ($.trim(myStr).length > maxLength) {
				var newStr = myStr.substring(0, maxLength);

				$(this).empty().html(newStr);
				$(this).append(' ...');

			}
		});

	});
</script>




</head>


<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid" style="background-color: #34495e;">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><font color="white">Tech
						Publishing Platform</font></a>
			</div>
			<ul class=" nav navbar-nav ml-auto navbar-right">
				<li><a href="/adminHome"><font color="white">Home</font></a></li>
				<li><a href="/about"><font color="white">About</font></a></li>
				<li><a href="#"><font color="White">Connect</font></a></li>
				<li><a href="/userprofile"><font color="white">Profile</font></a></li>
				<li><a href="/logoutUser"><font color="white">Logout</font></a></li>
			</ul>
		</div>
	</nav>

	<div class="container" style="margin-top:4%; ">
		<div class="row">
			<div class="col-sm-2" style="margin-left: -7%; margin-top: 2%;">
				<h3>EDITOR</h3>
				<p>Something on mind write here!!!</p>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a href="/editor">Create Article</a></li>
				</ul>
			</div>

			<div class="col-sm-10" style="margin-left:-1%; margin-top: 2%;">
				<article>
					<div class="container">
						<table>
							<thead>
								<tr class="tr tr-success">
									<th class="col-sm-4">Description</th>
									<th class="col-sm-2">Author Name</th>
									<th class="col-sm-2">Topic</th>
									<th class="col-sm-2">Ratings</th>
									<th class="col-sm-2">Date</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dashboard1}" var="temp">
									<tr>
										<td class="col-sm-4">

											<article class="show-read-more">${temp[0].description}
											</article>

											<form action="/readmore" method="post">
												<input type="hidden" name="aid" value="${temp[0].aid }" />
												<button class="readmoreButton" type="submit">
													<span>Read more</span>
												</button>
											</form>

										</td>
										<td class="col-sm-2">${temp[0].authname}</td>
										<td class="col-sm-2">${temp[1].areaname}</td>
										<td class="col-sm-2">${temp[0].rating}</td>
										<td class="col-sm-2">${temp[0].postdate}</td>
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


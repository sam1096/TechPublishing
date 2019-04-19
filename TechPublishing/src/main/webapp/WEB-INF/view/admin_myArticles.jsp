<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	<nav class="navbar navbar-inverse">
		<div class="container-fluid" style="background-color: #34495e;">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><font color="white">Tech Publishing Platform</font></a>
			</div>
			<ul class=" nav navbar-nav ml-auto navbar-right">
				<li><a href="/adminHome"><font color="white">Home</font></a></li>
				<li><a href="/about"><font color="white">About</font></a></li>
				<li><a href="#"><font color="White">Connect</font></a></li>
				<li><a href="/admin_profile"><font color="white">Profile</font></a></li>
				<li><a href="/logoutUser"><font color="white">Logout</font></a></li>
			</ul>
		</div>
	</nav>

	<div id="con">
		<div id="container">
			<div id="first">
				<div class="car">
					<img src="/images/1.png" alt="John" style="width: 100%">
					<h1>${admin.name}</h1>
					<p class="title">ADMIN</p>
					<p>
						<button onclick="location.href='admin_profile';" style="background:#3CB371;">Basic
							Details</button>
						<br>
						<button onclick="location.href='admin_reviewed';" style="background:#3CB371;">Article
							Reviewed</button>
						<br>
						<button onclick="location.href='admin_myArticles';" style="background:#3CB371;">My
							articles</button>
					</p>
				</div>
			</div>
			<div id="second">


				<nav class="inside_nav">
					<ul class="inside_nav_admin">
						<li class="inside_nav_spacing"><a href="admin_profile">Basic
								Details</a></li>
						<li class="inside_nav_spacing"><a
							href="/admin_reviewed">Articles Reviewed</a></li>
						<li class="active inside_nav_spacing"><a href="/admin_myArticles">My
								Articles</a></li>
						<li class="inside_nav_spacing"><a href="/admin_pass">Change
								Password</a></li>
						<li class="inside_nav_spacing"><a href="/admin_area">Interests</a></li>
					</ul>
				</nav>

				<div class="contain">

					<table>
						<caption>
							<h3>Articles Posted By You !!!</h3>
						</caption>
						<thead>
							<tr class="tr tr-success">

								<th class="col-sm-2">Description</th>
								<th class="col-sm-2">Author</th>
								<th class="col-sm-2">Review Date</th>
								<th class="col-sm-2">Post Date</th>
								<th class="col-sm-2">Status</th>
								<th class="col-sm-2">Reason</th>
								<th class="col-sm-2">Rating</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${articles}" var="temp">
								<tr>
									<td class="col-sm-2">

										<article class="show-read-more">${temp.description}</article>

										<form class="read" action="/read_article" id='form1'
											method='POST'>
											<input type='hidden' id='newfield' name='newfield'
												value="${temp.aid}" />
											<button class="readmoreButton"type="submit" id='b1'><span>Read more</span></button>
										</form>


									</td>

									<td class="col-sm-2">${temp.authname}</td>
									<td class="col-sm-2">${temp.postdate}</td>
									<td class="col-sm-2">${temp.reviewdate}</td>
									<td class="col-sm-2">${temp.status}</td>
									<td class="col-sm-2">${temp.reason}</td>
									<td class="col-sm-2">${temp.rating}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>



			</div>

		</div>


	</div>




</body>
</html>

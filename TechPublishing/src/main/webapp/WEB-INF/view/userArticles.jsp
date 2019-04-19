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
<link href="static/css/style.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
				<a class="navbar-brand" href="#"><font color="white">Tech
						Publishing Platform</font></a>
			</div>
			<ul class=" nav navbar-nav ml-auto navbar-right">
				<li><a href="/userHome"><font color="white">Home</font></a></li>
				<li><a href="/about"><font color="white">About</font></a></li>
				<li><a href="#"><font color="White">Connect</font></a></li>
				<li><a href="/userprofile"><font color="white">Profile</font></a></li>
				<li><a href="/logoutUser"><font color="white">Logout</font></a></li>
			</ul>
		</div>
	</nav>


	<div id="con">
		<div id="container">
			<div id="first">
				<div class="car">
					<img src="/images/1.png" alt="John" style="width: 100%">
					<h1>${user.firstname} ${user.lastname}</h1>
					<p class="title">USER</p>
					<p>
						<button onclick="location.href='userprofile';"
							style="background: #3CB371;">Basic Details</button>
						<br>
						<button onclick="location.href='area';"
							style="background: #3CB371;">Areas</button>
						<br>
						<button onclick="location.href='userArticles';"
							style="background: #3CB371;">My articles</button>
					</p>
				</div>
			</div>

			<div id="second">

				<nav class="inside_nav">
					<ul class="inside_nav_admin">
						<li class="inside_nav_spacing_user"><a href="userprofile">Basic
								Details</a></li>
						<li class="inside_nav_spacing_user"><a href="/area">Interests</a></li>
						<li class="active inside_nav_spacing_user"><a
							href="/userArticles">My Articles</a></li>
						<li class="inside_nav_spacing_user"><a href="/user_pass">Change
								Password</a></li>
					</ul>
				</nav>


				<div class="contain">

					<table>
						<caption>
							<h3>Articles Posted By You!!</h3>
						</caption>
						<thead>
							<tr class="tr tr-success">

								<th class="col-sm-4">Description</th>
								<th class="col-sm-2">Ratings</th>
								<th class="col-sm-2">Status</th>
								<th class="col-sm-2">Post Date</th>
								<th class="col-sm-2">Review Date</th>
								<th class="col-sm-2">Reason</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${articleinfo}" var="temp">
								<tr>
									<td class="col-sm-4">

										<article class="show-read-more">${temp.description}</article> <c:set
											var="status" value="${temp.status}" /> <c:set var="reject"
											value="rejected" /> <c:choose>
											<c:when test="${status==reject}">
                                                 	<form action="/reject_user" method="post">
													<input type="hidden" name="aid" value="${temp.aid }" />

													<button class="readmoreButton" type="submit" id='b2'>
														<span>Read more</span>
													</button>

												</form>

											</c:when>
											<c:otherwise>
												<form action="/readmore" method="post">
													<input type="hidden" name="aid" value="${temp.aid }" />

													<button class="readmoreButton" type="submit" id='b1'>
														<span>Read more</span>
													</button>

												</form>
											</c:otherwise>
										</c:choose>



									</td>
									<td class="col-sm-2">${temp.rating}</td>
									<td class="col-sm-2">${temp.status}</td>
									<td class="col-sm-2">${temp.postdate}</td>
									<td class="col-sm-2">${temp.reviewdate}</td>
									<td class="col-sm-2">${temp.reason}</td>

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

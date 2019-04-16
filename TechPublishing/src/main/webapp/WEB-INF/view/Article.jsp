<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Article</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function(){
		$("#comment_page").load("/getComments");
	});
	$(document).ready(function(){
		$("#upload_comment").click(function(){
			var aid = $("#article_id").val();
			var comment = $("#comment_desc").val();
			$.ajax({
				url:'comment_section',
				data: {
					article_id: aid,
					comment_desc : comment
				},
				success: function(response) {
					$("#comment_page").html(response);
				}
			});
			$("#comment_desc").val('');
		});
	});
</script>
</head>
<body>

	<!-- Navigation bar -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Cart</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/welcomepage">Home</a></li>

				<li><a href="#">About</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/logoutUser"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</nav>
	<!---------- end ----------------->



	<c:forEach items="${article}" var="temp">
		<div class="card"
			style="margin-top: 8%; margin-left: 5%, margin-right:5%">
			<div class="jumbotron-fluid" align="center"
				style="background-color: skyblue; width: 50%; margin-left: 25%;">
				<font size="5" face="verdana">${temp.description}</font>
			</div>
			<input type=hidden name="articleId" value="${temp.aid}">
			<div>${temp.aid}</div>
		</div>
		<div style="text-align: left;">
			<h1>Comments</h1>
			<div id="comment_page"><jsp:include page="comments.jsp" /></div>

			<form action="/comment_section" method="post" name="comment_form"
				id="comment_saving">
				<div class="container-fluid">
					<div class="panel-primary">
						<div class="panel-heading">
							<!--  <h1 class="panel-title">COMMENT BOX USING AJAX THROUGH JSP</h1>-->
						</div>
						<div class="panel-body">
							<div class="form-group col-md-4">
								<label>${user.username}</label> <input id="article_id"
									type=hidden name="articleId" value="${temp.aid}">


							</div>
							<div class="form-group col-md-4">
								<label>YOUR COMMENT</label>
								<textarea id="comment_desc" class="form-control" rows="5"
									id="comment" name="comdesc" required="required"></textarea>
							</div>
							<div class="clearfix"></div>
							<div class="form-group col-md-6">
								<button type="button" name="upload_comment" id="upload_comment"
									value="Post">Upload</button>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</c:forEach>
</body>
</html>
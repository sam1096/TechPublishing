<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	padding: 16px;
	text-align: center;
	background-color: #f1f1f1;
}
</style>
<title>Article</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>

	<c:forEach items="${article}" var="temp">
		<div class="card"
			style="margin-top: 8%; margin-left: 5%, margin-right:5%">
			${temp.description}
			<input type=hidden name="articleId" value="${temp.aid}"> 
			<div>
			${temp.aid}
			</div>
		</div>
		<div style="text-align: left;">
			<h1>Comments</h1>
			<div id="display_comment">
				<c:forEach items="${commentList}" var="cmt">
					<div class="media">
						<div class="media-body">
							<h4 class="media-heading">${cmt.authname}</h4>
							<p>${cmt.comdesc}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<form action="/comment_section" method="post" name="comment_form"
				id="comment_saving">
				<div class="container-fluid">
					<div class="panel-primary">
						<div class="panel-heading">
							<!--  <h1 class="panel-title">COMMENT BOX USING AJAX THROUGH JSP</h1>-->
						</div>
						<div class="panel-body">
							<div class="form-group col-md-4">
								<label>USER NAME</label> <input class="form-control"
									name="authname" type="text" id="username"
									value="${cmt.authname }">
				    	<input type=hidden name="articleId" value="${temp.aid}"> 
							

							</div>
							<div class="form-group col-md-4">
								<label>YOUR COMMENT</label>
								<textarea class="form-control" rows="8" id="comment"
									name="comdesc" required="required" value="${cmt.comdesc }"></textarea>
							</div>
							<div class="clearfix"></div>
							<div class="form-group col-md-6">
								<button type="submit" name="upload_comment" id="upload_comment"
									value="Post" onsubmit="setTimeout(function(){window.location.reload();},10)">Upload</button>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</c:forEach>
</body>
</html>
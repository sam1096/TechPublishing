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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.2/css/font-awesome.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/js/star-rating.min.js"></script>
	
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
<style>
.star-rating {
  line-height:32px;
  font-size:1.25em;
}

.star-rating .fa-star{color: yellow;}
</style>
<script>

	function ratedata(id)
 {   if (confirm("Do you want to rate this article")) { 
	  //var reason = $("#").value;
	      var reason = document.getElementById("count-existing")..innerText;
	  
	     id=id+"_"+reason;
	           alert(id);
	  $.ajax({ type :'POST',
	 		contentType :"application/json",
	 		url:"ratings/"+id,
            success: function(data)
	 		{ alert("Article has been rated!");
	 	      setTimeout(function(){
	 	           location.reload();
	 	      }, 100);
	 		},
	 		error: function(data)
	 		{alert("failed");
	 			
	 		}
	 		
	 	});
	  }
 
 else {alert("Article has not been rated");
 
 }
 }
</script>
<style>
.rating {
    width: 300px;
    height: 34px;
    background-color: #f6f3f3;
}
 
.rating label {
    text-indent: -100px;
    width: 40px !important;
    height: 30px;
    overflow: hidden;
    cursor: pointer;
}
 
.label {
    float: left;
    padding-top: 3px;
}
         
input[type="radio"] {
    padding-right: 4px;
    position: absolute;
    left: 340px;
    margin-top: 10px;
}
                 
input[type="radio"], .rating label.stars {
    float: right;
    line-height: 30px;
    height: 30px;
}
 
span + input[type=radio] + label, legend + input[type=radio] + label {
    clear: right;
    margin-right: 80px;
    counter-reset: checkbox;
}
 
.rating input[type="radio"]:required + label:after {
    content: '';
    position: absolute;
    left: 340px; 
    min-height: 10px;
    margin-top: -36px;
    text-align: right;
    background: #6cbf00;
    padding: 10px 10px;
    display: block;
    width: 50px;
}
 
.rating label.stars {
    background: transparent url('http://www.findsourcecode.com/wp-content/uploads/2014/04/star_off.png') no-repeat center center;
}
 
.rating label.stars:hover ~ label.stars, 
.rating label.stars:hover, 
.rating input[type=radio][name=stars]:checked ~ label.stars {
    background-image: url('http://www.findsourcecode.com/wp-content/uploads/2014/04/star.png');
    counter-increment: checkbox;
}
 
.rating input[type=radio][name=stars]:required + label.stars:after {
    content: counter(checkbox) " stars!";
}
</style>
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


<!---------------------Displaying article----------------------->
	<c:forEach items="${article}" var="temp">
		<div class="card"
			style="margin-top: 8%; margin-left: 5%, margin-right:5%">
			<div class="jumbotron-fluid" align="center"
				style="background-color: skyblue; width: 50%; margin-left: 25%;">
				<font size="5" face="verdana">${temp.description}</font>
			</div>
			<input type=hidden name="articleId" value="${temp.aid}">
		</div>
		
		<!---------------------Displaying article----------------------->
	
		
		<!---------------------Displaying ratings----------------------->
		<c:set var="rateByUser" value="${rateByUser}" /> 
<c:choose>
    <c:when test="${rateByUser==null}">
    	<h3>You haven't rated this Article.</h3>
    </c:when>
    <c:otherwise>
   <h3>You have rated this article: ${rateByUser.rating} stars </h3>
    </c:otherwise>      
</c:choose>
		
		<h3>Give your Ratings!!</h3>
		<form action="/ratings" method="post">
		 <fieldset class="rating">     
        <input type="radio" name="stars" id="4_stars" value="4" >
        <label class="stars" for="4_stars">4 stars</label>
        <input type="radio" name="stars" id="3_stars" value="3" >
        <label class="stars" for="3_stars">3 stars</label>
        <input type="radio" name="stars" id="2_stars" value="2" >
        <label class="stars" for="2_stars">2 stars</label>
        <input type="radio" name="stars" id="1_stars" value="1" >
        <label class="stars" for="1_stars">1 star</label>
        <input type="radio" name="stars" id="0_stars" value="0" required>
        <label class="stars" for="0_stars">0 star</label>
        <span  class="label"> Rating: </span>
    </fieldset>
    <input type="hidden" name="aid" value="${temp.aid}"/>
    <button type="submit">Submit</button>
</form>
         
<%--         <button onclick="ratedata(${temp.aid})" type="button" id="rate">Submit</button> --%>
  
		
		
		
		
		
		
		

		<!---------------------Displaying ratings----------------------->
		<!---------------------Displaying comments----------------------->
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
		<!---------------------Displaying comments----------------------->
	</c:forEach>
</body>
</html>
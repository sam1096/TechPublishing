<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<head>

<title>Toolbar with TextArea </title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!--  <link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />

<link rel="stylesheet" href="examples.css" type="text/css" />
-->

<script src="https://cloud.tinymce.com/5/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea',theme:'modern',skin:'lightgray'});</script>

<!--  <script src="//cdn.ckeditor.com/4.11.3/full/ckeditor.js"></script>

<script type="text/javascript" src="jquery/jquery-1.3.2.js"></script>

<script type="text/javascript" src="jquery/jquery.wysiwyg.js"></script>
-->

<script type="text/javascript">

$(function()

{

$('#wysiwyg').wysiwyg();

});

</script>

</head>

<body>

<h1>Toolbar with TextArea </h1>

<div>

<!--  <textarea name="wysiwyg" id="wysiwyg" rows="5" cols="47"></textarea> -->

<textarea name="wysiwyg" id="wysiwyg"></textarea> 

</div>

</body>

</html>